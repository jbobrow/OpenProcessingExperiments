
int num = 60;
int[] dx = new int[num]; // Declare and create an array
int[] dy = new int[num]; // Declare and create an array
void setup() {
size(300,300);
for (int i = 0; i < num; i++) {
dx[i] = i * 5;
dy[i] = 12 + (i * 6);
}
}
void draw() {
background(204);
for (int i = 6; i < num; i++) {
dx[i] = dx[i] + 1;
if (dx[i] > 100) {
dx[i] = -100;
}
diagonals(dx[i], dy[i]);
}
}
void diagonals(int x, int y) {
  stroke (64,0,128);
  fill (202,255,255);
rect(x+40, y, x+20, y-40);
fill (128,128,255);
ellipse(x+30, y, x+30, y-40);
fill (128,0,128);
ellipse(x-60, y+10, x+60, y-40);

}

