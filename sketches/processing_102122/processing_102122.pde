
float r = 100;
float g = 150;
float b = 200;
float a = 20;

float diam = 200;
float x = 100;
float y = 100;

void setup() {
 size(500,500);
 background(0);
 smooth(); 
}

void draw() {
 // A continuación todas las variables asignadas
r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(255);
x = random(width);
y = random(height);

noStroke();
fill(r, g, b, a);
ellipse(x, y, diam, diam);
  
}
