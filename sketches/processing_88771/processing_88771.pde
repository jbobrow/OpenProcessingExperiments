
PImage pup; //processing image
void setup() {
size(800, 800);
//noCursor();
pup = loadImage("pup.png");
}
void draw() {
background(255);
for (int i=20; i<=width-20; i+=100) {
for (int j=20; j<=width-20; j+=100) {

//float d = dist (mouseX, mouseY, width/2, height/2);
float d = dist (mouseX, mouseY, i, j);
float scaler = map(d, 800, 0, 250, 25);
//tint(255, 0, 0);
//image(pup, width/2, height/2, scaler, scaler); //image(PImage, 0, 0)
image(pup, i, j, scaler, scaler);
}
}
}



