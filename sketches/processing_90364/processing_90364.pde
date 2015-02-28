
int xPos=110;
int yPos=1;
int xCount=6;
int yCount=5;

void setup (){
  frameRate(1500);
  size(600,600);
  smooth();
}
void draw(){
 
    stroke(random(0,255),random(0,255),random(0,255));
    background(150,255,255);
    strokeWeight(20);
    noFill();
    ellipse(xPos,yPos,50,50);
    
    xPos= xPos +xCount;//incex x postion by 1
    if(xPos >= 600 || xPos <= 0){
      if (mousePressed);
      xCount=-xCount;//reverses when hits far edge
    }
    yPos=round(yPos+(yCount*1.8)); //index y postion by 1
      if(yPos>= 600 || yPos<=0){
        yCount=-yCount;// reverses when hit on bottom
      }
      
  }
