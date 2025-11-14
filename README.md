# COVID-19 Global Impact Analysis: SQL Data Exploration

## **Project Context**

COVID-19, declared a pandemic by WHO in early 2020, disrupted every aspect of life across the globe. Governments, health officials, and public policy experts relied on critical data to assess infection rates, death tolls, and progress in containing the virus. This analysis supports data-driven decision-making by summarizing international COVID-19 outcomes, highlighting risks, and identifying trends using SQL on global datasets.

## Executive Summary

This project analyzes global and country-level COVID-19 data:

- Quantifies both case and death rates across all continents.
- Highlights countries most affected relative to population and per-capita terms.
- Evaluates trends in mortality and infection rates, guiding policy and response.

## Key Business & Policy Insights

| **Metric/Chart** | **Key Insight** | **Actionable Steps** |
| --- | --- | --- |
| Total Cases vs Total Deaths (India Example) | Death risk for infected individuals in India is ~1.1%. | Focus public messaging on at-risk populations to reduce mortality. |
| Total Cases vs Population | ~1.39% of India's population infected by April 2021. | Allocate healthcare resources to heavily impacted regions. |
| Highest Infection Rates (Top 5 Countries) | Andorra, Montenegro, Czechia, San Marino, Slovenia had the highest infection rates. | Review public health interventions in these hotspots for best practices. |
| Highest Death Count (Top 5 Countries) | USA, Brazil, Mexico, India, UK have the highest absolute death counts. | Target international aid and support to these countries. |
| Continent Death Counts | North & South America lead death counts; Africa, Oceania have much lower tolls. | Regional strategies for resource allocation and vaccine distribution. |
| Global Death Percentage by Date | Global death rate among recorded cases hovers around 2.1%. | Continually assess effectiveness of new treatments and interventions. |

## Data Analysis Approach

- **SQL Data Exploration:**
    - Cleaned and joined COVID-19 global death and vaccination data.
    - Calculated per-case and per-population percentages for infection and death rates.
    - Identified top hotspots using ranking and aggregation functions.
- **Key Metrics:**
    - Death percentage (total deaths / total cases).
    - Infection rate (total cases / population).
    - Highest death and infection counts (absolute and percentage).
    - Continental comparisons for death and infection statistics.

## Stakeholder Recommendations

- Prioritize ongoing investment in healthcare and vaccination for high-risk, high-impact countries.
- Use infection and death trends for adaptive public health responses.
- Leverage learnings from high-infection countries for future outbreak preparedness.

## Next Steps

- Integrate vaccination data for analysis of impact.
- Visualize geographical distribution and time-dependent trends.
- Extend analysis to include recovery rates, healthcare system capacity, and long-term impacts.
