
float xPos1;
float xPos2;
float xPos3;
float yPos1;
float yPos2;
float yPos3;
float radius1;
float radius2;
float radius3;

void setup(){
size(500,500);
xPos1=width/2;
xPos2=width/2;
xPos3=width/2;
yPos1=100;
yPos2=height/2;
yPos3=400;
radius1=100;
radius2=100;
radius3=100;

}

void draw(){
  background(0);
  fill(255,255,255,0);
  ellipse(xPos1,yPos1,radius1,radius1);
  ellipse(xPos2,yPos2,radius2,radius2);
  ellipse(xPos3,yPos3,radius3,radius3);
  fill(255,255,255,0);
  strokeWeight(.5);
  stroke(random(0,255),random(0,255),random(0,255));
  for (int i = 0;i<60;i++){
    ellipse(xPos1,yPos1,radius1+8*second(),radius1+8*second()); 
  }
  
  
  fill(255,255,255,0);
  strokeWeight(5);
  stroke(random(0,255),random(0,255),random(0,255));
   for (int i = 0;i<60;i++){
    ellipse(xPos2,yPos2,radius1+4*minute(),radius1+4*minute()); 
  }
  
  fill(255,255,255,0);
  map(hour(),0,24,0,60);
  strokeWeight(8);
  stroke(random(0,255),random(0,255),random(0,255));
   for (int i = 0;i<60;i++){
    ellipse(xPos3,yPos3,radius1+4*hour(),radius1+4*hour()); 
  }
 
  fill(255,0,0);
  textSize(30);
  text(second(), xPos1, yPos1);
  
  textSize(30);
  text(minute(), xPos2, yPos2);
  
  textSize(30);
  text(hour(), xPos3, yPos3);
  
}




