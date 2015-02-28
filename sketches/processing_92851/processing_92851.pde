
/* @pjs preload="earth.png, trampoline.png, shadow.png, trampoline_bent.png, magnet.png, space.jpeg"; */
//Elli_100812_2
//trampoline simulation 

float ball_dia = 40;
float x=100;
float speed = 0.0;  
float dir=1;
float distance = 0.0;
boolean OK=false;
PImage earth;
PImage trampoline;
PImage shadow;
PImage trampoline_2;
PImage magnet;
PImage space;
float turner=0;

void setup() {
  size(500, 650);
  smooth();
  frameRate(30);
  earth= loadImage("earth.png");
  trampoline=loadImage("trampoline.png");
  shadow = loadImage("shadow.png");
  trampoline_2 = loadImage("trampoline_bent.png");
  magnet = loadImage ("magnet.png");
  space = loadImage ("space.jpeg");
}

void draw() {
  background(space);
  //  image(trampoline, 50, 600, 400, 100);
  image(magnet, 147, -190);
  //  scale(50,50);

  if (dir>0) {
    distance= height-x;
  } 
  else {
    distance =x;
  }
  x = x + (speed * dir);
  speed=distance/25;


  // when the ball hits the line, it should bounce back fast
  if (x>(height-(ball_dia*1.3))) {
    dir = dir * -2;
  }

  // when the ball hits the top edge, it should bounce back, but not as fast as the above
  if (x < (ball_dia/.5)) {
    dir= dir * -.5;
  }

  if (x>=587) {
    image(shadow, 232, (x+10), ball_dia, ball_dia);
    image(trampoline_2, 50, 600, 400, 90);
  }
  else {
    image(trampoline, 50, 600, 400, 90);
  }


  if (turner==0.05) {
    turner+=0.01;
  } 
  if (turner==0) {
    turner-=0.01;
  }

  // earth
  rotate(radians(turner));
  //  beginShape();
  //  texture(earth);
  //  vertex(230, x, ball_dia, ball_dia);
  //  vertex(220, x, ball_dia, ball_dia);
  //  vertex(230, x, ball_dia, ball_dia);
  //  vertex(220, x, ball_dia, ball_dia);
  image(earth, 232, x, ball_dia, ball_dia);
  // endShape();




  println(x);
}



