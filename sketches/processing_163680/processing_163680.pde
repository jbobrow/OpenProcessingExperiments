
void setup() {
size(500, 500);
stroke(72,212,239, 153);
noLoop();
}
void draw() {
background(30);
chair(30,3);
chair(175,3);
chair(325,3);
}
void chair(int ypos, int units) {
pushMatrix();
translate(75, ypos);
for (int i = units; i > 0; i--) { // Count in reverse
strokeWeight(i*4);
stroke(132,25*i,2-i*3, 200);
line(0, 0, 0, 120);
line(50,65,50,120);
line(0,65,50,65);
translate(150, 0);
}
popMatrix();
}



