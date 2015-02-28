
float xoff=0.0;
void setup() {
  size(700, 450);
  background(0);
}
void draw() {
  if(focused){
  xoff = xoff + .01;
  float  xoff2 = xoff + xoff;
  noFill();
  stroke(255, 15);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 500*noise(xoff), 500*noise(xoff));
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
}
