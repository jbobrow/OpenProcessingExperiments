
PImage notStar;

int w=5;
int h=5;
int count=1;
int x=10;
int Msize=15;


star[] stars= new star[80];
color[] starColor = new color[1000];



void setup() {
  notStar=loadImage("star.png");
  size(700, 700);
  background(0);
  smooth();

  noCursor();

  for (int i = 0; i < 80; i++) {
    stars[i] =new star(random(width), random(height));
    starColor[i] = color((int)random(100, 255));
  }

  // mouseThings();
  //stars();
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  //background(0);
  float o=random(210, 220);


  fill(247, 227, 2, o);

  //for each star in the array stars
  for (star working: stars) {
    working.runAwayfrom(mouseX, mouseY);
    working.drawStar();
  }
  fill(255);
  ellipse(mouseX, mouseY, Msize, Msize);
}




void mouseMoved() {
}
//-------------------------------------------//
class star {
  //the position
  float xPos;
  float yPos;

  //the size
  float wd= 15;

  //how much the positions change by each step
  float xStep = random(-2, 2);
  float yStep = random(-2, 2);

  // if(xStep=0 ){
  // xStep=1;
  //}
  //CHANGE X AND Y STEP TO NEVER BE 0

  float dx, dy;
  float xspd, yspd;
  boolean following=false;
  //constructor
  star(float x, float y) {
    xPos = x;
    yPos = y;
  }

  void drawStar() {
    image(notStar, xPos, yPos, wd, wd);
    xPos = xPos + xStep;
    yPos = yPos + yStep;
    //reverse
    if (xPos<0||xPos>700) {
      xStep=xStep*-1;
    }
    if (yPos<0||yPos>700) {
      yStep=yStep*-1;
    }
  }

  void runAwayfrom(float xp, float yp) 
  {
    if (dist(this.xPos, this.yPos, xp, yp) < 100) {
      following = true;
      dx = this.xPos - xp;
      dy = this.yPos - yp;
    }

    if (following) {

      this.xPos -= dx/10;
      this.yPos -= dy/10;

      if (this.xPos > 700 ) {
        following = false;
      }
      if (this.xPos<0) {
        following = false;
      }
      if (this.yPos>699) {
        following=false;
      }
      if(this.yPos<0){
       following=false; 
      }
    
      if (following=true){
        Msize=Msize+1;
      }
      
      else if(following=false){
       Msize=Msize-1;
      
      }
      
      if(Msize>40){
       Msize=40; 
      }
    }
  
}}



