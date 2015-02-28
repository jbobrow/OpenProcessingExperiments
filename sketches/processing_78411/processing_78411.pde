
//Devon Kelley HW#7
//may cause seizure

Circle[] circles;
float x,y,angle;

void setup(){
  background(255,0,0);
  size(1000,600);
   circles = new Circle[100];
   for(int i=0; i< circles.length; i++){
    circles[i]=new Circle(random(width),random(height),random(-5,5),random(-5,5));
  }
  x=0;
  y=0;
  angle=0;
}

void draw(){
  for(int i=0; i< circles.length;i++){
    circles[i].move();
    circles[i].displayC();
  }
}


class Circle{
  float x,y,speedX,speedY;
 Circle(float _x,float _y,float x, float y){
   x=_x;
   y=_y;
   speedX=1;
   speedY=1;
 }
 void move(){
   x+=speedX;
   y+=speedY;
 }
 void displayC(){
    fill(0,252,31);
 ellipse(x,y,200,200);
 fill(105,135,255);
 ellipse(x+y,y+x,100,100);
 fill(180,0,255);
 rect(x*y,y*x,200,200);
 fill(20,200,10);
 ellipse(x++,y,100,100);
  x=200*cos(radians(angle));
   y=200*sin(radians(angle));
  fill(90,80,175);
  ellipse(x+width/2,y+height/2,x+width/2,y+height/2);
  angle++;
 }
}

