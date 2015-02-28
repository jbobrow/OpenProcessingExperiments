
PImage img;
float diameter; 
float angle = 0;

void setup() {
  size(800, 533);
  img = loadImage("us.jpg");
  img.loadPixels();
  loadPixels();
  diameter = height - 10;
  noStroke();
  noStroke();
  fill(200, 210, 0);
}

void draw() {
  
  background(0);
  image(img,0,0);

  float d1 = 10 + (sin(angle) * diameter/2) + diameter/2;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/2;
  
  ellipse(0, height/2, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);
  
  angle += 0.02;
}

//processing sketch code from: http://processing.org/learning/basics/sine.html
//image photographed by Emily Munro

