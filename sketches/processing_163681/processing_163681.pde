
void setup() {
size(500, 500);
stroke(72,212,239, 153);
noLoop();
}
void draw() {
background(30);
tail(270,10,HALF_PI/3);
}
void tail(int xpos, int units, float angle) {
pushMatrix();
translate(xpos, 250);
for (int i = units; i > 0; i--) { // Count in reverse
strokeWeight(i);
stroke(72,25*i,239, 153);
line(0, 0, 0, 220);
translate(0, 8);
rotate(angle);
}
popMatrix();
}



