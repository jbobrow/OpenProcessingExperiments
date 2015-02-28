
//Midterm Project - Race Cars
//James Kim 10/24/2011

PImage rc;
PImage rc2,rc3,wall,wall2;
float x = 0;
float y = 100;
float xx = 5;
float speeda = 3;
float speed = 10;
float dx,dy;
float easing;

void setup() {
  size(700,700);
  smooth();
  rc = loadImage("rc.png");
  rc2 = loadImage("rc2.png");
  rc3 = loadImage("rc3.png");
  wall = loadImage("wall.png");
  wall2 = loadImage("wall2.png");
  image(rc,0,0);
  easing = .02;
}

void draw() {
  background(90);
  move();
  display();
  dx=mouseX-x;
  dy=mouseY-y;
  x=x+dx*easing;
  y=y+dy*easing;
  image(rc,x,y);
}

void move() {
  
  x = x + speeda;  //the cars speed
  if (x > width) {
    x = 0;
  
  
  }
}

void display() {
  image(rc2,x,350);
  image(rc3,x,270);
  image(wall,1,0);
  image(wall2,1,500);
}

// controls rc3(blue car)
void keyPressed(){
  if(keyCode==37){
    x--;
  }
  if(keyCode==39){
    x++;
  }
  if(keyCode==38){
    y--;

  }
  if(keyCode==40){
    y++;
  }
}

