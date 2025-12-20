# Method & Design Notes

## Data Pipeline

### Data Source
- **Dataset**: Chicago Crime Data (2001-Present)
- **Source**: City of Chicago Data Portal (https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data)
- **License**: Public domain
- **Current Snapshot**: 258,077 records from 2024
- **File**: `data/Crimes_-_2001_to_Present_20251118.csv`

### Data Processing
1. **Loading**: CSV file loaded using pandas (258,077 rows, 22 columns)
2. **Date Parsing**: Date column converted to datetime format (`%m/%d/%Y %I:%M:%S %p`)
3. **Temporal Features**: Extracted hour (0-23), day of week (0-6, Monday=0), and month (1-12)
4. **Geographic Filtering**: 
   - Removed records with missing coordinates (1,229 records, 0.5%)
   - Filtered to Chicago bounds: 41.6-42.0°N, -87.9 to -87.5°W (excluded 6,151 records, 2.4%)
   - Final dataset: 250,697 records with valid coordinates (97.1% of original)
5. **Sampling**: For geographic visualization, sampled every 10th point (25,070 points) to manage performance while preserving spatial patterns

### Data Quality Considerations
- Missing coordinates handled by exclusion (documented in outlier handling summary)
- Coordinate validation ensures geographic accuracy
- Date parsing errors handled with `errors='coerce'` and subsequent `dropna()`
- All filtering decisions documented in code comments and output

## Design Choices & Cognitive Task Alignment

### Figure 1: Interactive Temporal Crime Patterns Heatmap

**Task**: Explore and compare crime patterns across time periods and crime types

**Design Rationale**:
- **Position encoding (x-axis: hour, y-axis: day)**: Leverages position as the most accurate perceptual channel for ordinal data. Hours and days are naturally ordered, making temporal patterns immediately visible.
- **Color saturation (Viridis scale)**: Quantitative magnitude encoded through color intensity. Viridis is perceptually uniform and color-blind safe, ensuring accurate magnitude perception across all viewers.
- **Interactive filtering**: Dropdown widget allows users to filter by crime type, enabling exploration without overwhelming the visualization with multiple overlays.
- **Colorbar positioning**: Placed close to heatmap (pad=0.02) to reduce eye movement and cognitive load when reading values.

**Cognitive Benefits**:
- Pre-attentive processing: Color intensity allows rapid identification of high-crime periods
- Pattern recognition: Grid structure naturally reveals temporal clustering
- Comparison: Side-by-side exploration of different crime types reveals unique temporal signatures

**Limitations**:
- Exact values require colorbar interpretation (no hover tooltips implemented)
- Limited to single crime type view at a time (no multi-type comparison overlay)

### Figure 2: Monthly Crime Trends by Type (Small Multiples)

**Task**: Compare temporal trends across different crime types

**Design Rationale**:
- **Small multiples layout (2×3 grid)**: Each crime type gets its own panel, enabling focused analysis while maintaining visual consistency for comparison.
- **Bar charts**: Length encoding (bar height) provides precise quantitative comparison, more accurate than color saturation for exact values.
- **Standardized y-axis (0-7,000)**: Critical design decision enabling direct magnitude comparison across crime types. Without standardization, viewers might misinterpret relative magnitudes.
- **Color hue (Set2 palette)**: Different color per panel provides visual distinction while maintaining color-blind safety.

**Cognitive Benefits**:
- Direct comparison: Standardized axes eliminate scaling artifacts that could mislead interpretation
- Pattern recognition: Consistent layout allows rapid scanning across crime types
- Precise reading: Bar heights enable exact value estimation

**Limitations**:
- Only top 6 crime types shown (selection based on frequency)
- No trend lines or statistical summaries (pure data visualization)
- Monthly granularity may miss weekly or daily patterns

### Figure 3: Crime Hotspot Map (Geographic)

**Task**: Locate geographic hotspots and explore spatial patterns

**Design Rationale**:
- **Geographic position (lat/lon)**: Uses actual geographic coordinates, not abstract x/y axes, making it a non-cartesian visualization that preserves spatial relationships.
- **Point scatter plot**: Individual points show exact locations, enabling precise geographic identification.
- **Color encoding**: Gray for all crimes, red for THEFT overlay. This dual-layer approach shows both overall patterns and specific crime type distribution.
- **Landmark markers**: Downtown, O'Hare, Midway, and Lake Michigan provide geographic context and orientation.
- **City boundary box**: Dashed blue rectangle indicates approximate city limits for spatial reference.

