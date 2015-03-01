
void setup() {
size(500, 500);
background(95,85,133);
noStroke();
smooth();
noLoop();
randomSeed(1145);
}
void draw() {
drawRect(133, 50, 280, 8);
}
void drawRect(float x, float y, int radius, int num) {
float value = 126 * num / 6.0;
fill(value, value*1.5, value+50,50);
rect(x, y, radius*2, radius*2);
if (num > 1) {
num = num - 1;
int branches = int(random(2, 4));
for (int i = 0; i < branches; i++) {
float a = random(0, TWO_PI);
float newx = x + cos(a) * 12.0 * num;
float newy = y + sin(a) * 12.0 * num;
drawRect(newx, newy, radius/2, num);
}
}
}


