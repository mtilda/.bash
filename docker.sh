alias doc="docker-compose"

# Remove:
#   - all stopped containers
#   - all networks not used by at least one container
#   - all volumes not used by at least one container
#   - all images without at least one container associated to them
#   - all build cache
# 
# Answer y to the warning prompt
docker-destroy () {
    echo "mtilda: Destroy all expendable docker entities"
    
    docker system prune -a --volumes -f;
}

# Run any query in PostgreSQL database container
docker-psql () {
    echo "mtilda: Execute query in PostgreSQL database '${2:-postgres}' in container '${3:-db}'"

    docker-compose up -d ${3:-db}
    docker-compose exec ${2:-db} psql -U ${2:-postgres} -c "${1}"
}

# Drop all tables in database
docker-psql-wipe () {
    echo "mtilda: Drop and recreate schema in PostgreSQL database '${1:-postgres}' in container '${2:-db}'"

    # Drop all tables
    docker-psql " \
    DROP SCHEMA public CASCADE; \
    CREATE SCHEMA public; \
    GRANT ALL ON SCHEMA public TO postgres; \
    GRANT ALL ON SCHEMA public TO public;
    "
}

# List all visible tables in PostgreSQL database container
docker-psql-tables () {
    echo "mtilda: List all tables in PostgreSQL database '${1:-postgres}' in container '${2:-db}'"

    docker-psql "\d"
}
