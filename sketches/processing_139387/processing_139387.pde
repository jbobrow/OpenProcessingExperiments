


boolean clicked;
int X = 0;
int Y = 0;
float a = 0;
float d = 3;
float c = 0;
float arcLength = 0;
float w;
void setup() {
  size (700, 500);
  background(#000000);
  colorMode(HSB);
  frameRate(20);
  background(0);
}

void draw()
{
  background(#000000);


  if (clicked) {
    stroke(random(255), random(255), random(255));
    strokeWeight (10);
    line(X, Y, random(width), random(height));
  }
}
void mouseClicked() {
  clicked = true;
  X= mouseX;
  Y = mouseY;
  background(#000000);
   w = 9.8;
  arcLength +=w/2;
  float theta = PI + arcLength/d;
  a += theta/100;
  d+=5.8;
  strokeWeight(8);
  // stroke(0,255,255); //
  stroke(color(c, 100, 200));
  // stroke(c);
  line(width/2+d*cos(a), height/2+d*sin(a), width/2+(d+5)*cos(a+theta), height/2+(d+5)*sin(a+theta));
  c+=1.49;
}





