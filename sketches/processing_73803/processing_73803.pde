
//Processing HW8
//Katherine(Kathy) Lee
//Copyright 2012

PImage brush;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  brush = loadImage("brush.png");
  noCursor();
}


void draw() {

  int g = 100;
  int dia = 0;
  while(g<150){ 
    ellipse(mouseX, mouseY, dia, dia);
    fill(mouseX, g, 150, mouseY);
    image(brush, mouseX, mouseY);
    g += 5;
    dia += 15;

    
  }
}


