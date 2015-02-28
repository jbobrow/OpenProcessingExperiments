
int xPos=6;
int yPos=1;
int xCount=6;
int yCount=5;
  
void setup (){
  frameRate(9001);
  size(800,800);
  smooth();
}
void draw(){
   
    stroke(random(70,255),random(150,255),random(150,255));
  
    strokeWeight(20);
    noFill();
    rect(xPos,yPos,50,50);
      
    xPos= xPos +xCount;//incex x postion by 1
    if(xPos >= 800 || xPos <= 0){
      if (mousePressed);
      xCount=-xCount;//reverses when hits far edge
    }
    yPos=round(yPos+(yCount*2)); //index y postion by 1
      if(yPos>= 800 || yPos<=0){
        yCount=-yCount;// reverses when hit on bottom
      }
      if (mousePressed){
      background (random(150,255),random(0,50),random(0,50));
      ellipse(200,200,xPos,yPos);
      ellipse(600,600,xPos,yPos);
      ellipse(200,600,xPos,yPos);
      ellipse (600,200,xPos,yPos);
      ellipse(200,400,xPos,yPos);
      ellipse(600,400,xPos,yPos);
      ellipse(400,200,xPos,yPos);
      ellipse(400,600,xPos,yPos);
   
      }
       if(keyPressed){
         stroke(70,255,250);
         fill(70,70,250);
         ellipse(xPos,yPos,200,200);
           stroke(250,250,50);
       }
    line ( xPos,yPos,mouseX,mouseY);
    line (xPos,yPos,400,400);
 
       frameRate(100);
       fill(100,240,70);
      stroke(random(0,250),250,random(100,200));
       ellipse(400,400,yPos,xPos);
}
