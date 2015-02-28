
float r = random (255);
float g = random (235);
float b = random (250);
float k = random (240);
float l = random (230);
float c = random (225);


void setup() {
size(1200, 900);
smooth();
colorMode(HSB, 360, 100, 100);
frameRate(1);
}
 
void draw() {
background(120);
for (int i = 20; i < width; i += 40) {
for (int j = 20; j < height; j += 40) { 
 
if (int(random(0, 2)) == 0) {
fill(r,g,b);
}
else {
fill(k,l,c);
}
 
ellipse(i, j, 30, 30);
}
}
}
