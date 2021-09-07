# Remove:
#   - all stopped containers
#   - all networks not used by at least one container
#   - all volumes not used by at least one container
#   - all images without at least one container associated to them
#   - all build cache
# 
# Answer y to the warning prompt
docker-destroy () { docker system prune -a --volumes -f; }
