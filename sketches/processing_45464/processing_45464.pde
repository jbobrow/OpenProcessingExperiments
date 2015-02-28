
void setup() {
  size(650, 650);
  smooth();
  background(255);
  colorMode(HSB);
   PImage a;
   a= loadImage("night.jpg");
   image(a,0,0,width/1.0001, height/1.0001);
}

void draw() {
  float speed=abs(mouseX-pmouseX);
  if (mousePressed) {
    fill(22,196,70,12);
    stroke(200);
    rect(mouseX, mouseY, 45, 45);
    textSize(24);
    text ("What is Art?", width/2,height/2-50);
  } else {
    float ell=speed;
    fill(0,88,60,50);
    ellipse(mouseX+random(-20,20),mouseY+random(-20,20), ell,ell);
  }
}

