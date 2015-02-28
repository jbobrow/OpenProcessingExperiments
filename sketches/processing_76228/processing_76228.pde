
PImage notStar;
float a = 0;
int w=5;
int h=5;
int count=1;
int x=10;
int holdSize=8;
int Msize=15;
int starCount=0;

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
  for (star working: stars) {
   working.runAwayfrom(mouseX, mouseY);
    working.drawStar();
        }
        
  //for each star in the array stars
  for (star working: stars) {
    if (dist(mouseX, mouseY, working.xPos, working.yPos)<150) {
      this.starCount=starCount+1;
        }
  }
    Msize=Msize+starCount;
    
   if(starCount >= 10)
   {
      stroke(247,228,45,random(a));
    strokeWeight(random(1,30));
   }
   else{
    noStroke(); 
   }
   fill(255);
   ellipse(mouseX,mouseY,Msize-15,Msize-15);
    fill(255,random(80,90));
    ellipse(mouseX, mouseY, Msize-10, Msize-10);
    fill(250,228,103,random(a));
    ellipse(mouseX, mouseY, Msize, Msize);
    

    Msize=holdSize;
    starCount=0;
 
}


void mouseMoved() {
}
//-------------------------------------------//
class star {
  //the position
  float xPos;
  float yPos;

  //the size
  float wd= random(10, 20);

  //how much the positions change by each step
  float xStep = random(-2, 2);
  float yStep = random(-2, 2);


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
    if (xPos+xStep<0) {//if it's going to go off the left side
      xStep=random(3, 0.5);
      xPos = xPos+ xStep*2;
    }
    if (xPos+xStep>686) {//off the right side
      xStep=random(-3, -0.5);
      xPos = xPos+ xStep*2;
    }
    if (yPos+yStep<0) {//off the top
      yStep=random(3, 0.5);
      yPos = yPos+ yStep*2;
    }
    if (yPos+yStep>686) {//off the bottom
      yStep=random(-3, -0.5);
      yPos = yPos+ yStep*2;
    }
    //makes sure no horizontal/vertical stars
    if (xStep<1&&xStep>0) {
      xStep=random(3, 0.5);
    }
    if (xStep>-1&&xStep<0) {
      xStep=random(-3, -0.5);
    }
    if (yStep<1&&yStep>0) {
      yStep=random(3, 0.5);
    }
    if (yStep>-1&&yStep<0) {
      yStep=random(-3, -0.5);
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

      this.xPos -= dx/15;
      this.yPos -= dy/15;
      if(a<=60){
      a++;
      }
    }

    else {
      following=false;
    }

    if (this.xPos>685 ) {
      following = false;
    }
    if (this.xPos<0) {
      following = false;
    }
    if (this.yPos>685) {
      following=false;
    }
    if (this.yPos<0) {
      following=false;
    }
  }
}



