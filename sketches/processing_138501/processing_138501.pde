
// just another pretty pattern that PI draws

float a = 0;
float d = 3;
float c = 0;
float arcLength = 0;
float w;

void setup() {
  size(800, 600);
  colorMode(HSB);
  frameRate(20);
  background(0);
}
void draw() {

 // all parameters are tweakable, it gives weird, pretty pattern. 
  w = 9.8;// -&gt;hexagon!!!
  arcLength +=w/2;
  float theta = PI + arcLength/d;
  a += theta/100;
  d+=5.8;
  strokeWeight(2);
  // stroke(0,255,255); //
  stroke(color(c, 100, 200));
  // stroke(c);
  line(width/2+d*cos(a), height/2+d*sin(a), width/2+(d+5)*cos(a+theta), height/2+(d+5)*sin(a+theta));
  c+=1.49;
}
