
float xPosition;
float yPosition,yPosition2,yPosition3,yPosition4;
PImage wrong;
PImage lose;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  yPosition=600;
  yPosition2=600;
  yPosition3=600;
  yPosition4=600;
  
  wrong = loadImage("wrong.jpg");
  lose = loadImage("lose.jpg");
}



void draw(){
  background(0);
  fill(#FF0000);
  ellipse(xPosition+100,yPosition,50,50);
  ellipse(xPosition+200,yPosition2,50,50);
  ellipse(xPosition+300,yPosition3,50,50);
  ellipse(xPosition+400,yPosition4,50,50);
  yPosition-=4;
  yPosition2-=3;
  yPosition3-=5;
  yPosition4-=2;
  
  
  if(mousePressed)
  {
    image(wrong,75,170,357,132);
  }

  
}



