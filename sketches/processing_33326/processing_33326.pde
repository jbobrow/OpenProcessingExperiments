
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
 
 
void setup() {
size(255,300);
background(255);
frameRate (10);
smooth();
}
 
 
  
void draw(){

// Fill all variables with random values
r = random(255);
g = random(255);
b = random(7);
a = random(255);
diam = random(20);
x += random(8);
y += random(1);
// Use values to draw an ellipse
line (x, y, b, a);
strokeWeight(0.1);

}

