

int NUM_BALLS = 50;

Ball [] myBalls = new Ball[NUM_BALLS];

Ball myBall;
Ball myBall2;
 
void setup() {
  size(600, 400);  
 
frameRate(50);
smooth();  
//noStroke();
  for (int i=0; i<NUM_BALLS; i++) {
    myBalls [i] = new Ball();
    myBalls [i].posX = random (-100, width+100);
    myBalls [i].posY= random (0, height);
    myBalls [i].speedY =random (1, 3);
    myBalls [i].angle = random (radians(1), radians(100));
    myBalls [i].myDiameter = random(2,15);
    myBalls [i].a = random(100, 200);
  }    
}
 
void draw() {
  
   background(185);
   for (int i=0; i<NUM_BALLS; i++) {
    myBalls[i].update();
  }
}

class Ball {
  float myDiameter = 10;
  float posX = 250;
  float posY = 250;
  float speedX=.5;
  float r = 255;
  float g = 255;
  float b =250;
  float a = 100;
  float speedY =5;
  float angle = 0;

  void update() {

    posY+=speedY;

    if (posY>height)
      posY=0;

    angle+= 0.01;
    posX += cos(angle)*speedX;

    fill(r, g, b, a);
    ellipse (posX, posY, myDiameter, myDiameter);
  

  // bal ful
  fill(0);
  ellipse(232,200,12,30);
  
  // jobb ful
  fill(0);
  ellipse(282,200,12,30);
  
  // bal lab
  fill(0);
  bezier(212,311,173,320,    212,380,213,311);
    
  // jobb lab
  fill(0);
  bezier(292,311,343,320,    282,380,293,311);
  
  // test
  fill(255);
  bezier(184,255,150,375,    350,375,326,255);
  bezier(184,255,229,163,    286,163,326,255);
  
  
  // bal kar
  fill(0);
  bezier(199,280,166,262,    257,233,199,280);

  
   // jobb kar 
  fill(0);
  bezier(319,280,286,262,    377,233,319,280);

  // bal szem
  fill(0);
  bezier(259,196,177,195,    231,288,259,196);

  // jobb szem
  bezier(259,196,332,195,    301,288,259,196);  
  
  // szemgolyok
  
  // bal
  fill(255);
  ellipse(246,205,17,17);  
  fill(0);
  ellipse(246,203,12,12);  
  
  // jobb
  fill(255);
  ellipse(272,205,17,17);
  fill(0);
  ellipse(272,203,12,12);
  
  // orra
  fill(0);
  ellipse(259,220,10,10);
  ellipse(259,225,5,5);  

  
  //P1,C1,   C2,P2
  fill(255);
  rect(0,345,600,400);
  

  }

}


