
int xPos = 0;
int yPos = 0;
float shapeSize = random(1,20);

void setup(){
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  rectMode(CENTER);
  frameRate(10);
}

void draw(){
  
  while (shapeSize<101){
    fill(0,random(70,90),random(180,225),random(50));
    rect (xPos,yPos,shapeSize+random(10),shapeSize+random(10));
    ellipse (xPos+10,yPos,shapeSize+random(10),shapeSize+random(10));
    ellipse (xPos+30,yPos,shapeSize+random(10),shapeSize+random(10));
    //fill(50,15);
    ellipse (xPos+70,yPos,shapeSize+random(10),shapeSize+random(10));
    shapeSize = shapeSize+random(5,80);
  }
  
  xPos = xPos + 100;
  shapeSize = 10;
  
  if(xPos>500){
    xPos = xPos + 15;
    yPos = yPos + 70;
    xPos = 0;
  }

      
}

