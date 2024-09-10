load("ext://helm_remote", "helm_remote")
NAMESPACE = 'flink'

# Only if we customize the image
# docker_build('poc_flink:1_17', '.', dockerfile='Dockerfile') 

#Postgres
helm_remote(
    "postgresql",
    namespace=NAMESPACE,
    repo_name="bitnami",
    repo_url="https://charts.bitnami.com/bitnami",
    release_name="flink-poc",
    set=[
        "global.postgresql.auth.username=root",
        "global.postgresql.auth.password=postgrespassword",
        "global.postgresql.auth.postgresPassword=postgrespassword",
        "global.postgresql.auth.database=postgres",
        "primary.extendedConfiguration=wal_level='logical',max_wal_senders='5',max_replication_slots='10'"
    ],
)


helm_remote(
        "minio",
        repo_name="bitnami",
        namespace=NAMESPACE,
        repo_url="https://charts.bitnami.com/bitnami",
        release_name="flink-poc",
        set=[
            "auth.rootUser=minio",
            "auth.rootPassword=minio123"
        ]
    )

k8s_yaml(
    helm(
        'k8s/',
        name='flink-poc',
        namespace=NAMESPACE,
        values=['k8s/values.yaml'],
        set=[
            'awe=false'
        ],
    ),
)

k8s_resource("flink-poc-postgresql", port_forwards="5432")
k8s_resource("flink-poc-minio", port_forwards="9000")

# k8s_resource("flink-example-1-jobmanager", port_forwards="8081:8081") #nope
