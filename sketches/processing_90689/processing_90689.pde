
/*
Andy Cao

It's Alive
make a circle that "breathes" using variables and for loops
*/
int xPos = 1;
int yPos = 1;
int xCount = 5;
int yCount = 2;


void setup(){
  frameRate(30);
  size (600,600);
  smooth();
}

void draw(){
    background(235);
    fill(255,0,0,160);
    stroke(235,10,131);
    strokeWeight(20);
    ellipse(xPos,yPos,100,100);
    xPos = xPos + xCount;
    if(xPos >= 600 || xPos <=0){
      xCount=-xCount;   
    }
    yPos = yPos + round(yCount*3.5);
if(yPos >= 600 || yPos <=0){
      yCount = -yCount;   
  }
}
