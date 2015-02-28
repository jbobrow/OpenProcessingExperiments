
Circle[] circles;
 
void setup(){
  size(600,600);
  smooth();
  circles=new Circle[10000];
  for(int i = 0; i < 1000; i++){
    fill(0);
    stroke(255);
    circles[i]=new Circle(random(1,600),random(20,600),random(2,20));
  }
}
 
void draw(){
 for(int i = 0; i < 1000; i++){
    circles[i].display();
    circles[i].move();
  }
}
 
class Circle {
  float x,y,diameter, vy, vx, gravity, friction;
   
 //constructor
  Circle(float xpos, float ypos, float dia){
    x=xpos;
    y=ypos;
    diameter=dia;
    friction=random(-5,-1);
    gravity=random(0.9,1);
 
  }
   
  void display(){
    ellipse (x,y,diameter, diameter);
  }
   
  void move(){
    vy+=gravity;
    x+=vx;
    y+=vy;
    if (y > height){
      y=height;
      vy*=friction;
    }
    if (x>width){
      x=width;
      vx*=friction;
    }
  }
}
 



