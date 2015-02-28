
/*
Deep Lorenz

Processing sketch by June-Hao Hou, DDes
Copyright (c) 2009

Prepared for Interaction Design course at NCTU-Architecture, Hsinchu

Original concept from Jared Tarbell's Lorenz Deep in Flash MX
  http://levitated.net/daily/levDeepLorenz.html

Additional information about Lorenz Attractor:
  http://levitated.net/daily/levLorenzAttractor.html

This program is free software; you can redistribute it and/or modify it 
under the terms of the GNU General Public License as published by the Free 
Software Foundation.
*/

PVector field;         // center field in stage
float x0, y0, z0;      // initial starting point- can be nearly anything.
float h, a, b, c, n;   // Lorenz constants - do not change.

void setup() {
  size(600, 400);
  background(0);
  noFill();
  smooth();
  
  field = new PVector(width/2, height * 0.4);

  x0 = (random(50) - 25) / 2;
  y0 = 1;
  z0 = random(50) / 2;

  h = 0.01;
  a = 10.0;
  b = 28.0;
  c = 8.0 / 3.0;
  n = 0;
}

void draw() {
    // transformation equations
    float x1 = x0 +h * a * (y0 - x0);
    float y1 = y0 + h * (x0 * (b - z0) - y0);
    float z1 = z0 + h * (x0 * y0 - c * z0);
    // scale from last point to new point
    stroke(255, 25);
    ellipse(y0*10 + field.x, x0*10 + field.y, 50*z0*5 / 100, 50*z0*5 / 100);
    // solution becomes next seed
    x0 = x1;
    y0 = y1;
    z0 = z1;
    //println((y0*10 + field.x) + " " + (x0*10 + field.y) + " " + z0*2);
}




