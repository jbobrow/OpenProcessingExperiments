
PImage img;

int x = 230;
int y = 150;
int a = 250;
int b = 300;
float angle = 0.0;
float offset = 130;
float scalar = 10;
float speed = 0.05;

void setup(){
  size(500,500);
  smooth();
  img = loadImage("planet.jpg");
}

//NECK
void draw(){
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.8) * scalar;
  image(img,0,0);
  fill(36,114,180);
  noStroke();
  rect(x,y,40,30);
  fill(191,225,255,10);
  rect(265,y,6,30);

//HEAD

  fill(191,225,255);
  noStroke();
  arc(250,155,100,100,PI,TWO_PI);//head
  fill(2,94,173);
  arc(230,y1,20,20,PI,TWO_PI);//left eye
  arc(270,y2,20,20,PI,TWO_PI);//right eye
  angle += speed;

//BODY

  fill(191,225,255);
  ellipse(a,b + 30,10,10);//Small Bottom
  fill(36,114,180);
  ellipse(a,b,50,50);//Large Bottom
  fill(191,225,255);
  rect(200,175,100,120); //Main
  fill(36,114,180,50);
  rect(275,175,20,120);//Stripe Large
  fill(237,247,255,60);
  rect(275,175,6,120);
}

//Stripe Small






