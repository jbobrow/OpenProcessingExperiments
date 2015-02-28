
//======================================
//Variables
//======================================
//PImage picCall;
//PImage picCall2;
int x_position = 1;
int x_speed = 5;
int y_position = 200;
int y_speed = 5;

//Void Scope

void setup() {
  size(400, 400);
  //picCall = loadImage("grass.jpg");
  //picCall2 = loadImage("GrassCutter.png");
}

void draw() {
  background(100, 200, 255);
  stroke(255);
  line(0, (height/2)+15, width, (height/2)+15);
  rect( 0, (height/2)+15, width, (height/2)+15);
  //Move
  move();
  //Bounce
  bounce();
  //Display
  display();
}
void move() {
  x_position += x_speed;
}
void bounce() {
  if ((x_position > width) || (x_position < 0) ) {
    x_speed *= -1;
  }
}
void display() {

  drawCar(0, 60, 8, 8);
  drawCar(0, 120, 16, 16);
  drawCar(0, 180, 32, 32);
}
void drawCar(float valueX, float valueY, float valueWidht, float valueHeight) {

  fill(200);
  stroke(255, 255, 255);
  rect((x_position-30)+valueX, ((height/2)-20)+valueY, 120, 20);

  fill(200);
  stroke(255, 255, 255);
  rect((x_position-10)+valueX, ((height/2)-40)+valueY, 80, 40);

  fill(80);
  stroke(255, 255, 255);
  ellipse((x_position)+valueX, (height/2)+valueY, 30, 30);

  fill(80);
  stroke(255, 255, 255);
  ellipse((x_position+60)+valueX, (height/2)+valueY, 30, 30);
}

