
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072

void setup() {
  size (600, 600);
  background(0);
  noStroke();
  smooth();
  noLoop();
}

void draw() {
    for (int i = 40; i < width-10; i = i + 40) { 
    for (int j = 40; j < height-10; j = j + 40) { 
      
      stroke(255); 
      strokeWeight(1); 
      noFill(); 
      line(i+30, j+30, i+30, j+30, i+30, j+30); 
      rectMode(CENTER); 
      rect(i, j, 50, 50);
      ellipse(i,j,50,50);
    }
  }
}

