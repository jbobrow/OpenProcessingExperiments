

//DECLARE (incorporare array?)
Ball myBall1;
Ball myBall2;
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball myBall6;

Ball myBall7;
Ball myBall8;
Ball myBall9;
Ball myBall10;
Ball myBall11;
Ball myBall12;

float r1;
float r2;
float r3;
float r4;
float r5;
float r6;
float r7;

void setup() {
  size(600, 600);  
  smooth();

  r1 = random(0, 500);
  r2 = random(0, 500);
  r3 = random(0, 500);
  r4 = random(0, 500);
  r5 = random(0, 500);
  r6 = random(0, 500);
  r7 = random(0, 500);

  myBall1= new Ball(r1, r2); // INITIALISE to move
  myBall2= new Ball(r2, r3); 
  myBall3= new Ball(r3, r4); 
  myBall4= new Ball(r4, r5); 
  myBall5= new Ball(r5, r6);
  myBall6= new Ball(r6, r7);

  myBall7= new Ball(r1, r2); // INITIALISE to stay
  myBall8= new Ball(r2, r3); 
  myBall9= new Ball(r3, r4); 
  myBall10= new Ball(r4, r5); 
  myBall11= new Ball(r5, r6);
  myBall12= new Ball(r6, r7);
}
void draw() {
  background (#AD3D3D);
  noStroke();

  myBall1.run(); //CALL FUNCTIONALITY
  myBall2.run(); 
  myBall3.run();  
  myBall4.run(); 
  myBall5.run(); 
  myBall6.run();

  myBall7.stay(); //mark initial position with an empty ball 
  myBall8.stay(); 
  myBall9.stay();  
  myBall10.stay(); 
  myBall11.stay(); 
  myBall12.stay();
}


// myBall1.stay();


class Ball { 

  //GLOBAL VARIABLES (Location, Speed etc..)

  float x = 0;
  float y = 0;
  float speedX = 5;
  float speedY = 0.5;

  //CONSTRUCTOR (How do you build the class, what info do you need, operates just once)

  Ball(float _x, float _y) {

    x = _x; 
    y = _y;
  }

  //FUNCTIONS (Modularity) 

  void run() {
    display(); 
    move();
    bounce();
    vector();
  }

  void bounce() {

    if (x > width) {
      speedX = - speedX; //remember: could also be speedX = speedX * -1
    }
    if (x < 20) {
      speedX = - speedX;
    }
    if (y > (height-20)) {
      speedY = - speedY;
    }
    if (y < 20) {
      speedY = - speedY;
    }
  }

  void vector() {
    speedY += 0.2;  //force point down or up depending on the sign
  }


  void move() {

    x += speedX;
    y += speedY;
  }

  void display() {

    ellipse(x, y, 50, 50);
    fill(0);
  }


  void stay() { 

    ellipse(x, y, 20, 20);
    stroke(0);
    noFill();
  }
}



