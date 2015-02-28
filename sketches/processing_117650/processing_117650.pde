
void setup() {
  size(700, 450);
  background(0);
  frameRate(450);
  rectMode(CENTER);
}
int i=0;
float x=0;
float y=height/3;
float xchange=1;
float ychange=1;
float xoff=0.0;
void draw() {
  //noStroke();
  if(focused){
  xoff+=0.1;
  float r=noise(xoff)*height;
  if (frameCount%2==0) {
    stroke(255, 255, 0, 128);
    line(x, 0, x, r);
  }
  else {
    stroke(255, 0, 255, 128);
    line(x, height, x, height-r);
  }
  x+=1*xchange;


  if (x<0) {
    x=0;
    xchange*=-1;
  }
  if (x>width) {
    x=width;
    xchange*=-1;
  }
  println(frameRate);
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
}
}
