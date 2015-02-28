
void setup() {
 size(600, 600);
 background(30);
 colorMode (HSB);
 smooth();
}


void draw() {
  strokeWeight(random(10));
  stroke(random(500),200,500,60);
  fill(random(200),500,500,30);
  ellipse(mouseX,mouseY,random(75), random(75));
}


void mousePressed() {
 background(30); 
}

