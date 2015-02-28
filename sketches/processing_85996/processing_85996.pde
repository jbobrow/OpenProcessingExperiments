
//////////////// Project_ DANCING COMET INTERFACE \\\\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\








float SIZE;
Comet [] CometCollection = new Comet[600];
Comet [] CometCollection1 = new Comet[400];

void setup() {

  size(600,600);
  smooth();
  noStroke();
  noFill();
  for(int i = 0; i <CometCollection.length; i++) {
    CometCollection[i] = new Comet(random(0,width),random(0,height));
  }
  for(int j = 0; j <CometCollection1.length; j++) {
    CometCollection1[j] = new Comet(j*1,j*1);
  }

 
}


void draw() {

  fill(3,15);
  rect(0,0,width,height); 


  for(int i =0;i<CometCollection.length;i++) {
    CometCollection[i].run();
    fill(255,255,0);
  }
  for(int j = 0; j <CometCollection1.length; j++) {
    CometCollection1[j].run();
    fill(255,250,0);
  }
}


class Comet {

  float x;
  float y;

  float speedX = 3;
  float speedY = 2;

  Comet(float _x,float _y) {

    x =  _x;
    y = _y;
  }


  void run() {

    display();
    move();
    gravity();
  }



  void display() {

    ellipse(x,y,random(10,30),random(10,30));
  }

  void move() {
    x +=speedX;
    y +=speedY;
    if(x>width) {
      speedX = speedX*-1;
    }
    if(x<0) {
      speedX = speedX*-1;
    }
    if(y>width) {
      speedY = speedY*-1;
    }
    if(y<0) {
      speedY = speedY*-1;
    }
  }
  void gravity() {
    speedY +=.1;
  }
}


//////////////// Project_ DANCING COMET INTERFACE \\\\\\\\\\\\\\\\\\\\\\\\
///////////////////////// YOUSUFOLIO/PROCESSING/2013\\\\\\\\\\\\\\\\\\\\\\
////////////////////////////////// ENJOY\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

