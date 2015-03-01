
float xoff = 0.0, r = 20, distance = 0.1;
boolean isMouthOpen = true;
int num = 10;
void setup() {
size(600, 800);
noStroke();
}
void draw() {
background(0, 100, 50);
drawHair();
drawEye(width/2 -width*0.1, height * 0.5,distance );
drawEye(width/2 + width*0.25, height * 0.5, distance);
moveMouth();
drawMouth();
xoff+=0.1;
}
void moveMouth() {
if (isMouthOpen) {
if ( distance<10) {
distance+=noise(xoff);
} else
isMouthOpen = false;
} else {
if ( distance>0.1) {
distance-=noise(xoff);
} else
isMouthOpen = true;
}
}
void drawEye(float x, float y, float d) {
float w = map(d,0.1,10,1,0.3);
fill(0,70+w*100);
pushMatrix();
translate(x, y+w*15);
rotate(radians(110));
beginShape();
vertex(0, 0);
bezierVertex(20*w, 10, 15*w, 60, 0, 65);
vertex(0, 65);
bezierVertex(-15*w, 60, -20*w, 10, 0, 0);
endShape();
popMatrix();
}
void drawMouth() {
pushMatrix();
translate(0, height *0.7);
for (int i=0; i<num; i++) {
fill(0, random(100, 250), 50, 50);
float x =width/num*i+ width/num*0.5;
float y = distance*r*sin(width/num*i);
drawLeaf(x, y);
}
popMatrix();
}
void drawHair() {
randomSeed(0);
for (int i=0; i < 200; i++) {
fill(0, random(100, 200), 0, 50);
drawLeaf(random(0, width), random(0, height/3), 
radians(random(0, 360)), random(1, 1.5));
}
}
void drawLeaf() {
beginShape();
vertex(0, 0);
bezierVertex(20, 10, 15, 60, 0, 65);
vertex(0, 65);
bezierVertex(-15, 60, -20, 10, 0, 0);
endShape();
}
void drawLeaf(float x, float y) {
pushMatrix();
translate(x, y);
beginShape();
vertex(0, 0);
bezierVertex(20, 10, 15, 60, 0, 65);
vertex(0, 65);
bezierVertex(-15, 60, -20, 10, 0, 0);
endShape();
popMatrix();
}
void drawLeaf(float x, float y, float d) {
pushMatrix();
translate(x, y);
rotate(d-radians(90)+radians(noise(xoff)*45));
beginShape();
vertex(0, 0);
bezierVertex(20, 10, 15, 60, 0, 65);
vertex(0, 65);
bezierVertex(-15, 60, -20, 10, 0, 0);
endShape();
popMatrix();
}
void drawLeaf(float x, float y, float d, float s) {
pushMatrix();
translate(x, y);
scale(s);
rotate(d-radians(90)+radians(noise(xoff)*45));
beginShape();
vertex(0, 0);
bezierVertex(20, 10, 15, 60, 0, 65);
vertex(0, 65);
bezierVertex(-15, 60, -20, 10, 0, 0);
endShape();
popMatrix();
}
