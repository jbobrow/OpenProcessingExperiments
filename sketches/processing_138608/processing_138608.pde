
Circles _1;
Circles _2;
Circles _3;
Circles _4;
Circles _5;
Circles _6;

void setup (){
  frameRate(20);
  size(600, 400);
  smooth();
  
  //int _x, int _y, int _size, int _C, int _speed
  _1 = new Circles(50, 0, 50, 57, random(5,10));
  _2 = new Circles(150, 0, 50, 160,random(5,10));
  _3 = new Circles(250, 0, 50, 80, random(5,10));
  _4 = new Circles(350, 0, 50, 2, random(5,10));
  _5 = new Circles(450, 0, 50, 230,random(5,10));
  _6 = new Circles(550, 0, 50, 200, random(5,10));

 
}
void draw (){
   noStroke();
  background(250);
    stroke(0);
   strokeWeight(4);
   line(100,0,100,400);
   line(200,0,200,400);
   line(300,0,300,400);
   line(400,0,400,400);
   line(500,0,500,400);
   line(600,0,600,400);
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
 float x, y, size, C, speed ;
  

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
 
    
    //for(i = 0, i< 400, i++){
    fill(C);
    ellipse(x, y, size, size);
   /*ellipse(x+random(100,300), y, size, size);
   ellipse(x+random(200,400), y, size, size);
   ellipse(x+random(300,400), y, size, size);*/
 //size
// }
   
}
 
 void move(){
  y = y + speed;
   if (keyPressed){
     setup();
   }
 }
}

