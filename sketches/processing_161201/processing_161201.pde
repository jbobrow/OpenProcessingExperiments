


void setup() {
 background(0,0,0);
 noStroke();
 
  size(1010,500);
  smooth();
frameRate(30000);}

void draw() {
  fill(random(-mouseX,200),random(230,250),mouseX); 

  float r = random(30,40);
  ellipse(mouseX,mouseY,r,mouseX/4);
}


