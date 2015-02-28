
/*
Flagellum

Processing sketch by June-Hao Hou, DDes
Copyright (c) 2009

Prepared for Interaction Design course at NCTU-Architecture

Original concept from Jared Tarbell's Flagellum in Flash MX
  http://levitated.net/daily/levFlagellum.html
  
This program is free software; you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free 
Software Foundation.
*/

// maximum number of simultaneous tentacles
int maxtents = 10;
ArrayList tentacles;

void setup() {
  size(600, 400);
  smooth();
  
  // construct tentacles
  tentacles = new ArrayList();  
  for (int i = 0; i < maxtents; i++) {
    tentacles.add(new Tentacle(random(width), height * 0.9, 270));
  }
}

void draw() {
  background(0);
  
  // display tentacles
  for (int i = 0; i < tentacles.size(); i++) {
    Tentacle neo = (Tentacle) tentacles.get(i);
    neo.display();
  }
  println();

  // update tentacles
  for (int i = 0; i < tentacles.size(); i++) {
    Tentacle neo = (Tentacle) tentacles.get(i);
    neo.move();
  }
}

