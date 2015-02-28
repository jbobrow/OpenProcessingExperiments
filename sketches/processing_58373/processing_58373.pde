
Ball[] balls = new Ball[25];

boolean animate = true;


int btnX = 260;
int btnY = 50;
int btnW = 80;
int btnH = 80;

void setup() {
size(400, 500);
smooth();
for (int i=0; i<25; i++)
balls[i]= new Ball(1.5*i,0.5*i, width/28*i );
 
}


void draw () {
background(64);
for (int i=0; i<balls.length; i++) {
balls[i].move();
balls[i].display();
}
 if (animate == true) {
    fill(#E9FF03);
 }
 else { fill(#2BFF03);
 }
rect(btnX, btnY, btnW, btnH);
}


void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    // toggle the value of on
    // in other words, if  true, then on becomes not true (false) and
    // vice versa
    animate = !animate;   // 
  }
}

class Ball {

float speed;
float gravity;
float xpos;
float ypos ;
float dimensions; 

Ball (float dimensions_, float speed_, float xpos_) {
speed = speed_;
gravity = 1;
xpos = xpos_;
ypos = -150;
dimensions = dimensions_;

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
speed *= -1.1;
}
}
}
}
