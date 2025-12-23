Recommended Project: End-to-End Data Lake ELT Pipeline (Self-Hosted, Containerized)
Stack:

MinIO (as S3-compatible lake storage)

Apache Iceberg (table format)

Trino (SQL query engine)

PostgreSQL (Iceberg catalog metadata)

dbt (transformations)

Apache Airflow (pipeline orchestration)

Project Workflow:

Raw Data Ingestion:
Store CSV or Parquet files into MinIO “buckets”.

Table Format & Schema Evolution:
Use Iceberg to manage table schema and enable features like ACID transactions and time travel.

Query Engine:
Use Trino to define and query Iceberg tables on data stored in MinIO, using Postgres backend for the Iceberg catalog.

Orchestrator:
Orchestrate all jobs—data movement, ingestion, clean/transform, and analytic jobs—using Apache Airflow. (You can use Dagster as an alternative if you prefer.)

Transformations:
Use dbt to perform modular and reusable SQL transformations via Trino directly on your Iceberg tables.

End-to-End Demo:
The whole thing can be run and developed locally via Docker Compose, making it reproducible and easy to experiment with or reset.

Open-Source Example Projects
1. “datalake” by hnawaz007
Containers for Trino, Iceberg, Postgres catalog, and MinIO included.

Airflow integration with a custom image and docker-compose setup.

Ideal for experimenting with storage, metadata, orchestration, and querying.

2. “dbt_w_trino_w_iceberg” by solimy
Docker Compose-based stack using MinIO, Iceberg, Postgres, Trino, and dbt.

Provides full setup instructions, commands for running, and sample dbt queries.

Also demonstrates Airbyte ingestion, showcasing flexible integration with other open-source data tools.

3. Guided Blog and Code Tutorial
The blog post “Building an End-to-End Data Lake ELT Pipeline using Modern Data Stack” steps you through architecture, pipeline orchestration, containerization, and code.

The linked GitHub repository (see above projects) contains the code and Docker Compose files, ensuring you can spin up and practice on your machine.

How To Practice
Clone one of the recommended repos:

https://github.com/hnawaz007/datalake

https://github.com/solimy/dbt_w_trino_w_iceberg

Follow the setup instructions:
Build Docker images, start up MinIO, Postgres, Trino, and Airflow/Dagster containers.

Add new data tasks of your choice:
Ingest different public datasets, try implementing your own DBT models, or extend orchestration DAGs.

Experiment with orchestration:
Build more complex DAGs/pipelines and swap between Airflow and Dagster if you want exposure to both.

Explore extensions:
Add more components as you learn (Superset for BI dashboarding, Metabase, or integrate with streaming tools).

You’ll not only learn the whole workflow—data ingestion, modeling, transformation, and orchestration—but also become comfortable containerizing and deploying a robust, modular data platform as used in industry today.