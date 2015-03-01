
float red;
float green;
float blue;
int bg;
int xPos;
int yPos;
int xPos1;
int yPos1;
int xPos2;
int yPos2;
int xPos3;
int yPos3;
int xPos4;
int yPos4;
int xPos5;
int yPos5;
int xPos6;
int yPos6;
 
 
void setup(){
  size(600,700);
  red = 183;
  green = 209;
  blue = 245;
  bg = 255;
  //cloud 1
 xPos = 250;
 yPos = 150;
 xPos1 = 300;
 yPos1 = 150;
 xPos2 = 200;
 yPos2 = 150;
  
 //cloud 2
 xPos3 = 480;
 yPos3 = 100;
 xPos4 = 530;
 yPos4 = 100;
 xPos5 = 430;
 yPos5 = 100;
  
 //Move the sun
 xPos6 = 230;
 yPos6 = 140;
}
 

void draw(){
   
  // change background to dark blue
  background(red, green, blue);
  if(red>21){
  red = red - 1;
  }
  if(green>52){
  green = green - 1;
  } 
  if(blue>103){
  blue = blue - 1;
  }
 
  //This is for the sun and the cloud. The first fill, stroke and ellipse is for the yellow of the sun.
  fill(255,245,131);
  stroke(255,245,131);
  ellipse(xPos6,yPos6,200,200);
  //This is for the three circles for the clouds. The white for the cloud.
  
  fill(255,255,255);
  stroke(255,255,255);
  ellipse(xPos,yPos,100,120);
  ellipse(xPos1,yPos1,100,100);
  ellipse(xPos2,yPos2,100,100);
   
  ellipse(xPos3,yPos3,100,120);
  ellipse(xPos4,yPos4,100,100);
  ellipse(xPos5,yPos5,100,100);
 xPos-=2;
 xPos1-=2;
 xPos2-=2;
 xPos3+=1;
 xPos4+=1;
 xPos5+=1;
 yPos6+=2;
  //This is for the rectangle of the house
  fill(216,162,131);
  //stroke(216,162,131);
  stroke(0);
  rect(300,300,200,145);
  //This is for the roof of the house.
 
  quad(500,300,550,285,550,430,500,445);
  fill(255,240,232);
  triangle(300,300,400,200,500,300);
  quad(400,200,450,185,550,285,500,300);
  //This is for the grass for the garden.
  fill(185,245,156);
  stroke(185,245,156);
  rect(0,445,600,445);
  //Going to now add things in, windows and doors and such like.
 fill(bg);
  

 noStroke();
 fill (219,255,246);
 rect(310,310,60,50);
 rect(430,310,60,50);
 fill (175,183,181);
 rect(310,375,130,70);
 fill (116,58,14);
 rect(270,390,10,50);
 rect(250,390,10,50);
 rect(230,390,10,50);
 rect(210,390,10,50);
 rect(190,390,10,50);
 rect(5,395,280,10);
 rect(5,415,280,10);
 rect(170,390,10,50);
 rect(150,390,10,50);
 rect(130,390,10,50);
 rect(110,390,10,50);
 rect(90,390,10,50);
 rect(70,390,10,50);
 rect(50,390,10,50);
 rect(30,390,10,50);
 rect(10,390,10,50);
 fill(90,11,18);
 stroke(90,11,18);
 rect(455,399,25,45);
 
 
 fill(185,245,156);
 noStroke();
 quad(500,445,550,430,600,430,600,500);

 rect(0,430,300,15);
}



