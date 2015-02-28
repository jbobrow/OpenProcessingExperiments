
void setup() {
  size(700, 450);
  background(0);
  frameRate(360);
}
float x=width/3;
float y=height/3;
float xchange=1;
float ychange=1;
void draw() {
if(focused){
  stroke(255, 10);
  y+=random(3, 5)*ychange;
  x+=random(3, 5)*xchange;
  line(width/2, height/2, x, y);
  if (x<0||x>width) {
    xchange*=-1;
  }
  if (y<0||y>height) {
    ychange*=-1;
  }
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
}
