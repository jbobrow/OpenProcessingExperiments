
void setup() {
size(600, 600);
background(255);
}
void catmullRom (float x1, float y1, float x2, float y2, 
float x3, float y3, float x4, float y4) { // equivalent to Processing curve() function
beginShape();
for (float t=0; t<=1; t+=0.02) {
float t2 = t*t;
float t3 = t2*t;
float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2;
float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2;
vertex(x, y);
}
endShape();
}
void draw() {
float c = random(134,255);
if (mousePressed)
catmullRom(100, 0, mouseX, mouseY, width-300, 300, width, 0);
stroke(255,c,c);
fill(255, c,c);
}
