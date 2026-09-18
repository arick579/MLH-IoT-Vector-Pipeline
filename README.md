![IoT Vector Pipeline CI](https://github.com/arick579/MLH-IoT-Vector-Pipeline/actions/workflows/deploy.yml/badge.svg)
# MLH IoT Vector Pipeline
> An end-to-end AI data pipeline engineered with TimescaleDB, pgvector, and Model Context Protocol (MCP) in a PostgreSQL environment. The system ingests simulated IoT telemetry into hypertables alongside DiskANN vector search to enable autonomous, memory-efficient RAG analysis for AI agents.
## Project Overview
* Engineered an end-to-end AI data pipeline ingesting simulated IoT sensor time-series telemetry into a **TimescaleDB hypertable**, applying columnstore compression to optimize analytical query performance.
* Implemented AI-powered vector search using **pgvector** and **pgvectorscale**, configuring **DiskANN indexes** to enable memory-efficient semantic retrieval alongside time-bucket aggregations for hybrid Retrieval-Augmented Generation (RAG).
* Integrated the database with local AI agents via the **Model Context Protocol (MCP)** and Tiger CLI, mapping db_query and db_schema tools to grant LLMs secure, read-only data access for autonomous data analysis.

## Context
Developed for **Major League Hacking (MLH) – Global Hack Week: Data** (September 2026).

This repository combines three challenge tracks into a unified project:
1. *Simulate an IoT sensor dataset for testing and development with Tiger Cloud*
2. *Integrate Tiger Cloud with your AI Agent with the Tiger CLI and MCP*
3. *Implement AI-Powered Vector Search with pgvector*

This project demonstrates hybrid database architecture, combining traditional IoT time-series data with modern AI capabilities.

## Tech Stack
* **Database & Storage:** PostgreSQL 17, TimescaleDB (Hypertables), Tiger Cloud
* **AI & Search:** pgvector, pgvectorscale, DiskANN Indexes
* **Agent Integration:** Model Context Protocol (MCP), Tiger CLI, Local LLM Agents (Cursor, Claude Code, VS Code)
* **Infrastructure:** CloudNativePG Kubernetes Operator, YAML Manifests
* **Data Type:** Simulated IoT Sensor Telemetry (Time-series) & 1536-dimensional Vector Embeddings

## Repository Structure

```text
MLH-IoT-Vector-Pipeline/
├── .mcp/
│   └── tiger-config.json         # Model Context Protocol server configuration
├── kubernetes/
│   └── cluster-timescaledb.yaml  # CloudNativePG declarative K8s manifest
├── scripts/
│   └── setup_mcp.sh              # Shell script to automate CLI login & MCP install
├── 01_init_iot_dataset.sql       # Schema & simulation script for IoT telemetry
├── 02_vector_search_init.sql     # Extension verification & DiskANN check script
└── README.md


```
## Quick Start Guide

### 1. Initialize Database Schema & IoT Data
Connect to your Tiger Cloud / PostgreSQL instance and run the initial telemetry simulation script:

```bash
psql -h <your-host> -U postgres -d app -f 01_init_iot_dataset.sql
```
This provisions the sensors table, converts sensor_data into a TimescaleDB hypertable, and generates 24 hours of 5-minute telemetry intervals.

### 2. Configure AI Agent (Tiger MCP)
Authenticate the CLI and attach the MCP server to your local AI editor/agent:

```Bash
chmod +x scripts/setup_mcp.sh
./scripts/setup_mcp.sh
```
Or manually configure your MCP client using .mcp/tiger-config.json:
```
JSON
{
  "mcpServers": {
    "tiger": {
      "command": "tiger",
      "args": ["mcp", "start"]
    }
  }
}
```
### 3. Verify Vector Extensions & DiskANN
Run the verification suite to ensure pgvector, pgvectorscale, and DiskANN indexing access methods are operational:

```Bash
psql -h <your-host> -U postgres -d app -f 02_vector_search_init.sql
```


## Engineering & Performance Highlights

* **Hypertable Compression:** Leverages TimescaleDB's chunking policy, achieving up to 95% storage savings on historic telemetry without impacting analytical time_bucket queries.
* **Low-Memory Vector Search:** DiskANN indexes allow vector similarity search over high-dimensional embeddings with minimal RAM overhead (consuming tens of kilobytes versus gigabytes required by standard HNSW indexes).
* **Enterprise Security Guardrails:** Utilizes TIGER_READ_ONLY=prod flags and constrained MCP tools to protect raw operational database tables against unintended mutating queries during autonomous LLM exploration.
