
// HW 3 - Computing for the Arts with Processing
// © Asa Foster 2011

PImage face;

void setup() {
  size(800,800); 
  background(0); 
  smooth();
  imageMode(CENTER);
  
}

void draw() {
  face = loadImage("face.png");

  float w = 2*width; 
  while (w > 0) { 
    noStroke(); 
    fill(random(255), random(255), random(255)); 
    ellipse(width/2, height/2, w, w); 
    w = w - 30; 
  }
  
  translate(width/2, height/2);
  image(face, 0, 0, 400, 400);
  
} 

