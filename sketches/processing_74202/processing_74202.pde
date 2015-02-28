
Ball ball1;
Ball ball2;
Ball ball3;

void setup() {
  size(640, 480);
  ball1 = new Ball(50, 100, 50, 10, color(255,30,10));
  ball2 = new Ball(0, 200, 70, 5,color(5,240,70));
   ball3 = new Ball(100, 300, 30, 2, color(50,40,170));
}

void draw() {
 ball1.bg(); 
 ball1.display();
 ball1.movement();
 
 ball2.display();
 ball2.movement();
 
 ball3.display();
 ball3.movement();
}


  class Ball { // class name
    int x;
    int y;
    int d;
    int speed;
    int dir; 
    color co;
   
    // field (DATA)

    Ball (int xPosition, int yPosition, int dia, int s, color c) {  
      x =xPosition;
      y =yPosition;
      d= dia;
      speed =s;
      co = c;
      dir =1;  // Constructor (assign value)
    }

    void display() {
     fill(co);
      ellipse(x, y, d, d);
    }

    void movement() {
      if (x >width || x < 0 ) { // || : or, && : and
        dir = dir * -1;
      }
      x = x + speed * dir;
    }
    void bg(){
      background(0);
    }
  }
