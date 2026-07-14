node("image-builder") {
  container("kaniko") {
    stage("Prepare build environment") {
      sh '''
        mkdir -p /kaniko/.docker
        cat > /kaniko/.docker/config.json <<< "$PODMAN_AUTH"
      '''
    }
    
    stage("checkout") {
      checkout scm
    }

    stage("Build docker image") {
      sh '''
        /kaniko/executor \
          --context=`pwd` \
          --dockerfile=Dockerfile \
          --destination=docker.io/careromspersonal/clock-trigger:latest
      '''
    }
  }
}