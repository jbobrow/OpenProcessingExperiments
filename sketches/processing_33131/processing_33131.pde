
int distance_from_point = 150;
int num_of_circles=3;
int circle_size=200;
float degree_step= TWO_PI/num_of_circles;
float angle = 0;
int starting_degree_step= 3;
float circleY;
float circleX;
float vel=5;
PImage bronto;
PImage stego;
PImage trex;
PImage tero;

void setup(){
  size (400,400);
  bronto=loadImage("bronto.gif");
  stego=loadImage("stegosaurus.gif");
  trex=loadImage("trex.gif");
  tero=loadImage("tero.gif");
  smooth();
}

void draw() {
  angle=radians(starting_degree_step);
  background(173,246,247);
  image(bronto,width/2+cos(angle)*distance_from_point, height/2+sin(angle) * distance_from_point,circle_size, circle_size);
  angle += degree_step;
  image(stego,width/2+cos(angle)*distance_from_point, height/2+sin(angle)*distance_from_point,circle_size, circle_size);
  angle += degree_step;
  image(trex,width/2+cos(angle)*distance_from_point, height/2+sin(angle)*distance_from_point,circle_size, circle_size);
  
  starting_degree_step+=1;
  circleY=circleY+vel;
  circleX=circleX+2;
  
  image(tero,circleX,circleY,100,100);
  
  if ((circleY<0)||(circleY>200)){
    vel=vel*-1;
}
if(circleX>=400)
{
  circleX=0;
}
}

