
// These 8 variables allow the 4 waves to run. Variables b, y, g, and u make up the progression of the waves along the X-Axis, the rest do the same for the Y.
float a = 250;
float b = 1;
float x = 250;
float y = 1;
float g = 1;
float h = 250;
float u = 1;
float p = 250;
void setup() {
size(1000,1000);
background(50);
frameRate(125);
noStroke();
}
void draw() {
//The equations below create the sinwave effect. The functions are very simple, the Y-Axis equations are transformed to fill the screen appropriately.
b = b + 0.5;
a = 250*sin(b/100)+500;
y = y + 0.5;
x = 250*cos((y+157)/100)+500;
g = g + 0.5;
h = 100*sin(g/100)+500;
u = u + 0.5;
p = 100*cos((u+157)/100)+500;
colorMode(HSB);
fill(b/3.5,255,255);
ellipse(y,x,10,50);
ellipse(b,a,10,50);
ellipse(g,h,1,1);
ellipse(u,p,1,1);
}


