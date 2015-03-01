
float positionX = 0;
float positionY = height/2;
int compteur = 0;


void setup(){
  
  size(400,400);
  
  frameRate(3);
  noStroke();
  
  // noLoop();
}


void draw(){
  
  background(255);
  compteur += 1;
  if (compteur ==4) {
    compteur =1;
  }
  fill(240,0,0,120);
  ellipse(positionX,height/2,160,160);
  
  if (compteur ==1) {
  fill(0,240,0,120);
  ellipse(positionX,height/2,160,160);
  }
  
   if (compteur ==2) {
  fill(0,0,240,120);
  ellipse(positionX,height/2,160,160);
  }
  
  positionX = random(100,300);
  positionY = random(300,100);
}



