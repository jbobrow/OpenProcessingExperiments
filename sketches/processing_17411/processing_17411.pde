
void setup() {
  size(800, 600);
  background(0);
  smooth();
  
}

float Mspeed;


void draw() {
  if (mousePressed == true) {
  stroke(mouseX, random(0,255), random(0,255), random(0,255));
  //stroke(#FFFFFF);
  strokeWeight(random(0,5));
  //line(random(0), mouseX, random(400), mouseY);
  //rect(mouseX, mouseY, mouseX, mouseY);
  noFill();
  float r = random(5,10);
  //curve(0, 0, mouseX, mouseY, mouseX+r, mouseY+r, 800, 600);
  line(mouseX, mouseY, pmouseX+30, pmouseY+40);
  line(mouseX, mouseY, pmouseX-16, pmouseY-13);
  line(pmouseX+14, pmouseY-16, mouseX, mouseY);
  strokeWeight(1);
  line(pmouseX+30, pmouseY+40, pmouseX-r, pmouseY-r);
  line(mouseX+15, pmouseY+24, pmouseX+14, pmouseY-16);
 
  
  }
}  

