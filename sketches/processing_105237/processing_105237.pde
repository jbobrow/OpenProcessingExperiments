
float posX;
float posY;

float targetposX;
float targetposY;

color red = color(255,0,0);
color blue = color (0,0,255);
color green = color (0,255,0);
color white = color (255);
color ballColor=(255);

void setup(){
size(500,500);
posX= width/2;
posY=height/2;
targetposX=width/2;
targetposY=500;
}

void draw (){
  background (0);
  
  fill(ballColor);
  noStroke();
  ellipse(posX, posY, 20, 20);
  posX=posX- (posX-targetposX)/5;
  posY=posY- (posY-targetposY)/5;
 
  
  //bottom side
   if ((posX>0) && (posX<500) && (posY>495)){
   targetposX=500;
   targetposY=random(100,400);
   ballColor=blue;}
   
   //right side
   if ((posX>495) && (posY>0) && (posY<495)){
   targetposX=random(100,400);
   targetposY=0;
   ballColor=green;}
   
   //top side
   if ((posX>0) && (posX<495) && (posY<5)){
   targetposX=0;
   targetposY=random(100,400);
   ballColor=white;}
   
   //left side
   if ((posX<5) && (posY>0) && (posY<495)){
   targetposX=random(100,400);
   targetposY=500;
   ballColor=red;}
   

}


