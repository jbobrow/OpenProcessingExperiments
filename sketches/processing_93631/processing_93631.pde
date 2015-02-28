
float r= 100;
float g = 150;
float b = 200;
float a = 200;
float diam = 20;
float x = 100;
float y = 100;

void setup () {
  size(200,200);
  background(255);
  smooth();
  
}

void draw () {
  stroke (0);
  fill(r,g,b,a);
  ellipse (mouseX,mouseY,diam,diam);
  x = int(random(0,255));
  y = int(random(0,255));
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
  a = int(random(0,255));
  diam = int(random(2,20));

}




