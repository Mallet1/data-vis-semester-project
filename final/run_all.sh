#!/bin/bash
# Simple script to generate visualizations
# Run from the final/ directory
# Tested on Python 3.9.18

echo "Chicago Crime Data Visualization - Build Script"
echo "================================================"
echo ""

# Check if data file exists
if [ ! -f "../data/Crimes_-_2001_to_Present_20251118.csv" ]; then
    echo "ERROR: Data file not found!"
    echo "Please ensure the data file is at: ../data/Crimes_-_2001_to_Present_20251118.csv"
    exit 1
fi

# Check Python version
if ! command -v python3 &> /dev/null; then
    echo "ERROR: python3 not found!"
    exit 1
fi

# Install dependencies if needed
echo "Checking dependencies..."
if ! python3 -c "import pandas, numpy, matplotlib, jupyter" 2>/dev/null; then
    echo "Installing dependencies from ../requirements.txt..."
    pip install -q -r ../requirements.txt
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to install dependencies"
        exit 1
    fi
    echo "✓ Dependencies installed"
else
    echo "✓ All dependencies available"
fi

# Ensure figures directory exists
mkdir -p figures

# Use python3 -m jupyter if jupyter command not in PATH
if command -v jupyter &> /dev/null; then
    JUPYTER_CMD="jupyter"
elif python3 -c "import jupyter" 2>/dev/null; then
    JUPYTER_CMD="python3 -m jupyter"
else
    echo "ERROR: jupyter not available even after installation attempt"
    echo "Try installing manually: pip install jupyter"
    exit 1
fi

echo "Converting notebook to Python script..."
$JUPYTER_CMD nbconvert --to script visualizations.ipynb 2>/dev/null

if [ -f "visualizations.py" ]; then
    
    echo "Executing script to generate visualizations..."
    
    # Create a simple wrapper to handle IPython magic commands
    python3 << 'PYEOF'
import re

# Read the converted script
with open('visualizations.py', 'r') as f:
    script = f.read()

# Remove IPython magic commands
script = re.sub(r'get_ipython\(\)\.run_line_magic\([^)]+\)', '', script)
script = re.sub(r'get_ipython\(\)\.[^;]+;', '', script)

# Replace interact() calls with simple function calls
script = re.sub(r'interact\(create_heatmap, crime_type=dropdown\)', 'create_heatmap("All")', script)

# Execute
exec(compile(script, 'visualizations.py', 'exec'))
PYEOF
        
    # Clean up
    rm -f visualizations.py
    
    # Check results
    if [ -f "figures/viz1.png" ] && [ -f "figures/viz2.png" ] && [ -f "figures/viz3.png" ]; then
        echo ""
        echo "✓ All visualizations generated successfully!"
        ls -lh figures/*.png
    else
        echo ""
        echo "⚠ Some visualizations may not have been generated."
        echo "  Run 'jupyter notebook visualizations.ipynb' for interactive execution."
    fi
else
    echo "ERROR: Could not convert notebook to script"
    echo "Try running manually: jupyter notebook visualizations.ipynb"
    exit 1
fi

echo ""
echo "Done!"
