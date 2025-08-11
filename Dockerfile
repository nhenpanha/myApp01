- name: Build image
  run: |
    IMAGE=${{ steps.login-ecr.outputs.registry }}/${{ env.ECR_REPOSITORY }}:${GITHUB_SHA}
    docker build -t "$IMAGE" .
    echo "IMAGE=$IMAGE" >> $GITHUB_ENV
