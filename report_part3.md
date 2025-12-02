# Part 3: Implementation

## Visualizations

All visualizations are implemented in `viz_part3.ipynb` - a single Jupyter notebook containing code and outputs for all three visualizations.

### Viz1: Interactive Temporal Crime Patterns Heatmap
**Implementation**: Matplotlib heatmap with ipywidgets dropdown filter  
**Type**: Interactive heatmap  
**Question Addressed**: Q1 - How do crime patterns vary by time of day and day of week across different crime types?

**Implementation Details**:
- Interactive filtering by crime type (ipywidgets dropdown)
- Color-blind safe Viridis color scale
- Updates dynamically when crime type is selected
- Works natively in Jupyter notebooks

### Viz2: Monthly Crime Trends by Type (Small Multiples)
**Implementation**: Matplotlib small multiples  
**Type**: Small multiples (temporal)  
**Question Addressed**: Q1 - Temporal patterns over longer time scale

**Implementation Details**:
- 6 small multiple bar charts (one per crime type)
- Shows monthly trends for top 6 crime types
- Color-blind safe Set2 palette

### Viz3: Crime Hotspot Map (Geographic)
**Implementation**: Matplotlib geographic scatter plot  
**Type**: Non-cartesian (geographic map)  
**Question Addressed**: Q5 - What are the spatial patterns of crime across Chicago, and do hotspots exist for specific crime types?

**Implementation Details**:
- Geographic scatter plot using latitude/longitude coordinates
- Non-cartesian visualization (uses geographic coordinate system, not x/y axes)
- Shows crime locations across Chicago with top crime type highlighted
- Color-blind safe palette

## Cognitive Channel Mapping

### Viz1: Interactive Temporal Heatmap

| Element | Mark | Channel | Rationale |
|---------|------|---------|-----------|
| Time of day | Rectangle (cell) | Position (x-axis) | Ordinal encoding - hours naturally ordered |
| Day of week | Rectangle (cell) | Position (y-axis) | Ordinal encoding - days naturally ordered |
| Crime count | Rectangle (cell) | Color saturation (viridis scale) | Quantitative encoding - magnitude clearly visible |
| Crime type filter | Dropdown | N/A | Categorical filter - allows exploration |
| Exact count | Tooltip | Text | Precise quantitative value on demand |

**Task Alignment**: Explore (identify patterns), Compare (across time periods)

### Viz2: Monthly Trends Small Multiples

| Element | Mark | Channel | Rationale |
|---------|------|---------|-----------|
| Month | Rectangle (bar) | Position (x-axis) | Ordinal encoding - temporal order |
| Crime count | Rectangle (bar) | Length (height) | Quantitative encoding - magnitude comparison |
| Crime type | Panel | Containment (separate subplot) | Categorical separation - allows comparison |
| Crime type identity | Bar color | Color hue | Categorical encoding - distinguishes types |

**Task Alignment**: Explore (temporal trends), Compare (across crime types)

### Viz3: Crime Hotspot Map

| Element | Mark | Channel | Rationale |
|---------|------|---------|-----------|
| Geographic location | Point (circle) | Position (lat/lon) | Geographic encoding - spatial location |
| Crime density | Point (circle) | Density (point clustering) | Quantitative encoding - more points = higher density |
| Crime type | Point (circle) | Color hue | Categorical encoding - distinguishes top crime type |
| Crime type identity | Legend | Color hue | Categorical reference |

**Task Alignment**: Locate (geographic hotspots), Explore (spatial patterns)

## Accessibility & Quality

### Color Accessibility
- **Viz1**: Viridis color scale (color-blind safe, perceptually uniform)
- **Viz2**: Set2 palette (color-blind safe)
- **Viz3**: ColorBrewer-inspired palette (color-blind safe)

### Text & Labels
- All text ≥12pt (axis labels 12-14pt, titles 14-16pt)
- Clear axis labels with units
- Legends included for all color encodings

### Contrast
- High contrast between elements (black borders, white backgrounds)
- Color scales tested for visibility

### Alt Text
- **Viz1**: "Interactive heatmap showing crime incidents by hour of day (x-axis) and day of week (y-axis). Color intensity represents number of incidents. Filterable by crime type."
- **Viz2**: "Small multiples showing monthly crime trends for top 6 crime types in 2024. Each panel shows a bar chart of incidents per month for one crime type."
- **Viz3**: "Geographic scatter plot showing crime locations across Chicago, Illinois. Points represent individual crime incidents plotted by latitude and longitude coordinates. Map includes city boundary reference, landmark labels (Downtown, airports), and Lake Michigan annotation. Top crime type highlighted in red, all other crimes in gray."

### Chart Elements
- No chartjunk - clean, minimal design
- Grid lines for easier reading (subtle, alpha=0.3)
- Clear titles and axis labels

### Responsive Design (Viz1)
- Viewport meta tag for mobile devices
- Scalable SVG graphics
- Accessible form controls (select dropdown)

### Keyboard Navigation (Viz1)
- Select dropdown is keyboard accessible
- Tab navigation supported

## Reproducibility

All visualizations can be reproduced by:
1. Installing dependencies: `pip install -r requirements.txt`
2. Opening `viz_part3.ipynb` in Jupyter Notebook or JupyterLab
3. Running all cells (Cell → Run All)

The notebook contains all code and outputs in one file. For static versions, see `viz/` directory.

