
class Ice_cream{
  int speed=5;
  int xPos;
  int yPos;
  int wid;
  int hei;
  PImage icec;
  
  Ice_cream(PImage ice-cream-cone,int speed,int xPos,int yPos,int wid,int hei){
    xPos = x;
    yPos = y;
    wid = w;
    hei = h;
    speed = spd;
    icec = loadImage("ice-cream-cone.jpg");
  }
  void display(){
    image(icec,spd,5,10,10,10)
  }
