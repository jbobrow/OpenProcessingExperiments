
Wall myWall1;
Wall myWall2;
Wall myWall3;
Wall myWall4;
Wall myWall5;
Wall myWall6;
Wall myWall7;
Wall myWall8;
Wall myWall9;
Wall myWall10;
Wall myWall11;
Wall myWall12;
Wall myWall13;
Wall myWall14;
Wall myWall15;



void setup() {
  noStroke();
  size(1000, 100);
  myWall1 = new Wall(color(0,40,255,60), 50, 50, 2.25);
  myWall2 = new Wall(color(0,40,255,40), 40, 40, 1);
  myWall3 = new Wall(color(0,40,255,50), 30, 30, 2);
  myWall4 = new Wall(color(0,30,255,40), 60, 60, 1.5);
  myWall5 = new Wall(color(0,30,255,30), 80, 80, 1);
  myWall6 = new Wall(color(0,30,255,60), 10, 10, 1.75);
  myWall7 = new Wall(color(0,30,255,40), 20, 20, 2.1);
  myWall8 = new Wall(color(0,40,255,60), 0, 0, 2.25);
  myWall9 = new Wall(color(0,40,255,40), 45, 45, 2);
  myWall10 = new Wall(color(0,40,255,50), 35, 35, 1);
  myWall11 = new Wall(color(0,30,255,50), 70, 70, 2.25);
  myWall12 = new Wall(color(0,30,255,30), 75, 75, 2);
  myWall13 = new Wall(color(0,30,255,60), 15, 15, .75);
  myWall14 = new Wall(color(0,30,255,40), 90, 90, 1.1);
  myWall15 = new Wall(color(0,30,255,30), 95, 95, 2.1);
}
void draw() {
  background(255);
  myWall1.move();
  myWall1.display();
  myWall2.move();
  myWall2.display();
   myWall3.move();
  myWall3.display();
   myWall4.move();
  myWall4.display();
   myWall5.move();
  myWall5.display();
   myWall6.move();
  myWall6.display();
   myWall7.move();
  myWall7.display();
  myWall8.move();
  myWall8.display();
  myWall9.move();
  myWall9.display();
   myWall10.move();
  myWall10.display();
   myWall11.move();
  myWall11.display();
   myWall12.move();
  myWall12.display();
   myWall13.move();
  myWall13.display();
   myWall14.move();
  myWall14.display();
  myWall15.move();
  myWall15.display();
}
class Wall{
  color c;
  float ysize;
  float ypos;
  float xspeed;
  float xpos;
 
Wall(color tempC,float locx, float locY, float tempXspeed){
c = tempC;
xpos=locx;
ypos = locY;
xspeed = tempXspeed;
}
 
void display(){
  rectMode(CENTER);
  fill(c);
  rect(ypos,xpos,500,10);
}
 
void move(){
  ypos= ypos+ xspeed;
  if(ypos>width){
    ypos=0;
  }
}
}

