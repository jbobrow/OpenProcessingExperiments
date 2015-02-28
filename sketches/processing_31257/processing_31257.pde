
class Shoe {
  int xPos;
  int yPos;
  int wid;
  int hei;
  color col;
  int y;
  int x;
  int speed = 20;

  Shoe(int x, int y, int w, int h, color c, int spd) {
    xPos = x;
    yPos = y;
    wid = w;
    hei = h;
    col = c;
    speed = spd;
  }

  void display() {
    fill(col);
    rect (xPos, y, wid, hei);
  }


  void drive() {

    y = y+speed;


    if (y>490) {
      speed = -speed;
    }
    if (y<0) {
      speed = -speed;
    }
  }
}

class Bank{

  int xPos;
  int yPos;
  int wid;
  int hei;
  color col;
  int y;
  int x;
  int speed = 20;

  Bank(int x, int y, int w, int h, color c, int spd) {
    xPos = x;
    yPos = y;
    wid = w;
    hei = h;
    col = c;
    speed = spd;
  }

  void display() {
    fill(col);
    rect (x, yPos, wid, hei);
  }


  void drive() {

    x = x+speed;


    if (x>490) {
      speed = -speed;
    }
    if (x<0) {
      speed = -speed;
    }
  }
}


 Shoe hers = new Shoe(5, 10, 30, 20, color(67,30,100), 15);
 
 Shoe mine =  new Shoe(260, 100, 50, 50, color(0), 10);

 Bank yum = new Bank(20, 10, 30, 20, color(67,30,100), 5);
 
 Bank yam =  new Bank(12, 100, 50, 50, color(0), 40);



void setup(){
  size(500, 500);
  background(random(255), random(255), random(255));
  frameRate(60);

}
void draw(){
background(0, 0 , 255);
  mine.drive();
  mine.display();
  
   hers.drive();
 hers.display();
 yum.drive();
  yum.display();
  
   yam.drive();
 yam.display();
}
