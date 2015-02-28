
//copyright Leslie Bloomfield lbloomfi 2014

float x;
float ht, wd;

void setup() {
  size (400, 400);
  background(248, 222, 255);
  ht = 100;
  wd = 50;
}

void draw() {
  strokeWeight(10);
  if(mouseX >= pmouseX && mouseY >= pmouseY) 
  {
    fill(random(255), random(255), random(255), random(255));
    stroke(random(255), random(255), random(255), random(255));
  }
  ellipse(mouseX, mouseY, ht - pmouseX, wd - pmouseY);
}


