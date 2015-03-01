
float beginX = 20.0; // Initial x-coordinate
float beginY = 20.0; // Initial y-coordinate
float endX = 370.0; // Final x-coordinate
float endY = 380.0; // Final y-coordinate
float distX; // X-axis distance to move
float distY; // Y-axis distance to move
float exponent = 3.0; // Determines the curve
float x = 0.0; // Current x-coordinate
float y = 0.0; // Current y-coordinate
float step = 0.01; // Size of each step along the path
float pct = 0.0; // Percentage traveled (0.0 to 1.0)
int direction = 1;

float GbeginX = 380.0; // Initial x-coordinate
float GbeginY = 20.0; // Initial y-coordinate
float GendX = 20.0; // Final x-coordinate
float GendY = 380.0; // Final y-coordinate
float GdistX; // X-axis distance to move
float GdistY; // Y-axis distance to move
float Gexponent = 3.0; // Determines the curve
float Gx = 0.0; // Current x-coordinate
float Gy = 0.0; // Current y-coordinate
float Gstep = 0.01; // Size of each step along the path
float Gpct = 0.0; // Percentage traveled (0.0 to 1.0)
int Gdirection = 1;

float PbeginX = 200.0; // Initial x-coordinate
float PbeginY = 20.0; // Initial y-coordinate
float PendX = 200.0; // Final x-coordinate
float PendY = 380.0; // Final y-coordinate
float PdistX; // X-axis distance to move
float PdistY; // Y-axis distance to move
float Pexponent = 3.0; // Determines the curve
float Px = 0.0; // Current x-coordinate
float Py = 0.0; // Current y-coordinate
float Pstep = 0.01; // Size of each step along the path
float Ppct = 0.0; // Percentage traveled (0.0 to 1.0)
int Pdirection = 1;

void setup() {
size(400, 400);
noStroke();
distX = endX - beginX;
distY = endY - beginY;

GdistX = GendX - GbeginX;
GdistY = GendY - GbeginY;

PdistX = PendX - PbeginX;
PdistY = PendY - PbeginY;
}
void draw() {
fill(250,0,250, 2); //background
rect(0, 0, width, height);

pct += step * direction; //white ball
if ((pct > 1.0) || (pct < 0.0)) {
direction = direction * -1;
}
if (direction == 1) {
x = beginX + (pct * distX);
float e = pow(pct, exponent);
y = beginY + (e * distY);
} else {
x = beginX + (pct * distX);
float e = pow(1.0-pct, exponent*2);
y = beginY + (e * -distY) + distY;
}
fill(0, 200, 180,100);
ellipse(x, y, 160, 160);

Gpct += Gstep * Gdirection; //green ball
if ((Gpct > 1.0) || (Gpct < 0.0)) {
Gdirection = Gdirection * -1;
}
if (Gdirection == 1) {
Gx = GbeginX + (Gpct * GdistX);
float Ge = pow(Gpct, Gexponent);
Gy = GbeginY + (Ge * GdistY);
} else {
Gx = GbeginX + (Gpct * GdistX);
float Ge = pow(1.0-Gpct, Gexponent*2);
Gy = GbeginY + (Ge * -GdistY) + GdistY;
}
fill(0,225,144,100);
ellipse(Gx, Gy, 160, 160);

Ppct += Pstep * Pdirection; //yellow ball
if ((Ppct > 1.0) || (Ppct < 0.0)) {
Pdirection = Pdirection * -1;
}
if (Pdirection == 1) {
Px = PbeginX + (Ppct * PdistX);
float Pe = pow(Ppct, Pexponent);
Py = PbeginY + (Pe * PdistY);
} else {
Px = PbeginX + (Ppct * PdistX);
float Pe = pow(1.0-Ppct, Pexponent*2);
Py = PbeginY + (Pe * -PdistY) + PdistY;
}
fill(0,255,224,100);
ellipse(Px, Py, 160, 160);


}


