

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
}
float x;
float y;
float a;
float c;
float d;
float e;
float linewidth;
float r, g, b;
float mx;//direction
float my;//direction
float mmx;
float mmy;

void draw() {

  if (mousePressed) {
    x=mouseX;
    y=mouseY;
    stroke(255);
    a=random(-50, 50);
    c=random(-50, 50);
    d=random(-100, 100);
    e=random(-100, 100);
    mx=random(-20,20);
    my=random(-20,20);
  }
  x=x+mx;
  y=y+my;
  r=random(0, 255);
  g=random(0, 255);
  b=random(0, 255);
  fill(r, g, b);
  triangle(x, y, x+a, y+c, x+d, y+e);
 if (x<0) {
   mx=-mx;
 }
 if (x>800) {
   mx=-mx;
 }
 if (y<0) {
   my=-my;
 }
 if (y>600){
   my=-my;
 }
}

void keyPressed() {
  println(key);
  if (key=='s') {
    String filename = year()+"_"+month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second()+".png";
    //This give us a unique filename for each press of "s"
    save(filename);
  }
  if (key=='b') {
    background(0);
  }
}
