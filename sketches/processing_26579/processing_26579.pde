
BlackDot dot1;
BlackDot dot2;

void setup() {
size(500,500);
smooth();
dot1 = new BlackDot();
dot2 = new BlackDot();
}
void draw() {
background(0);
if (keyPressed == true) {
    background(255);
  }

dot1.move();
dot1.display();
dot2.move();
dot2.display();
}

class BlackDot {
float xpos;
float ypos;
float xspeed;
BlackDot() {

   xpos = random(20,width-20); 
   ypos = random(20, height-20);
   xspeed = random(1,5);
}
void display() {
fill(255,0,0);
ellipse(xpos,ypos,20,20);
}
void move() {
xpos += xspeed;
if (xpos > width) {
xpos = 0;
}
}
}

 



