echo "1. Build development docker image"
docker image build --tag kalibr --file Dockerfile_ros1_20_04 .


# xhost +local:docker
echo "1. Run with GUI"
xhost +local:docker

docker container run --privileged --gpus all  --interactive --tty --rm  --net host --env KAFKA=1 --env="DISPLAY"   \
    --user=$(id -u $USER):$(id -g $USER) \
    --env="DISPLAY" \
    --env NVIDIA_DRIVER_CAPABILITIES=video,compute,utility \
    --env QT_X11_NO_MITSHM=1 \
    --workdir="/home/$USER" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
   kalibr
docker container run --privileged --gpus all  --interactive --tty --rm  --net host --env KAFKA=1 --env="DISPLAY"   \
    --user=$(id -u $USER):$(id -g $USER) \
    --env="DISPLAY" \
    --env NVIDIA_DRIVER_CAPABILITIES=video,compute,utility \
    --env QT_X11_NO_MITSHM=1 \
    --workdir="/home/$USER" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
   osrf/ros:iron-desktop-full