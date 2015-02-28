
/*
UNIVERSIDAD VERITAS
MAESTRIA EN DISENO DE INTERACCION
AUTHOR: RAFAEL SALCEDO
*/

Ball ball1;
Ball ball2;
Ball ball3;
float x;
float y;
float angle = 0.0; // Direction of motion  
float speed = 2.4; // Speed of motion

void setup() {
 
 size(500, 500);
 background(255);
 smooth();
 frameRate(25);
 
 ball1 = new Ball(200,200,150,speed,angle);
 ball2 = new Ball(200,200,175,5,angle);
 ball3 = new Ball(300,300,175,5,angle);
}

void draw() {

 background(255);
 ball1.move();
 ball2.move();
 ball3.move();
 
 if (ball1.nearAnotherBall(ball2)) {
   ball1.highlight();
   ball2.highlight();
 
 }
 
 if (ball2.nearAnotherBall(ball3)) {
   ball2.highlight();
   ball3.highlight();
 
 }

 ball1.display();
 ball2.display();
 ball3.display();
 
}

class Ball {
 
 float x,y;
 float diameter;
 float speed;
 float angle;
 color c = color(0);
 Ball nearBall;
 
 
 
 Ball(float xpos, float ypos, float dia, float sp, float dir) {
   
   x = xpos;
   y = ypos;
   diameter = dia;
   speed = sp;
   angle = dir;
 }

 void move() {
  angle += random(-0.13, 0.13);
  x += cos(angle) * speed;
  y += sin(angle) * speed;
 
    if(x >= width+diameter/2) {
   x = 0.0;
     }  

     if(y >= height+diameter/2) {
   y = 0.0;  
     }
     
     if(x <= 0.0-diameter/2) {
  x = width + diameter;
     }  
     
     if(y <= 0.0-diameter/2) {
  y = height;
     }
 }
 
 void highlight() {
   c = color(255,0,0);
   if (nearBall != null) {
     stroke(#FF0000);
     line(x, y, nearBall.x, nearBall.y);
   }
 }
 

 void display() {
   stroke(c);
   noFill();
   ellipse(x,y,diameter,diameter);
   c = color(0);
 }
 
  boolean nearAnotherBall(Ball b) {
    boolean near = dist(x,y,b.x,b.y) <= diameter;
    if (near) {
  nearBall = b;
    } else {
  nearBall = null;
    }
    return near;
 }
} 
