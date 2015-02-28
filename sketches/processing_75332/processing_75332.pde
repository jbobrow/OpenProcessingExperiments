


int w=5;
int h=5;
int count=1;
int x=10;


star[] stars= new star[100];
color[] starColor = new color[1000];

void setup() {
  size(700, 700);
  background(0);
  smooth();

 noCursor();

  for (int i = 0; i < 100; i++) {
    stars[i] =new star(random(width), random(height));
    starColor[i] = color((int)random(100,255));
  }

  // mouseThings();
  //stars();
}

void draw() {
  background(0);
float o=random(210,220);
  
  
  
  fill(255);
  ellipse(mouseX,mouseY,10,10);
    fill(247,227,2,o);
    
    //for each star in the array stars
    for(star working: stars){
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
  float wd= 6;
  
  //how much the positions change by each step
  float xStep = random(-0.5, 0.5);
  float yStep = random(-0.5,0.5);
  
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
  
}



