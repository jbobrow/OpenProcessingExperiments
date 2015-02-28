

float time;
float cycle_sin = 0;
float speed;
random_dot r;

void setup() {
size(720,480);
frameRate(30);
r = new random_dot();
}

void draw() {/* this does the drawing once per frame */
  background(0); /* clear the screen with white */ 
  translate(width*0.5, height*0.5); /* translate all the drawing to the middle of the screen */
  noFill(); /*stop the computer filling in shapes*/
  time = time + 0.01; 
  speed = speed + 0.01;
  cycle_sin = sin(cycle_sin) + 0.1;
  
  //draw random point
  r.draw(50);
  
  
  for(int u=0; u < 100 ; u++){
  u = u + 1;
  //graphic1
  for(int i= u; i < 10 ; i++){
  color a = color(map(cycle_sin, 0, 70, 0, 255)*i, map(cycle_sin, 0, 70, 0, 255)*i*2, map(cycle_sin, 0, 70, 0, 255)*i*3);
  translate(time, time);
  rotate(-time);
  strokeWeight(5);
  stroke(a, 100);
  
  point(1/2*cos(time),1/2*sin(time));
  point(i+time, i+time);

  strokeWeight(3);
  //line(1/2*cos(time),1/2*sin(time),i+time, i+time);
  //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }
  
  //graphic2
  for(int i= u; i < 20 ; i++){
  color b = color(map(cycle_sin, 0, 30, 0, 255)*i, map(cycle_sin, 0, 30, 0, 255)*i*2, map(cycle_sin, 0, 30, 0, 255)*i*3);
  translate(cos(time), cos(time));
  rotate(time);
  strokeWeight(5);
  stroke(b, 70);
  point(2*cos(time),2*sin(time));
  point(i+time, i+time);
  strokeWeight(3);
  //line(2*cos(time),2*sin(time),i+time, i+time);
  //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }
  
  //graphic3
  for(int i= u ; i < 20 ; i++){
  color c = color(map(cycle_sin, 0, 10, 0, 255)*i, map(cycle_sin, 0, 10, 0, 255)*i*2, map(cycle_sin, 0, 10, 0, 255)*i*3);
  translate(sin(time), sin(time));
  rotate(-time);
  strokeWeight(5);
  stroke(c, 50);
  point(2*cos(time),2*sin(time));
  point(i+time, i+time);
  strokeWeight(3);
  //line(2*cos(time),2*sin(time),i+time, i+time);
  //bezier(1/2*cos(time),1/2*sin(time),i+time, i+time, 1/2*cos(time)+i,1/2*sin(time)+i,i+time, i+time);
  }
  }
}

class random_dot{

float posX=15;
float posY=15;
float time;
int number;

void draw(int n){
  number = n;
  time = time + 0.01;
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



