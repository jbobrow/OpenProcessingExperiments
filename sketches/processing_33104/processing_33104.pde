
PImage ball1;
PImage ball2;
PImage ball3;
PImage ball4;
PImage ball5;
PImage backair;


//first we state and define our variables
float yPos1 = 0;
float yPos2= 0;
float yPos3 = 0;
float yPos4= 0;
float yPos5=0;

float x=140;

float vel1 = 8;
float vel2 = 2;
float vel3 = 6;
float vel4 = 1;
float vel5 = 7;
//float acc1 = .5;

void setup() {
  size(500, 500);
  smooth();
  ball1=loadImage ("ball1.png");
  ball1.resize(60, 60);
  ball2=loadImage ("ball2.png");
  ball2.resize(80, 80);
  ball3=loadImage ("ball3.png");
  ball3.resize(80, 80);
  ball4=loadImage ("ball4.png");
  ball4.resize(80, 80);
  ball5=loadImage ("ball5.png");
  ball5.resize(80, 80);
  backair=loadImage ("airflash2.jpg");
}

void draw() {
  image(backair, 0, 0);
  noStroke();

  yPos1 += vel1; //saying increment by vel each time loops run...vel is defined at top.
  //vel1 += acc1; //telling it to speed up as ball comes down (force of gravity)
  yPos2 += vel2;
  yPos3 += vel3;
  yPos4 += vel4;
  yPos5 += vel5;
  image(ball1, yPos1, 120); //remember yPos is center of circle.
  image(ball2, 100, yPos2);
  image(ball3, 200, yPos3); //second ellipse
  image(ball4, 300, yPos4);
  image(ball5, 400, yPos5);



  if (yPos1 > width-x || yPos1 < 0) {
    vel1 *= -1;
  }
  if (yPos2 > height-x || yPos2 < 0) {
    vel2 *= -1; /*when it surpasses 0 or max height,
     //you are telling it to inverse the increment from pos to neg
     //so that ball turns around*/
  }
  if (yPos3 > height-x || yPos3 < 0) {
    vel3 *= -1;
  }
  if (yPos4 > height-x || yPos4 < 0) {
    vel4 *= -1;
  }
  if (yPos5 > height-x || yPos5 < 0) {
    vel5 *= -1;
  }
  //vel1 *= -.95; //telling it to decrease acceleration as the number of reps pass...basically slow down w gravity. if this one is inactive, activate command on top and vice versa


}


