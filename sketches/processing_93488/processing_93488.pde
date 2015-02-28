
/* 
  Minh Pham, z3416941
  
  Drawing a strokes of lines with a trail
  of spots behind
*/

// Colours
float r;
float g;
float b;
float a;

// Sizes
float w;
float h;
float diam;

void setup() {
  size(500, 500);
  smooth();
  background(255);
}

void draw() {  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  if(mousePressed) {
    
    // Drawing the line with different strokes
    stroke(r, g, b, a);
    strokeWeight(abs(mouseX - pmouseX));
    line(pmouseX, pmouseY, mouseX, mouseY);
    
    // Trail of spots behind strokes
    noStroke();
    fill(r, g, b, a);
    ellipse(mouseX + w, mouseY + h, diam, diam);    
  }
  
  // Rectangle 
  noStroke();
  fill(r, g, b, (random(1, 15)));
  rect(width/2 , height/2, mouseX + 10, mouseY + 10);
  
  // Generated Colours
  r = random(255);
  b = random(255);
  g = random(255);
  a = random(255);
  
  // Generated Sizes
  w = random(-20, 20);
  h = random(-20, 20);
  diam = random(-20, 20);
}
