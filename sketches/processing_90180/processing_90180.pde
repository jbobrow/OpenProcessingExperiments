
float angle = 0.30; 
float speed = 2.0; 
float radius = 150.0; 
float sx = 8.0;
float sy = 8.0;
void setup() {
size(500, 500);
noStroke();
smooth();
}
void draw() {
fill(0, 4);
rect(0, 0, width, height);
angle += speed; 
float sinval = sin(angle);
float cosval = cos(angle);

float x = 250 + (cosval * radius);
float y = 250 + (sinval * radius);
fill(155,8,8);
ellipse(x, y, 3, 3); 

float x2 = x + cos(angle * sx) * radius/2;
float y2 = y + sin(angle * sy) * radius/2;
ellipse(x2, y2, 9, 9); 
}

