
float angle = 0.0;
void setup() {
size(400, 400);
smooth();
noStroke();
}
void draw() {
fill(0, 12);
rect(0, 0, width, height);

fill(150,250,250,120);
angle = angle + 0.02;
translate(200, 200);
rotate(angle);
pushMatrix();
translate(-40,0);
rect(-30, -30, 60, (angle % 0.4) *160);
popMatrix();

fill(250,250,150,120);
angle = angle + 0.02;
translate(20, 20);
rotate(angle);
pushMatrix();
translate(-20,-20);
rect(-10, -10, 60, (angle % 0.4) *160);
popMatrix();

fill(250,150,150,120);
angle = angle + 0.02;
translate(20, 20);
rotate(angle);
pushMatrix();
translate(-20,-20);
rect(-10, -10, 60, (angle % 0.4) *160);
popMatrix();
}


