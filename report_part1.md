# Part 1: Data & Exploration

## Data Pitch

**Dataset**: Chicago Crime Data (2001-present)  
**Source**: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data  
**License**: Public domain (City of Chicago)  
**Current snapshot**: 258,077 records from 2024

**Sufficiency**: Meets all criteria - 258k rows, 22 columns, temporal (date/time), geospatial (lat/lon, districts), and multiple categorical dimensions.

**Audience**: Law enforcement, city planners, researchers, general public

**Risks**:
- Privacy: Addresses at block level only
- Bias: Data reflects *reported* incidents, not actual crime rates. Underreporting varies by crime type and community.
- Quality: Classifications may change after investigation. Missing coordinates in some records.
- Ethics: Avoid stigmatizing neighborhoods. Interpret with socioeconomic context.

## Data Readiness Plan

**Current state**: CSV with 258k rows, 22 columns, ~176 MB in memory. Date range: Jan-Dec 2024.

**Cleaning needed**:
- Parse Date column to datetime
- Handle missing coordinates (~1,200 records)
- Validate coordinates within Chicago bounds (41.6-42.0°N, -87.9 to -87.5°W)

**Derived features**:
- Extract temporal: hour, day of week, month
- Geospatial: validate coordinates, flag outliers

**Feasibility**: High - standard pandas operations sufficient. Temporal and crime type analysis straightforward. Geospatial analysis feasible with coordinate validation.

