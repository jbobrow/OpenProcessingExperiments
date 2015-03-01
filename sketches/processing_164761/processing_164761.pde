
float[] xCoord = new float[100];
float[] yCoord = new float[100];
float[] speed = new float[100];

void setup() {
size(400, 400);
for (int i =0; i <100; i++) {
xCoord[i] = random(width);
yCoord[i]= random(height);
speed[i] = random (10, 25);
}
}
void draw() {
background(#03D7FF);
stroke(#9E19BC);
for (int i = 0; i < 100; i ++){
strokeWeight(3);
point(xCoord[i], yCoord[i]);
yCoord[i] += speed[i];
if (yCoord[i] > height) {
yCoord[i] = 0;
}
}
}
