# 
docker run -t -v "${PWD}:/data" ghcr.io/project-osrm/osrm-backend osrm-extract   -p /opt/car.lua /data/perth.osm.pbf
#Process the osrm files:
docker run -t -v "${PWD}:/data" ghcr.io/project-osrm/osrm-backend osrm-partition /data/perth.osrm

docker run -t -v "${PWD}:/data" ghcr.io/project-osrm/osrm-backend osrm-customize /data/perth.osrm

#Start the docker img:
docker run -t -i -p 5000:5000 -v "${PWD}:/data" ghcr.io/project-osrm/osrm-backend osrm-routed --algorithm mld /data/perth.osrm