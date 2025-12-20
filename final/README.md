# Final Submission: Chicago Crime Data Visualization

## Overview
This project presents three visualizations analyzing temporal and spatial crime patterns in Chicago using 2024 crime data. The visualizations are designed for law enforcement officials, city planners, and public safety decision-makers.

## Deliverables

### Report Documents
- **executive_summary.md**: One-page summary of audience, problem, key insights, and hero figure
- **method_design_notes.md**: Detailed methodology, design choices, limitations, and ethics discussion (3-5 pages)

### Visualizations
All figures are in the `figures/` directory:
- **viz1.png**: Interactive Temporal Crime Patterns Heatmap (Figure 1)
- **viz2.png**: Monthly Crime Trends by Type - Small Multiples (Figure 2)
- **viz3.png**: Crime Hotspot Map - Geographic (Figure 3)

### Reproducibility
- **run_all.sh**: Build script to set up environment and generate visualizations
- **visualizations.ipynb**: Complete implementation code (notebook in final/ directory)
- **../requirements.txt**: Python dependencies
- **../notebooks/viz_part3.ipynb**: Original notebook (for reference)

## Quick Start

### Option 1: Using the Build Script
```bash
cd final/
./run_all.sh
```

### Option 2: Manual Setup
```bash
# Install dependencies
pip install -r ../requirements.txt

# Run the notebook (from final/ directory)
jupyter notebook visualizations.ipynb
```

## File Map

```
final/
├── README.md                    # This file
├── executive_summary.md         # Executive summary (≤1 page)
├── method_design_notes.md      # Method & design notes (3-5 pages)
├── report.md                    # Complete final report
├── visualizations.ipynb        # Complete implementation notebook
├── run_all.sh                  # Build/run script
└── figures/                    # Final visualization outputs
    ├── viz1.png                # Figure 1: Temporal heatmap
    ├── viz2.png                # Figure 2: Monthly trends
    └── viz3.png                # Figure 3: Geographic map
```

## Data Access

The data file is located at: `../data/Crimes_-_2001_to_Present_20251118.csv`

If the data file is missing:
1. Download from: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data
2. Filter to 2024 data only
3. Place in `data/` directory

## Environment Requirements

- Python 3.x (tested on Python 3.9.18)
- Jupyter Notebook
- Dependencies listed in `../requirements.txt`:
  - pandas >= 2.0.0
  - numpy >= 1.24.0
  - matplotlib >= 3.7.0
  - seaborn >= 0.12.0
  - ipywidgets >= 8.0.0

## Key Features

### Figure 1: Interactive Temporal Heatmap
- Interactive filtering by crime type (ipywidgets dropdown)
- Color-blind safe Viridis colormap
- Shows crime patterns by hour of day and day of week

### Figure 2: Monthly Trends Small Multiples
- Standardized y-axis (0-7,000) for direct comparison
- Top 6 crime types shown
- Color-blind safe Set2 palette

### Figure 3: Geographic Hotspot Map
- All crimes shown in gray
- Top crime type (THEFT) highlighted in red
- Landmark markers for geographic context
- Ethical disclaimer included

## Design Principles

- **Accessibility**: All color palettes are color-blind safe
- **Clarity**: Clear captions, labels, and legends on all figures
- **Ethics**: Explicit notes about data limitations and reporting bias
- **Reproducibility**: Complete code in single notebook, documented data pipeline

## License

Data: Public domain (City of Chicago)
Code: See project root for license information

## Contact

For questions about this visualization project, see the main project README at `../README.md`.

