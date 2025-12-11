# Cognitive Channel Mapping (Template)

| Channel / Cue        | How you used it (specifics)                                 | Why it helps cognition / reduces error               |
|---|---|---|
| Position             | Viz1: X-axis = hour (0-23), Y-axis = day of week (Mon-Sun). Viz2: X-axis = month (Jan-Dec), Y-axis = count. Viz3: Latitude/Longitude coordinates for geographic location | Position is most accurate for quantitative comparison |
| Length               | Viz2: Bar height encodes incident count per month          | Precise comparison across categories                  |
| Angle/Slope          | Not used                                                    | Reveals change rate                                   |
| Area/Size            | Viz3: Point size (s=1-2) - small uniform points           | Mitigates area-perception bias                        |
| Density/Texture      | Viz1: Heatmap grid cells show density of incidents. Viz3: Point clustering reveals crime hotspots | Pre-attentive grouping                                |
| Color saturation     | Viz1: Viridis colormap intensity encodes incident count    | Use for ordered magnitude                             |
| Color hue            | Viz2: Set2 palette - different hue per crime type subplot. Viz3: Gray (all crimes), Red (#d62728) for top crime type | Use for categories; color-blind safe palette          |
| Shape                | Viz1: Rectangular grid cells. Viz2: Rectangular bars. Viz3: Circular points | Redundant cue                                         |
| Containment          | Viz1: Grid structure contains temporal relationships. Viz2: Each subplot (2x3 grid) contains one crime type. Viz3: City boundary box, landmark annotations | Group related elements                                |
| Annotations/Labels   | Viz1: Day names on Y-axis, hour labels on X-axis, colorbar with "Number of Incidents". Viz2: Month labels on X-axis, count labels on Y-axis, crime type title per subplot. Viz3: Landmark labels (Downtown, O'Hare, Midway, Lake Michigan), city boundary, geographic context label | Direct reading, reduces legend chase                  |
