
Ball ballSu; // Ball (class/data type), ballSu(variable name)

void setup() {
  size(640, 480);
  ballSu = new Ball();
}
void draw() {
  ballSu.bg();
  ballSu.display();
  ballSu.move();
}

class Ball{ // class name
  int x;
  int speed;
  int dir;     // field (data)
  
Ball(){
    x =0;
    speed =5;
    dir= 1;   // constructor
  }

void display(){  //Method#1(Actual Functions)
    ellipse (x, 100, 50, 50);
  }
  
void move(){//Method#1(Actual Functions)
  if (x >width || x<0 ) { // || : or, && : and
    dir = dir * -1;
  }
     x = x+speed*dir;   
}

void bg(){  //Method#1(Actual Functions)
  background(0);
}
  }
