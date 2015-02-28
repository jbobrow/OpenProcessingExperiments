
// Objects
// are a beautiful thing

MovingSpace big;
MovingSpace medium;
MovingSpace small;

void setup() {
  size(600,600);
  smooth();
  
  big = new MovingSpace(5.0, width/2, 150, 0.03);
  medium = new MovingSpace(0.0, width/3, 300, 0.009);
  small = new MovingSpace(0.0, width, 100, 0.06);
}

void draw() {
  
  background(0);
  
  big.move();
  big.display();
  
  medium.move();
  medium.display();
  
  small.move();
  small.display();
}

class MovingSpace {
  
   float angle;
   float offset;
   float scalar;
   float speed;
   float x;
   float y;
   
   MovingSpace(float _angle, float _offset, float _scalar, float _speed) {
     offset = _offset;
     scalar = _scalar;
     speed = _speed;
     x = offset;
     y = offset;
     angle = _angle;
   }
   
   void move() {
     x = offset + cos(angle) * scalar;
     y = offset + sin(angle) * scalar;
     angle += speed;
   }
   
   void display() {
     float a = mouseX;
     float b = mouseY;
     
     for (int i = 0; i <= 200; i += 10) {
       noFill();
       stroke(x,y,x/y);
       ellipse(x-i,y-i,a-i,b-i);
       stroke(y,x,y/x);
       line(width/2,height/2,x-i,y-i);
     }
   }
}


