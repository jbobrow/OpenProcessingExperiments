
int size = 20;
int sz = 40;
int nboletes = 50;
float []posX = new float [nboletes];
float []posY = new float [nboletes];
float []velX = new float [nboletes];
float []velY = new float [nboletes];
void setup() {
size(600, 600);
for ( int i=0; i<nboletes; i++) {
posX [i] = width;
posY [i] = height;
velX[i] = random (1, 5);
velY[i] = random (1, 5);
}
}
void draw() {
background(88, 206, 234);
fill(240, 248, 250);
for (int i=0; i<nboletes; i++) {
posX[i] += velX[i];
posY[i] += velY[i];
if ((posX[i]<20)||(posX[i]>width)) {
velX[i]=-velX[i];
}
if ((posY[i]<20)||(posY[i]>height)) {
velY[i]=-velY[i];
}
strokeWeight(1);
fill(255);
ellipse(posX[i], posY[i], sz, sz);
ellipse(300, 450, 250, 295);
ellipse(300, 300, 130, 130);
fill(0);
ellipse(280, 280, 10, 10);
ellipse(320, 280, 10, 10);
rect(245, 230, 115, 20);
rect(255, 150, 90, 80);
fill(216, 100, 11);
triangle(300, 300, 250, 305, 300, 305);
fill(216, 183, 11);
ellipse(540, 50, 70, 70);
}
}



