
///////////////////////////////////////////////////////////////////////////////

// _YECT plaisir

///////////////////////////////////////////////////////////////////////////////

// Práctica 02_ Workshop Grafía Manual Degenerativa

///////////////////////////////////////////////////////////////////////////////

// Las manos pesaban menos y el viento también.
// algoritmo * alegoría a YECT plaisir
// __________________________________________http://bit.ly/132D7h9

///////////////////////////////////////////////////////////////////////////////

void setup() {
  size(500, 900);
  background(240);
  smooth();
  noCursor();
  frameRate(20);
}

void draw(){
  noStroke();
  fill (240, 240, 240, 19);
  rect (0, 0, 2000, 2000);
  stroke (216, 181, 0, random(90));
  strokeWeight(random(70));
  line(mouseX, mouseY, random(700), random(2050));
  stroke (255, 255, 255, random(100, 200));
  strokeWeight(random(70));
  line(mouseX, mouseY, random(2050), random(700));
  strokeWeight(random(7));
  stroke (100, 100, 100, 50);
  ellipse (mouseX, 403, random(16, 17), 17);
  
}

