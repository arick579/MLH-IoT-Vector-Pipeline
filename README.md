[![IoT Vector Pipeline CI](https://github.com/arick579/MLH-IoT-Vector-Pipeline/actions/workflows/ci.yml/badge.svg)](https://github.com/arick579/MLH-IoT-Vector-Pipeline/actions)
# MLH IoT Vector Pipeline
An end-to-end AI data pipeline engineered with TimescaleDB, pgvector, and Model Context Protocol (MCP) in a PostgreSQL environment. The system ingests simulated IoT telemetry into hypertables alongside DiskANN vector search to enable autonomous, memory-efficient RAG analysis for AI agents.
## Project Overview
* Engineered an end-to-end AI data pipeline ingesting simulated IoT sensor time-series telemetry into a **TimescaleDB hypertable**, applying columnstore compression to optimize analytical query performance.
* Implemented AI-powered vector search using **pgvector** and **pgvectorscale**, configuring **DiskANN indexes** to enable memory-efficient semantic retrieval alongside time-bucket aggregations for hybrid Retrieval-Augmented Generation (RAG).
* Integrated the database with local AI agents via the **Model Context Protocol (MCP)** and Tiger CLI, mapping `db_query` and `db_schema` tools to grant LLMs secure, read-only data access for autonomous data analysis.

## Context
Developed for **MLH (Major League Hacking) – Global Hack Week: Data (Multiple Challenges) | September 2026**. This project demonstrates hybrid database architecture, combining traditional IoT time-series data with modern AI capabilities.

## Tech Stack
* **Database:** PostgreSQL, TimescaleDB (Hypertables), Tiger Cloud
* **AI & Search:** pgvector, pgvectorscale, DiskANN
* **Integration:** Model Context Protocol (MCP), Tiger CLI, Local LLM Agents
* **Data Type:** Simulated IoT Sensor Telemetry (Time-series)

## 🚀 Architecture Details
