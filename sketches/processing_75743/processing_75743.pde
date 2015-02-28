
int w=5;
int h=5;
int count=1;
int x=10;
boolean runAway=false;


star[] stars= new star[80];
color[] starColor = new color[1000];



void setup() {
  size(700, 700);
  background(0);
  smooth();

 noCursor();

  for (int i = 0; i < 80; i++) {
    stars[i] =new star(random(width), random(height));
    starColor[i] = color((int)random(100,255));
  }

  // mouseThings();
  //stars();
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  //background(0);
float o=random(210,220);
  
  fill(255);
  ellipse(mouseX,mouseY,15,15);
    fill(247,227,2,o);
    
    //for each star in the array stars
    for(star working: stars){
      working.runAwayfrom(mouseX, mouseY);
      working.drawStar();
    }
  }




void mouseMoved() {
 
}
//-------------------------------------------//
class star{
  //the position
  float xPos;
  float yPos;
  
  //the size
  float wd= 8;
  
  //how much the positions change by each step
 float xStep = random(-2, 2);
  float yStep = random(-2,2);
  
  float dx, dy;
  
  //constructor
 star(float x, float y){
   xPos = x;
   yPos = y;
  }
  
  void drawStar(){
    ellipse(xPos, yPos, wd, wd);
    xPos = xPos + xStep;
    yPos = yPos + yStep;
    //reverse
    if(xPos<0||xPos>700){xStep=xStep*-1;}
    if(yPos<0||yPos>700){yStep=yStep*-1;}
  }
  
  void runAwayfrom(float xp, float yp) 
  {
    if(dist(this.xPos, this.yPos, xp, yp) < 50) {
      dx = this.xPos - xp;
      dy = this.yPos - yp;
      if(runAway){
      
      this.xPos += dx/10;
      this.yPos += dy/10;
    }
    
    else{
          this.xPos -= dx/10;
      this.yPos -= dy/10;
  }
    }
  }
  
}



