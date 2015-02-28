
void setup() {
 size(640, 640);
 colorMode(HSB, width, height, 100);
 background(random(width), random(height), random(100));
  
}

void draw() {
  stroke(mouseX, mouseY, 50);
  fill(mouseY, mouseX, 75);
 rect(100, 100, 100, 100);
 pushMatrix();
 stroke(50, mouseX, mouseY);
 translate(200, 200);
 scale(2.0);
 rotate(radians(15));
 stroke(mouseX, 50, mouseY);
 rect(100, 100, 100, 100);
 popMatrix();
 fill(mouseX, mouseY, 75);
 if(mousePressed == true) {
  rect(100, 100, 50, 50); 
 }
 //fill(mouseX, mouseY, 75);
 //rect(100, 100, 50, 50);
 println("mouse is"+mouseX);
}


void mouseMoved() {
 
 //background(random(width), random(height), random(100)); 
}

void mouseDragged() {
  background(random(width), random(height), random(100));  
}
