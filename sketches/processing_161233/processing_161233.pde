
int x, y;
int nx, nx;
int delay;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  nx = x;
  ny = y;
  delay = 10;
  fill(255);
  noStroke();
  frameRate(60);
}
void updatePlayer() {
    x+=(nx-x)/delay;
    y+=(ny-y)/delay;
    if (left) {nx-=5;}
    else if (right) {nx+=5;}
    if (up) {ny-=5;}
    else if (down) {ny+=5;}
    ellipse(x, y, 20, 20);
}
void draw() {
    background(51);
    updatePlayer();
}

Boolean left = false;
Boolean right = false;
Boolean up = false;
Boolean down = false;

void keyPressed() {
    if (key == 'a') {left = true;}
    if (key == 'd') {right = true;}
    if (key == 'w') {up = true;}
    if (key == 's') {down = true;}
}
void keyReleased() {
    if (key == 'a') {left = false;}
    if (key == 'd') {right = false;}
    if (key == 'w') {up = false;}
    if (key == 's') {down = false;}
}
