
int num = 80;
int[] dx = new int[num]; 
int[] dy = new int[num]; 
void setup() {
size(300, 500);
for (int i = 0; i < num; i++) {
dx[i] = i * 5;
dy[i] = 12 + (i * 6);
}
}
void draw() {

background(22, 137, 132);

for (int i = 0; i < num; i++) {
dx[i] = dx[i] + 1;
if (dx[i] > 100) {
dx[i] = -100;
}
diagonals(dx[i], dy[i]);
}
}
void diagonals(int x, int y) {
  strokeWeight(2);
  
line(x, y, x+400, y-400);
strokeWeight(1);
line(x+100, y, x+400, y-400);
strokeWeight(3);
line(x+200, y, x+400, y-400);
}

