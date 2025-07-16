<!-- badges: start -->
![GitHub](https://img.shields.io/github/license/wlangera/jsdm-pollinators-flanders)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/wlangera/jsdm-pollinators-flanders/check-project)
[![Release](https://img.shields.io/github/release/inbo/macro-moths-msci.svg)](https://github.com/wlangera/jsdm-pollinators-flanders/releases)
![GitHub repo size](https://img.shields.io/github/repo-size/wlangera/jsdm-pollinators-flanders)
<!-- badges: end -->

# Joint Species Distribution Modelling of a Pollinator Community in Flanders

[Langeraert, Ward![ORCID logo](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-5900-8109)[^aut][^cre][^inbo.be]
Research Institute for Nature and Forest (INBO)[^cph][^fnd]

[^cph]: copyright holder
[^fnd]: funder
[^aut]: author
[^cre]: contact person
[^inbo.be]: Research Institute for Nature and Forest (INBO)

**keywords**: JSDM; species distribution modelling; pollinators; Flanders

<!-- community: inbo -->

### Description
<!-- description: start -->
Explore Joint Species Distribution Modelling of a pollinator community in Flanders.
<!-- description: end -->

This repo is made in preparation of the summer school 'Model-based multivariate analysis for ecologists' from 21st-25th of July 2025 in Hjerkinn, Norway ([link](https://bertv.folk.ntnu.no/)).

### Order of execution

Follow the steps below to run the scripts in a logical order.

<!-- spell-check: ignore:start -->
#### Step 1: data_preparation.qmd
<!-- spell-check: ignore:end -->

Load and prepare the observation data from `data/raw` folder.
This includes merging of datasets and data filtering.

<!-- spell-check: ignore:start -->
#### Step 2: prepare_trait_phylo.qmd
<!-- spell-check: ignore:end -->

Load and prepare the trait and phylogenetic data from `data/raw` folder.
Clean up trait dataset and create workflow to create taxonomical tree.

### Repo structure

```
├── source
│   ├── quarto                      ├ quarto reports
│   └── scripts                     ├ R scripts
│
├── data
│   ├── raw                         ├ store raw data here
│   ├── intermediate                ├ intermediate datasets
│   └── processed                   ├ finalised datasets
│
├── output                          ├ folder to store outputs
├── media                           ├ folder to store media
│
├── checklist.yml                   ├ options checklist package (https://github.com/inbo/checklist)
├── inst
│   └── en_gb.dic                   ├ dictionary with words that should not be checked by checklist
├── .github                         │ 
│   ├── workflows                   │ 
│   │   └── checklist_project.yml   ├ GitHub repo settings
│   ├── CODE_OF_CONDUCT.md          │ 
│   └── CONTRIBUTING.md             │
├── jsdm-pollinators-flanders.Rproj ├ R project
├── README.md                       ├ project description
├── LICENSE.md                      ├ license
├── CITATION.cff                    ├ citation info
├── .zenodo.json                    ├ zenodo metadata
└── .gitignore                      ├ files to ignore
```
