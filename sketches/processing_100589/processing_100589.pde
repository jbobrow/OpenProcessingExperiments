
MovingBox box1;
MovingBox box2;
MovingBox box3;

void setup(){
  size(500,500);
  background(#F581EF);
  smooth();
  
  box1=new MovingBox(width *0.44, height/2,55);
  fill(#D1EA1A);
  
  box2=new MovingBox(width *0.75, height/2,80);
  box3=new MovingBox(width *0.25, height/2,35);
  
}

void draw(){
  box1.move();
  box1.display();
  box2.move();
  box2.display();
  box3.move();
  box3.display();
}
class MovingBox{
  
  float x;
  float y;
  int diameter;
  float speed=2.5;

   MovingBox(float tempX, float tempY, int tempDiameter){
    x=tempX;
    y=tempY;
    diameter=tempDiameter;
  }
  void move(){
    x+=random(-speed, speed);
    y+=random(-speed, speed);
  }
  void display(){
    rect(x,y,diameter, diameter);
  }
}
