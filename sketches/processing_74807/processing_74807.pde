
Tri myTri1;
Tri myTri2;
boolean stop=false;

void setup(){
  size(300,300);
  smooth();
  myTri1 = new Tri(color(#ff0000,100), width*4/3, height/3, -1, 0.01);
  myTri2 = new Tri(color(#00ffff,100), -width*2.0/3.0, height/3.0, 1, -0.01);

}

void draw(){
    background(255);
  myTri1.display();
  myTri1.move();
  myTri1.circle();
  myTri2.display();
  myTri2.move();
  myTri2.circle();
  

}
class Tri {
  color c;
  float x;
  float y;
  float speed;
  float rollSpeed;
  
  Tri(color tempC, float tempX, float tempY, float tempspeed,  float temprollSpeed){
    c=tempC;
    x=tempX;
    y=tempY;
    speed=tempspeed;
    rollSpeed=temprollSpeed;
  }
  
  void display(){
    noStroke();
    fill(c);
    triangle( x+width/6, y+height/3, x, y, x+width/3, y );
  }
    
  void move(){
    x=x+speed;
  if(x>=width/3 && x<=width/3){
     speed=0;
     stop=true;
    }
     
   }
   
 void circle(){
   if(stop){
  float ellipsex;
  float ellipsey;
  int radius=height/3;
  float angle=0;
  
  ellipsex=radius*sin(angle)+width/2;
  ellipsey=radius*cos(angle)+height/2;
  fill(0);
  ellipse(ellipsex,ellipsey,10,10);
  angle = angle+rollSpeed;
   }
 }

}



