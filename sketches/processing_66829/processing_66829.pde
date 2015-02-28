
//olympic animation by McLean Pierce August 7, 2012

//instantiates the 5 olympic ring objects from the class Ring
Ring r1,r2,r3,r4,r5;


void setup() {
  size(540,400);
  strokeWeight(10);
  colorMode(HSB,360,100,100);
  frameRate(30);

  // Ring(x position, y position, radius of rotation, speed, H,S,B)
  r1 = new Ring(140.0, 200.0, 50.0, 2, 223,81,99);
  r2 = new Ring(260.0, 200.0, 50.0, -6, 223,100,0);
  r3 = new Ring(380.0, 200.0, 50.0, 4, 355,81,99);
  r4 = new Ring(200.0, 255.0, 50.0, -4, 55,81,99);
  r5 = new Ring(320.0, 255.0, 50.0, -2, 120,79,79);
}


void draw() {
  background(255);
  smooth();
  noStroke();
  fill(360);
  rect(0,0,width,height);
  noFill();

  //updates the ring objects for each cycle of animation

  r1.run();
  r2.run();
  r3.run();
  r4.run();
  r5.run();
}

class Ring {
  //CLASS GLOBAL VARS
  float x,y,posx,posy,rad,speed; // x,y location
  int h,s,b,m;
  float angle=0.0;
  boolean pause=false;
  float inity;


  //CONSTRUCTOR
  Ring (float _x, float _y, float _rad, float _speed,int _h, int _s, int _b) {

    x=_x;
    y=_y;
    inity=_y;
    rad=_rad;
    speed=_speed;
    h=_h;
    s=_s;
    b=_b;
    angle=0.0;

    // angle += speed; // Update the angle 
    // float sinval = sin(angle); 
    // float cosval = cos(angle);
    // Set position of the small circle based on new values from sine and cosine
    // float x = 50 + (cosval * radius); 
    // float y = 50 + (sinval * radius); 
    noFill();
  }

  //FUNCTIONS  
  void run() {
    display();
    move();
    bounce();
  }


  void bounce() {
    if(y > height-55) {
      speed = speed*-1;
    }
    if(y < 55) {
      speed = speed*-1;
    }
  }

  void move() {
    if (pause==false) {
      y=y+speed;


      if (y==inity) {
        pause=true;
        y=y+speed;
        m=millis();
      }
    }
    else {
      if (millis() > m + 6000) {

        pause=false;
      }
    }
  }


  void display() {
    stroke(h,s,b,225);
    ellipse(x,y,100,100);
  }
}


