
//animation of pixelated background

float x = 0; y = 0;

void setup() {
size(400, 400);
colorMode(RGB, 50);
background(50);
frameRate(60);
}

void draw() {
x = 0;
while (x < width) {
y = 0;
while (y < height) {
float pixel_colorR = random(0,50);
float pixel_colorG = random(0,50);
float pixel_colorB = random(0,50);
stroke(pixel_colorR, pixel_colorG, pixel_colorB);
for (int i = 0; i < 4; i++) {
for (int j = 0; j < 4; j++) {
point(x+i, y+j);
}
}
y = y + 5;
}
x = x + 5;
}
if (x > width) {
x = 0;
}
}
