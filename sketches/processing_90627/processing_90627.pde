
float beginX = 20.0; 
float beginY = 10.0; 
float endX = 70.0; 
float endY = 80.0; 
float distX; 
float distY; 
float exponent = 3.0; 
float exponentB = 8.0; 
float exponentC = 2.0; 
float x = 0.0; 
float y = 0.0; 
float xB = 0.0; 
float yB= 0.0;
float xC = 0.0; 
float yC= 0.0;
float step = 0.01; // Size of each step along the path
float pct = 0.0; // Percentage traveled (0.0 to 1.0)
int direction = 1;

void setup() {
size(100, 100);
noStroke();
smooth();
distX = endX - beginX;
distY = endY - beginY;
}

void draw() {
fill(0, 20);
rect(0, 0, width, height);
pct += step * direction;
if ((pct > 1.0) || (pct < 0.0)) {
direction = direction * -1;
}
if (direction == 1) {
x = beginX + (pct * distX);
float e = pow(pct, exponent);
y = beginY + (e * distY);

xB = (beginX+5) + (pct * distX);
float f = pow(pct, exponentB);
yB = (beginY) + (f * distY);

xC = (beginX+15) + (pct * distX);
float g = pow(pct, exponentC);
yC = (beginY) + (g * distY);

} else {
  
x = beginX + (pct * distX);
float e = pow(1.0-pct, exponent*2);
y = beginY + (e * -distY) + distY;

xB = (beginX+5) + (pct * distX);
float f = pow(1.0-pct, exponentB*2);
yB = (beginY) + (f * -distY) + distY;

xC = (beginX+5) + (pct * distX);
float g = pow(1.0-pct, exponentC*2);
yC = (beginY) + (g * -distY) + distY;

}
fill(255, 0, 80, 180);
ellipse(x, y, 12, 12);
fill(0, 180, 150, 180);
rect(xB, yB, 30, 5);
fill(0, 150, 190, 180);
rect(xC, yC, 15, 15);
}
