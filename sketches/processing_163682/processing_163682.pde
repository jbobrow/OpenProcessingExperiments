
void setup() {
size(500, 500);
noLoop();
}
void draw() {
background(0);
tail(270,12,HALF_PI/3);
}
void tail(int xpos, int units, float angle) {
pushMatrix();
translate(xpos, 250);
for (int i = units; i > 0; i--) { // Count in reverse
strokeWeight(i*3);
fill(72,25*i,239, 33);
stroke(72,212,239, 103);
ellipse(0, 0, 150, 440);
//line(0, 50, 50, 220);
//line(0, 150, 150, 220);
//line(0, 200, 200, 220);
//line(0, 250, 250, 220);
stroke(25*i,72,239,83);
ellipse(0, 275, 100, 220);
translate(0, 8);
rotate(angle);
}
popMatrix();
}



