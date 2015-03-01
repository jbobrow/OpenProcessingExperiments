
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
strokeWeight(2);
fill(72,25*i,239, 83);
stroke(239,25*i,70, 253);
//stroke(72,212,239, 103);
//ellipse(0, 0, 150, 440);
ellipse(0, 50, 50, 120);

ellipse(10, 110, 130, 80);


ellipse(0, 275, 200, 220);
translate(0, 8);
rotate(angle);
}
popMatrix();
}



