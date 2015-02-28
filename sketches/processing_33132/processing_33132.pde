
float r;
float g;
float b;
float a;
float diam;
float x;
float y;


void setup() {
size(255,300);
background(0);
smooth();
}


 
void draw() {
// Fill all variables with random values
r = random(255);
g = random(255);
b = random(7);
a = random(255);
diam = random(20);
x += random(8);
y += random(1);
// Use values to draw an ellipse
noStroke();
fill(r,g,b,a);
ellipse(r,g,b,a);

if(g>300 || a>255){
  diam =0+ random(80);
}
}

