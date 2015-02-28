

PFont font;

//graphic class
random_dot r;
nebula n;

void setup() {
size(1280,800, P2D);
frameRate(40);
smooth();
font = loadFont("HelveticaNeue-CondensedBold-24.vlw");
r = new random_dot();
n = new nebula();
}

void draw() {/* this does the drawing once per frame */
  background(0); /* clear the screen with white */ 
  pushMatrix();
  // white float frameRate
  fill(180);
  textFont(font, 12);
  text("FPS :", 20, 20);
  text(frameRate,50,20);
  popMatrix();
  
  
  translate(width*0.5, height*0.5); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  //draw random point
  r.speed(0.01);
  r.draw(50);

  //nebula

  for (int i = 0; i < 500; i += 100){
  int c = i/5;
  n.speed(0.001);
  n.colour(i, i+2, i+10, map(c*3, 100, 0, 100, 0));
  n.display(i,i);
  }

 
}

class random_dot{

float posX=15;
float posY=15;
float time=0;
float NoiseScale=0.02;
int number;

void speed(float t){
  time = time + t;
}

void draw(int n){
  number = n;
  posX = (int) random(0, width);
  posY = (int) random(0, height);
  color a = color(map(posX, 0, 70, 0, 255), map(posX, 0, 70, 0, 255)*2, map(posX, 0, 70, 0, 255)*3);
  //random lines and points
  for (int i = 0; i < n ; i++){
    rotate(time/PI);
    strokeWeight(1);
    stroke(a, 15);
    point(posX, posY);
    line(posX,posY, i*5, i*5);
    
    point(posX, -posY);
    line(posX, -posY, i*5, i*5);
    
    point(-posX, -posY);
    line(-posX, -posY, i*5, i*5);
    
    point(-posX, posY);
    line(-posX, posY, i*5, i*5);
    
  }}
}

class Matrice{
  
}

class nebula{
  
//coordinates, speed
float time;
float cycle_sin = 0;
float speed;
float posX, posY;

//color variable
float red = 0;
float green = 0;
float blue = 0;
float alpha = 100;

void speed(float t){
  time = time + t;
}

void colour(float _r, float _g, float _b, float a){
  red= map(_r, 0, 255, 0, 255);
  green= map(_g, 0, 255, 0, 255);
  blue= map(_b, 0, 75, 0, 255);
  alpha = a;
}

void display(float x, float y){
  posX = x;
  posY = y;
  cycle_sin = sin(cycle_sin) + 0.1;
  for(int u=0; u < 100 ; u++){
  u = u + 1;
    //graphic1
    for(int i= u; i < 10 ; i++){
    color a = color(map(cycle_sin, 0, 70, 0, red)*i, map(cycle_sin, 0, 70, 0, green)*i*2, map(cycle_sin, 0, 70, 0, blue)*i*3);
    translate(time, time);
    rotate(-time);
    strokeWeight(5);
    stroke(a, alpha);
  
    point(1/2*cos(time)+x,1/2*sin(time)+y);
    point(i+time+x, i+time+y);

    strokeWeight(3);
    //line(1/2*cos(time),1/2*sin(time),i+time, i+time);
    //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }
  
  //graphic2
    for(int i= u; i < 20 ; i++){
    color b = color(map(cycle_sin, 0, 30, 0, red)*i, map(cycle_sin, 0, 30, 0, green)*i*2, map(cycle_sin, 0, 30, 0, blue)*i*3);
    translate(cos(time), cos(time));
    rotate(time);
    strokeWeight(5);
    stroke(b, alpha/4);
    point(2*cos(time)+x,2*sin(time)+y);
    point(i+time+x, i+time+y);
    strokeWeight(3);
    //line(2*cos(time),2*sin(time),i+time, i+time);
    //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }
  
  //graphic3
    for(int i= u ; i < 20 ; i++){
    color c = color(map(cycle_sin, 0, 10, 0, red)*i, map(cycle_sin, 0, 10, 0, green)*i*2, map(cycle_sin, 0, 10, 0, blue)*i*3);
    translate(sin(time), sin(time));
    rotate(-time);
    strokeWeight(5);
    stroke(c, alpha/2);
    point(2*cos(time)+x,2*sin(time)+y);
    point(i+time+x, i+time+y);
    strokeWeight(3);
    //line(2*cos(time),2*sin(time),i+time, i+time);
    //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }}
  
}}



