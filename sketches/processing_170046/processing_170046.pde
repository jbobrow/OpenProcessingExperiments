
float xoff = 0.0;
float xincrement = 0.01; 
float n = 0;
float r =0.01;
int point = 3;
void setup() {
  size(600, 600);
  background(0);
}

void draw()
{
  colorMode(RGB, 255, 255, 255);
  fill(51, 10);
  noStroke();
  rect(0, 0, width, height);

  translate(mouseX, mouseY);
  point=floor(map(noise(xoff), 0, 1, 3, 7));
  n+= noise(xoff)*TWO_PI;
  if (n>360) n=0;

  if (mousePressed) {
    if(mouseButton ==LEFT){
    if (r>0)
      r-=0.1;
    else
      r+=0.1;
    }
    else if(mouseButton ==RIGHT){
    if (r<0)
      r-=0.1;
    else
      r+=0.1;
    }
  }
    r+= random(-0.1, 0.1);
  float x = r*cos(radians(n))*width/8;
  float y = r*sin(radians(n))*height/8;

  xoff += xincrement;

  colorMode(HSB, 360, 100, 100);
  color c = color(n, 100, 100, 80);
  fill(c);
  noStroke();
  polygon(x, y, 5, point);
  strokeWeight(1);
  stroke(getComplementaryColor(c));
  line(-x, -y, 0, 0);
}
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
color getComplementaryColor(color c) {
  colorMode(RGB, 255, 255, 255);
  float R = red(c), G = green(c), B = blue(c);
  return color(255-R, 255-G, 255-B);
}

