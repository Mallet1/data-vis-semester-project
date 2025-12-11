# Data Dictionary

**Source**: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data

## Fields

- **ID**: Unique incident identifier
- **Case Number**: CPD case number (e.g., JH560826)
- **Date**: Incident date/time (MM/DD/YYYY HH:MM:SS AM/PM)
- **Block**: Block-level address (privacy-protected, e.g., "105XX S OGLESBY AVE")
- **IUCR**: Illinois Uniform Crime Reporting code (4-digit)
- **Primary Type**: Crime category (THEFT, BATTERY, ASSAULT, etc.)
- **Description**: Detailed crime description
- **Location Description**: Location type (STREET, RESIDENCE, APARTMENT, etc.)
- **Arrest**: Boolean - arrest made (true/false)
- **Domestic**: Boolean - domestic violence incident (true/false)
- **Beat**: Police beat number
- **District**: Police district (1-31)
- **Ward**: City ward (1-50)
- **Community Area**: Community area number (1-77)
- **FBI Code**: FBI Uniform Crime Reporting code
- **X Coordinate, Y Coordinate**: State Plane Illinois East coordinates
- **Year**: Year extracted from Date
- **Updated On**: Last update timestamp
- **Latitude, Longitude**: Geographic coordinates (WGS84)
- **Location**: Formatted coordinate pair "(lat, lon)"

## Notes

- Missing data: ~1,200 records missing coordinates, ~1,100 missing location description
- Coordinates should be within Chicago bounds: 41.6-42.0°N, -87.9 to -87.5°W
- Arrest and Domestic stored as strings "true"/"false", need conversion to boolean
