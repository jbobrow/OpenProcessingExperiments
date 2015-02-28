
PImage b;
void setup() {
  size(400, 400);
  b=loadImage("stars.png");
}
void draw(){
    background(0);
  b=loadImage("stars.png");
  smooth();
  float mx = constrain(mouseX, 125, 250);
  float my = constrain(mouseY, 125, 200);
  float rx = constrain(mouseX,125, 200);
  float ry = constrain(mouseY, 125, 200);
  if (mousePressed == true) {
    stroke(0);
    strokeWeight(15);
    //cursor(b,15, 15);
  } //else {
    //noStroke();
   // cursor(HAND);
 // }
  smooth();
  image(b, 125, 100, 150, 150);
  image(b, 500, 100, 150, 150);
  fill(#2A8E25);
  ellipse(mx, my, 10,10);
  //ellipse(rx, ry, 20, 20);
  //ellipse(mx, my, 10, 10);
 // ellipse(rx, ry, 10, 10);

}

