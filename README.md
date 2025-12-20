# Chicago Crime Data Visualization

Data visualization project analyzing Chicago crime patterns (2024 data).

**Data**: https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2/about_data

## Quick Start

```bash
pip install -r requirements.txt
jupyter notebook notebooks/viz_part3.ipynb
```

## Project Structure

```
data-vis-semester-project/
├── data/              # Crime data CSV file
├── notebooks/         # Jupyter notebooks (EDA and visualizations)
├── outputs/          # Generated visualization images
├── reports/          # Part reports (1, 2, 3, 5)
├── docs/             # Documentation (instructions, data dictionary)
├── reviews/          # Peer review feedback
├── final/            # Final submission deliverables
│   ├── figures/      # Final visualization outputs
│   ├── executive_summary.md
│   ├── method_design_notes.md
│   ├── report.md     # Complete final report
│   └── README.md     # Final submission README
└── requirements.txt  # Python dependencies
```

## Deliverables

- **Part 1**: `notebooks/eda_part1.ipynb`, `reports/report_part1.md` - Data exploration
- **Part 2**: `reports/report_part2.md` - Design and sketches
- **Part 3**: `notebooks/viz_part3.ipynb`, `reports/report_part3.md` - Three visualizations (interactive heatmap, small multiples, geographic map)
- **Part 5**: `reports/report_part5.md` - Improvements based on feedback
- **Part 7 (Final)**: `final/` - Complete final submission with executive summary, method notes, and reproducibility materials

## Final Submission

The complete final submission is in the `final/` directory:
- Executive summary
- Method & design notes (3-5 pages)
- All three visualizations (captioned, numbered)
- Reproducibility materials (run script, data instructions)
- Complete final report

See `final/README.md` for submission details.

## Build & Run

### Quick Start
```bash
pip install -r requirements.txt
jupyter notebook notebooks/viz_part3.ipynb
```

### Using Build Script
```bash
cd final/
./run_all.sh
```

See `docs/instructions.md` for detailed setup.

