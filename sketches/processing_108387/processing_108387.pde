
float r;
float g
float b;
float a;

float diam;
float x;
float y;

void setup(){
size(200,200);
background(255);
smooth();
}

void Draw(){
r = random(255);
g = random(255);
b = random(255);
a = random(255);

diam = random(20);
x = random(width);
y = random(height);

nostroke();
fill(r, g ,b, a);
ellipse(x, y, diam, diam);
}
