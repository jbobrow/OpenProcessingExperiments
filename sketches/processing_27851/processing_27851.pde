
void setup() {
  size(400, 400);
  background(255);
  smooth();
}
float Mspeed;
 
void draw() {
  stroke(0, 80);
    line(mouseX, mouseY, width, mouseX);
    line(mouseX, mouseY, 0, mouseX);
    stroke(0);
 
  if (mousePressed == true) {
     Mspeed=abs(mouseX-pmouseX);
  println(Mspeed);
  noStroke();
  float taille_ellipse=Mspeed;
  color ellipse_color = color(255+random(0,10), random(255,10), random(255,10));
  fill(ellipse_color);
  ellipse(mouseX+random(-10,10),mouseY+random(-10,10), taille_ellipse,taille_ellipse);
  }
  if (keyPressed == true) {
    background(255);
  }
}
 
void mouseMoved() {
 
}

