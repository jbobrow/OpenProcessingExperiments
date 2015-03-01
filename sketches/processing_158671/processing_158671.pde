

float d = 9;
float vel = 1.5;
int direccion = 5;


void setup() {
size(400, 400);
smooth();
noStroke();
fill(0);
} 
void draw() {
background(201,179,189);
ellipse(0, 200, d, d);
ellipse(400, 200, d, d);
ellipse(200, 0, d, d);
ellipse(200, 200, d, d);


for (int i = 0; i < 400; i += 2) { 
stroke (0,1+i); 
line(i, 0, i, 400); 
}

d += vel * direccion;
if ((d > width) || (d < width/20)) {
direccion = -direccion;
}
}

void mousePressed() {
d += 5
}







