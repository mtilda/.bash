# Remove:
#   - all stopped containers
#   - all networks not used by at least one container
#   - all volumes not used by at least one container
#   - all images without at least one container associated to them
#   - all build cache
# 
# Answer y to the warning prompt
docker-destroy () { docker system prune -a --volumes -f; }

# Drop all tables in database
docker-psql-wipe () {
    echo "mtilda: Dropping all tables in PostgreSQL database '${1:-postgres}' in container '${2:-db}'"

    echo "mtilda: docker-compose up -d ${2:-db}"
    docker-compose up -d ${2:-db}
    
    echo "mtilda: docker-compose exec ${2:-db} psql -U ${1:-postgres} -c '...'"
    docker-compose exec ${2:-db} psql -U ${1:-postgres} -c " \
    DROP SCHEMA public CASCADE; \
    CREATE SCHEMA public; \
    GRANT ALL ON SCHEMA public TO postgres; \
    GRANT ALL ON SCHEMA public TO public;
    "
}

# List all visible tables in PostgreSQL database
docker-psql-tables () {
    echo "mtilda: Listing all tables in PostgreSQL database '${1:-postgres}' in container '${2:-db}'"

    echo "mtilda: docker-compose up -d ${2:-db}"
    docker-compose up -d ${2:-db}

    echo "mtilda: docker-compose exec ${2:-db} psql -U ${1:-postgres} -c \"\d\""
    docker-compose exec ${2:-db} psql -U ${1:-postgres} -c "\d"
}

# Run any query in PostgreSQL database
docker-psql-query () {
    echo "mtilda: Executing query in PostgreSQL database '${2:-postgres}' in container '${3:-db}'"

    echo "mtilda: docker-compose up -d ${3:-db}"
    docker-compose up -d ${3:-db}

    echo "mtilda: docker-compose exec ${2:-db} psql -U ${2:-postgres} -c \"...\""
    docker-compose exec ${2:-db} psql -U ${2:-postgres} -c "${1}"
}
