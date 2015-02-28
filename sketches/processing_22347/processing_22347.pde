
Thing thing1;
Thing thing2;
Thing thing3;

float x= 100;  //x location
float y=0; // y location

float speed = 0;
float gravity = 2;


void setup () {
  size (400, 400);
  thing1 = new Thing (100, 100, 15,50);
  thing3 = new Thing (150, 200, 30, 40);
  thing2 = new Thing (200, 100, 40, 30);
}
void draw () {
  rectMode(CENTER);
  background (50,0,60);
  fill (60,20,random(80,100));
  rect (width/2,height/2,400,400);
  thing1.move();
  thing2.move();
   thing3.move();
}
//name the class
class Thing {
  //date (variables)
  float xpos;
  float ypos;
  float radius;
  float speed;
  //constructor
  Thing (float tempX, float tempY, float tempRadius, float tempSpeed) {
    xpos = tempX;
    ypos = tempY;
    radius = tempRadius;
    speed = tempSpeed;
  }
  //methods and functions
  void move () {
    ypos =ypos+speed;
    if ((ypos > height) || (ypos<0)) {
      speed *= -1;
    }
    noStroke();
    fill (255, 0, 120,random(80));
    ellipse (xpos, ypos, radius, radius);
    
    y = y +speed; //add speed to y location
speed = speed + gravity; // add gravity to speed
//if square reaches bottom, reverse speed

}
  }



