
//* To view the original sketch visit: http://www.openprocessing.org/sketch/58411

//Mariana Moreno- Gonzalez
//April 3, 2012
//Math, Programming & Art:
//Nick Lally
//WK 13 HW: Texture (with Arrays)

PImage img; 
 
Circle[] circles;
float angle;
int directionx;
int directiony;
int trailNum = 10;
float[] prevx;
float[] prevy;
 
 
void setup (){
  frameRate (8);
  angle = 0;
  smooth ();
  noFill();
  stroke (255);
  strokeWeight (.25);
  size (600,600);
  img = loadImage ("birch.jpg");
  background (0);
  circles= new Circle [50];
  for (int i = 0; i < circles.length; i++){
    circles [i] = new Circle (random (300), 0);
  }
  directionx=1;
  directiony=1;
  prevx = new float [trailNum];
  prevy= new float [trailNum];
}
 
void draw (){
  fill (random(100), 5);
  image (img, 0, 0); 
  tint (255, 255, 255, 20);
  rect (0,0,width,height);
  for (int i = 0; i < circles.length; i++){
    circles[i].move();
    circles[i].display();
  }
}
 
class Circle{
  float x,y;
  Circle (float _x, float _y){
    x= _x;
    y= _y;
  }
  void move (){
    x += directionx;
    y += directiony;
    if(y > 400){
      directiony=-1;
    }
    if(x > 900){
      directionx=-1;
    }
    if(y < 700){
      directiony=1;
    }
    if(x < 0){
      directionx=1;
    }
    if (angle > width){
      angle = 0;
    }
    x= cos (radians (angle)) * 200 + random (600);
    y= sin (radians (angle)) * 200 + height/2;
  }
  void display (){
    for ( int i = 1; i < trailNum; i++){
      prevx [i-1] = prevx [i];
      prevy [i-1] = prevy [i];
    }
    prevx [trailNum-1] = x;
    prevy [trailNum-1] = y;
    for (int i = 0; i < trailNum; i++){
      ellipse (prevx[i], angle, trailNum-i, trailNum-i);
 
    }
    angle++;
  }
 
}


