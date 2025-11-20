# Instructions

## Setup

```bash
pip install -r requirements.txt
```

## Data

Data file: `data/Crimes_-_2001_to_Present_20251118.csv`

If missing, download from: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data  
I just filtered out the year 2024  
Click "Export" → "CSV"  
Make a new directory called /data and add the csv there  

## Running Part 1

```bash
jupyter notebook eda_part1.ipynb
```

## Notes

- Addresses are at block level only (privacy protection)
- Data reflects *reported* incidents, not actual crime rates

