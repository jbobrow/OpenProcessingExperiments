

Point center;
int diameter=50;
float speed=20.0;
Point direction;

void setup(){
 size(640,480);
 background(0);
 stroke(255);
 frameRate(25);
 direction=new Point(1,1);
 center=new Point(50,100);
}


void draw(){
  background(0);
  drawCircle();
  
}

void drawCircle(){
  int x,y;
  //setNewCenter(center,speed)
  center=setNewCenter(center,diameter,speed,direction);
  ellipse(center.getX(),center.getY(),diameter,diameter); 
}



Point setNewCenter(Point center, int diameter, float speed, Point direction){
  boolean move=true;

  float speedX=speed*direction.getX();
  float speedY=speed*direction.getY();
  float x,y, radius;
  radius=diameter/2;
  float dirX=direction.getX();
  float dirY=direction.getY();
  x=center.getX()+speedX;
  y=center.getY()+speedY;
  if (direction.getX()==1){
    if (x>width){
      x=width-radius;
      dirX=dirX*-1;
    }
  }else if (dirX==-1){
    if (x<0){
      x=radius;
      dirX=dirX*-1;
    }
  }
  if (dirY==1){
    if (y>height){
      y=height-diameter;
      dirY=dirY*-1;
    }
  }else if (dirY==-1){
    if (y<0){
      y=radius;
      dirY=dirY*-1;
    } 
  }
  direction.setX(dirX);
  direction.setY(dirY);
  return new Point(x,y);
 
}

/*
Point setNewCenter(Point center,float speed){
  float x,y;
  int dirX=direction.getX();
  int dirY=direction.getY();
  float speedX=speed*dirX;
  float speedY=speed*dirY;
  
  Point newCenter;
  if (canMove(center, diameter, speed, direction){
    x=center.getX()+speedX;
    y=center.getY()+speedY;
    newCenter=new Point(x,y);
  }else{
    if (dirX==1){
      
  }
}*/


public class Point {
  private float x;
  private float y;
  
  public Point(float x, float y) {
    super();
    this.x = x;
    this.y = y;
  }
  

  public float getX() {
    return x;
  }
  public void setX(float x) {
    this.x = x;
  }
  public float getY() {
    return y;
  }
  public void setY(float y) {
    this.y = y;
  }
}



