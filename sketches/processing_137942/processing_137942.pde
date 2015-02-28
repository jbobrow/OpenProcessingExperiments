
Circles _1;
Circles _2;
Circles _3;
Circles _4;
Circles _5;
Circles _6;

void setup (){
  frameRate(20);
  size(400, 400);
  smooth();
  noStroke();
  //int _x, int _y, int _size, int _C, int _speed
  _1 = new Circles(50, 0, 50, 57, 2);
  _2 = new Circles(100, 0, 120, 160, 3);
  _3 = new Circles(86, 0, 150, 80,2.6);
  _4 = new Circles(52, 0, 70, 2, 1.3);
  _5 = new Circles(20, 0, 40, 230,3.2);
  _6 = new Circles(41, 0, 100, 200, 1.8);
}


void draw (){
  background (160);
  _1.display();
  _2.display();
  _3.display();
  _4.display();
  _5.display();
  _6.display();
  _1.move();
  _2.move();
  _3.move();
  _4.move();
  _5.move();
  _6.move();  
}


class Circles{
  
  //global variables
 float x, y, size, C, speed;
  

  //Constructor
  Circles(float _x, float _y, float _size, float _C, float _speed ){
    x = _x;
    y = _y;
 size = _size;
    C = _C;
speed = _speed;
  }
  //Functions
  void display(){
    fill(C, 50);
    ellipse(random(200), y, size, size);
   ellipse(x+random(100,300), y, size, size);
   ellipse(x+random(200,400), y, size, size);
   ellipse(x+random(300,400), y, size, size);
  }
 
 void move(){
  y = y + speed;
   if (y > height){
     y = 0;
   }
 }
}
