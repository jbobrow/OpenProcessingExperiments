
//Kang-Yu,Liu
//exercise 3D 
//20131106

float xstart, xnoise, ystart, ynoise;
void setup() {
size(500, 300, P3D);
sphereDetail(3);
stroke(255);
strokeWeight(0.5);
xstart = random((20)-10);
ystart = random((20)-5);
}

void draw(){

background(115,4,67);
xstart += 0.1;
ystart += 0.1;
xnoise = xstart;
ynoise = ystart;
for (int y = 0; y <= height; y+=25) {
ynoise += 0.5;
xnoise = xstart;
for (int x = 0; x <= width; x+=5) {
xnoise += 0.5;
drawPoint(x, y, noise(xnoise, ynoise));
}
}
}
void drawPoint(float x, float y, float noiseFactor) {
pushMatrix();
translate(x, 300-y, -y);
float sphereSize = noiseFactor *35;
float grey = 180 + (noiseFactor /30);
float alph = 180 + (noiseFactor * 120);
fill(239,233,grey, alph);
sphere(sphereSize);
popMatrix();
}




