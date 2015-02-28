
/*
PROJECT_2 by Carson Russell
This project seeks to explore the relationship between RGB and HSB colormodes by
visually graphing the two as physical surfaces. Each for{} loop analyzes a photograph's
RGB Green and HSB Hue values and constructs the surfaces as strips of alternating color,
so that the two sets of values can be overlayed to expose the relationship between the two.

*/


import processing.dxf.*;
boolean record;


PImage Steve;
Steve = loadImage ("Processing.jpg");

size(600, 600, P3D);
smooth();
background(255);

int cellSize = 20;                 //the size of the QUAD_STRIP squares

translate(width/2,height/2);
camera(-1000,-750,1500,width/2 - 200,height/2,0,0,1,0);

//beginRaw(DXF, "output.dxf");    //DWG recording begin

for(int z=-800;z<800;z+=cellSize*2) {

  fill (155, 245, 91);             //Green strips
  beginShape(QUAD_STRIP);
  for(int x=-450; x<450; x+=cellSize) {
    int Green = int(green(Steve.get(z +800,x +450)));
    vertex(x, Green, z);
    vertex(x, Green, z+cellSize);
  }
  endShape();
}

for(int z=-800 + cellSize;z<800;z+=cellSize*2) {
  colorMode(HSB);

  fill (195, 49, 87);              //Hue strips
  beginShape(QUAD_STRIP);
  for(int x=-450;x<450;x+=cellSize) {
    int Hue = int(hue(Steve.get(z+800,x+450)));
    vertex(x,Hue,z);
    vertex(x,Hue,z+cellSize);
  }
  endShape();
}

//endRaw();


