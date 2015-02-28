
// Spring ver.1
//Homework:2013-11-13
//Echo Chen (puyce7244@yahoo.com.tw)
//concept: Lavender & water swing in the wind. I use box() to express waterline.


float xstart, xnoise, ystart, ynoise,a;

void setup() {
size(500, 500, P3D);
background(255);
frameRate(3);
xstart = random(10);
ystart = random(10);
}
void draw() {
background(150,213,200);
pushMatrix();
translate(a,0,0);
a+=2;
xstart +=0.05;
ystart +=0.05;
xnoise = xstart;
ynoise = random(50);
for (int y = 0; y <= 2000; y+=30) {
ynoise += 0.1;
xnoise = xstart;
for (int x = -500; x <=2000; x+=60) {
xnoise += 0.1;
drawpoint(x, y, noise(xnoise, ynoise));
drawpoint01(x, y, noise(xnoise, ynoise));
drawpoint02(x, y, noise(xnoise, ynoise));

}
}
popMatrix();
}
void drawpoint01(float x, float y, float noiseFactor) {
float grey = 150 + (noiseFactor * 120);
float alph = 150 + (noiseFactor * 120);

//box
pushMatrix();
translate(x, 500-y, -y);
noStroke();
fill(164,225,213);
rotateY(100);
box(60,10*random(5)/3,60);
popMatrix();
}

//flower

void drawpoint02(float x, float y, float noiseFactor) {
pushMatrix();
translate(x, 500-y, -y);
rotate(noiseFactor*radians(540));
stroke(211,126,216);
strokeWeight(5);
line(0,0,0,0,120,0);
popMatrix();
}

//weed

void drawpoint(float x, float y, float noiseFactor) {
pushMatrix();
translate(x, 500-y, -y);
rotate(noiseFactor*radians(360));
stroke(152,176,57);
strokeWeight(1);
line(0,0,0,0,100,0);
popMatrix();
}


