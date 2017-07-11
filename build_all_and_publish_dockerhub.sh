#!/bin/bash

cd shopfront
mvn clean install
if docker build -t daverick/djshopfront . ; then
  docker push daverick/djshopfront
fi
cd ..

cd productcatalogue
mvn clean install
if docker build -t daverick/djproductcatalogue . ; then
  docker push daverick/djproductcatalogue
fi
cd ..

cd stockmanager
mvn clean install
if docker build -t daverick/djstockmanager . ; then
  docker push daverick/djstockmanager
fi
cd ..
