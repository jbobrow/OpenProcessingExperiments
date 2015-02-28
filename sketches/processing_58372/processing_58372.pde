
Ball oneBall;

boolean animate = true;

int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;


void setup() {
size(400, 500);
smooth();
oneBall = new Ball();

}


void draw () {
background(64);
oneBall.move();
oneBall.display();
if (animate == true) {
fill(#0EFF03);
}
else { fill(#E9FF03);
}
rect(btnX, btnY, btnW, btnH);
}


void mousePressed() {
if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
// toggle the value of on
// in other words, if  true, then on becomes not true (false) and
// vice versa
animate = !animate; // 
}
}

class Ball {

float speed;
float gravity;
float xpos;
float ypos ;
float dimensions;

Ball () {
speed = 0;
gravity = 0.1;
xpos = width/4;
ypos = -100;
dimensions = 50;

}

void display () {
ellipse (xpos, ypos, dimensions,dimensions);

}
void move() {
if (animate == true) {
ypos = ypos + speed;
speed = speed + gravity;
if (ypos >= height-120) {
// reduce the speed on every bounce to make it more
// realistic.. try -1 and see what happens
speed *= -0.9;
}
}
}
}
