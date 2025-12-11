# Part 2: Design

## Visualization Questions

### Audience: Law Enforcement & Public Safety Officials

**Q1: How do crime patterns vary by time of day and day of week across different crime types?**
- **Task Type**: Explore, compare
- **Data Elements**: Hour of day, day of week, Primary Type, count of incidents
- **Success Criteria**: Users can identify peak crime hours/days for each crime type and compare patterns across types

**Q2: Which police districts have the highest crime rates, and how do crime types differ by district?**
- **Task Type**: Locate, compare
- **Data Elements**: District, Primary Type, count of incidents, arrest rate
- **Success Criteria**: Users can identify high-crime districts and understand which crime types are most common in each

**Q3: What is the relationship between crime location type (street, residence, apartment) and crime type?**
- **Task Type**: Explore, relate
- **Data Elements**: Location Description, Primary Type, count of incidents
- **Success Criteria**: Users can identify which crimes occur most frequently at different location types

**Q4: How do arrest rates vary by crime type, time of day, and district?**
- **Task Type**: Compare, analyze
- **Data Elements**: Primary Type, Hour, District, Arrest (boolean), count
- **Success Criteria**: Users can identify factors that correlate with higher/lower arrest rates

**Q5: What are the spatial patterns of crime across Chicago, and do hotspots exist for specific crime types?**
- **Task Type**: Locate, explore
- **Data Elements**: Latitude, Longitude, Primary Type, count
- **Success Criteria**: Users can identify geographic hotspots and see if different crime types cluster in different areas

## Design Candidates

### Candidate 1: Temporal Crime Patterns Heatmap
**Question Addressed**: Q1 (time patterns)

**Sketch Description**:
- **Layout**: Heatmap grid with days of week (Mon-Sun) on y-axis, hours (0-23) on x-axis
- **Marks**: Rectangles (cells in grid)
- **Channels**: 
  - Color saturation/intensity (darker = more crimes)
  - Color hue (optional: different colors for different crime types if faceted)
- **Annotations**: 
  - X-axis: Hour of day (0-23)
  - Y-axis: Day of week (Monday through Sunday)
  - Legend: Color scale showing crime count ranges
  - Title: "Crime Incidents by Time of Day and Day of Week"
- **Interactions**: 
  - Hover: Show exact count for cell

### Candidate 2: District Crime Comparison Bar Chart
**Question Addressed**: Q2 (district patterns)

**Sketch Description**:
- **Layout**: Horizontal grouped bar chart
- **Marks**: Rectangles (bars)
- **Channels**:
  - Position (vertical): District number
  - Length (horizontal): Crime count
  - Color hue: Different crime types (THEFT, BATTERY, ASSAULT, etc.)
- **Annotations**:
  - X-axis: Number of incidents
  - Y-axis: Police District (1-31)
  - Legend: Crime type color mapping
  - Title: "Crime Distribution by District and Type"
- **Interactions**:
  - Hover: Shows specific numbers of crimes per bar

### Candidate 3: Arrest Rate Analysis Dashboard
**Question Addressed**: Q4 (arrest patterns)

**Sketch Description**:
- **Layout**: Two-panel dashboard
  - Top: Bar chart of arrest rates by crime type
  - Bottom: Heatmap of arrest rates by hour and crime type
- **Marks**: 
  - Bars (top panel)
  - Rectangles in heatmap (bottom panel)
- **Channels**:
  - Position: Crime type, hour
  - Length: Arrest rate percentage (top)
  - Color saturation: Arrest rate (bottom)
- **Annotations**:
  - Top panel: X-axis = Crime Type, Y-axis = Arrest Rate (%)
  - Bottom panel: X-axis = Hour, Y-axis = Crime Type
  - Legends for each panel

### Candidate 4: Crime Hotspot Map
**Question Addressed**: Q5 (spatial patterns)

**Sketch Description**:
- **Layout**: Geographic map of Chicago with overlaid visualizations
- **Marks**: 
  - Points (individual crimes, optional if too dense)
  - Heatmap density (preferred for large dataset)
  - District boundaries
- **Channels**:
  - Position (lat/lon): Geographic location
  - Color saturation: Crime density (darker = more crimes)
  - Color hue: Crime type (if faceted)
  - Containment: District boundaries
- **Annotations**:
  - Map: Chicago city boundaries
  - District labels
  - Color legend: Crime density scale
  - Crime type selector/filter
  - Title: "Crime Hotspots in Chicago"
- **Interactions**:
  - Zoom: Pan and zoom to explore neighborhoods
  - Hover district: Show statistics for that district

### Candidate 5: Total Arrests per Month
**Question Addressed**: Q4 (arrest patterns over time)

**Sketch Description**:
- **Layout**: Vertical bar chart
- **Marks**: Rectangles (bars)
- **Channels**:
  - Position (x): Month (Jan-Dec)
  - Length (y): Total number of arrests
- **Annotations**:
  - X-axis: Month (January through December)
  - Y-axis: Number of Arrests
  - Title: "Total Arrests per Month (2024)"
- **Interactions**:
  - Hover: Show exact count for month


