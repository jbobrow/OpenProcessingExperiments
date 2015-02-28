
color c = color(0);
float x = 250;
float y = 250;
float speed = 1;


void setup() {
  size(500,500);
}

void draw() {
  background(140);
  move();
  display();
}


void keyPressed() {
  if (c == 0) {
    c = 255;
  } else {
    c = 0;
  }
 }
 
 void mouseClicked () {
   if (speed == 1)  {
     speed = 0;
   } else {
    speed = 1;
   }
 } 

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  fill(c);
  rect(x,y,70,20);
}