**Cognitive Benefits**:
- Spatial pattern recognition: Point clustering reveals hotspots pre-attentively
- Geographic context: Landmarks enable viewers to relate patterns to known locations
- Dual encoding: Gray/red distinction allows simultaneous viewing of overall and specific patterns

**Limitations**:
- Point overplotting in dense areas (downtown) makes exact density difficult to assess
- Sampling (every 10th point) may miss rare but important patterns
- No neighborhood boundaries or administrative districts shown
- Point density reflects incident frequency, not per-capita rates (noted in ethical disclaimer)

## Accessibility & Quality Gates

### Color Accessibility
- **Figure 1**: Viridis colormap (perceptually uniform, color-blind safe)
- **Figure 2**: Set2 palette (color-blind safe, distinct hues)
- **Figure 3**: Gray (#lightgray) and red (#d62728) - tested for color-blind visibility

### Text & Labels
- All text ≥12pt (axis labels 12-14pt, titles 14-16pt, captions 11pt)
- Clear axis labels with units ("Number of Incidents", "Hour of Day", "Month")
- Legends and colorbars clearly labeled
- Captions include figure numbers, descriptions, and data limitations

### Contrast
- High contrast maintained (black text on white backgrounds, white text on dark heatmap cells)
- Color scales tested for visibility across different display types
- Grid lines use low alpha (0.3) to reduce visual clutter while maintaining readability

### Chart Elements
- No chartjunk: Clean, minimal design focused on data
- Subtle grid lines (alpha=0.3) for easier value reading
- Clear titles and axis labels
- Ethical notes prominently displayed

## Limitations

### Data Limitations
1. **Reporting bias**: Data reflects reported incidents only. Underreporting varies by crime type, location, and community trust in law enforcement.
2. **Classification changes**: Crime classifications may change after investigation, but dataset reflects initial classifications.
3. **Temporal scope**: Analysis limited to 2024 data; no year-over-year comparison possible.
4. **Geographic sampling**: Every 10th point sampled for performance, potentially missing rare but important patterns.

### Visualization Limitations
1. **Figure 1**: No hover tooltips for exact values; requires colorbar interpretation.
2. **Figure 2**: Only top 6 crime types shown; other types excluded from analysis.
3. **Figure 3**: Point overplotting in dense areas; no density normalization (per-capita rates).
4. **All figures**: Static PNG outputs; interactive features (Viz1 dropdown) only work in Jupyter environment.

### Methodological Limitations
1. **No statistical testing**: Visualizations show patterns but no significance testing or confidence intervals.
2. **No causal inference**: Patterns are descriptive, not explanatory. No attempt to identify causes.
3. **No predictive modeling**: Analysis is retrospective, not forward-looking.

## Ethics & Bias Considerations

### Ethical Framing
All visualizations include explicit notes that:
- Data reflects **reported** incidents only
- Underreporting may vary geographically and by crime type
- Point density reflects incident frequency, not per-capita rates

### Potential Biases
1. **Reporting bias**: Communities with lower trust in law enforcement may underreport crimes, making those areas appear safer than they are.
2. **Classification bias**: Initial crime classifications may not reflect final determinations, potentially misrepresenting crime types.
3. **Geographic bias**: Dense urban areas naturally show more points, which could be misinterpreted as higher crime rates without population normalization.
4. **Temporal bias**: Single year (2024) may not represent long-term trends; seasonal or one-time events could skew patterns.

### Mitigation Strategies
1. **Explicit disclaimers**: Ethical notes directly on visualizations (especially Figure 3)
2. **Transparent methodology**: Outlier handling and data filtering documented
3. **Contextual information**: Landmarks and boundaries provide geographic context
4. **Accessible design**: Color-blind safe palettes ensure all viewers can interpret visualizations

### Responsible Interpretation
Viewers should:
- Consider reporting rates when interpreting geographic patterns
- Avoid stigmatizing neighborhoods based solely on point density
- Recognize that incident frequency ≠ crime rate (population normalization needed for per-capita analysis)
- Understand that patterns are descriptive, not causal

## Reproducibility

### Environment
- Python 3.x
- Dependencies listed in `requirements.txt`
- Jupyter Notebook environment for interactive features

### Data Access
- Primary data file: `data/Crimes_-_2001_to_Present_20251118.csv`
- If missing, download from: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data
- Data filtered to 2024 only in provided file

### Code Execution
- All visualizations in single notebook: `visualizations.ipynb` (in `final/` directory)
- Run all cells to regenerate figures
- Outputs saved to `figures/` directory (relative to notebook location)
- Data loaded from `../data/` directory

### Build Instructions
See `README.md` and `docs/instructions.md` for detailed setup and execution instructions.

