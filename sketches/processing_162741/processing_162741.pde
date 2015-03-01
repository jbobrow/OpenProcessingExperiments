
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
size(600,600);
background(255);
smooth();
}

void draw() {
r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = 60;
x = random(10);
y = random(10);
x = int(x) * diam;
y = int(y) * diam;

noStroke();
fill(r,g,b,a);
ellipseMode(CORNER);
ellipse(x,y,diam,diam);

rectMode(CORNER);
  rect(width - width / 4, height - height / 4, width/4 -1 , height/4-1);
}



