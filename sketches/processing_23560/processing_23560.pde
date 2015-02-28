
PImage fondo;
void setup() {
  size(1024,768,P3D);
  fondo = loadImage ("Caracas.png");
  noStroke();
  lights();
}
void draw() {
 background (0);
 image(fondo,0,0);

 pushMatrix();
  strokeWeight(5);
  stroke(#56e5fa);
  fill(#333c3d);
  rotateX(frameCount * PI/2 * .10);
  rotateY(30 * .02);
  ellipse (96,78,52,52);
 popMatrix();

 }


