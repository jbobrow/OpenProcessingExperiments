
//Each segment of cloud individually labelled

//Cloud 1
int CloudoneoneXPos=20;
int CloudonetwoXPos=40;
int CloudonethreeXPos=30;
//Cloud 2
int CloudtwooneXPos=10;
int CloudtwotwoXPos=30;
//Cloud 3
int CloudthreeoneXPos=30;
int CloudthreetwoXPos=40;
int CloudthreethreeXPos=35;

//Direction
int xDir=1;

//Smoke
int billow1Ypos=490;
int billow2Ypos=490;
int billow3Ypos=490;
int billow4Ypos=490;

//Bird 1
int Birdwing1XPos=10;
int Birdwing2XPos=15;
int Birdwing3XPos=10;
int Birdwing4XPos=5;
//Bird 2
int Bird2wing1XPos;
int Bird2wing2XPos;

void setup()
{
size(800,800);
line(0,650,800,650);


//Declare Variables
//house
float houseW = 400;
float houseH = houseW*.40;
float offset = houseH/2;
float houseX = width-(houseW+offset),houseY = height-(houseH+offset);
//roof
float roofH=houseH/2.5;
//door
float doorW=houseW/15;
float doorH=doorW*2;
float doorX=houseX+houseW/7-doorW/2;
float doorY=houseY+houseH-doorH;
//chimney
float ChimneyW=houseW/15;
float ChimneyH=ChimneyW*8;
float ChimneyX=houseX+houseW/3-ChimneyW/2;
float ChimneyY=houseY+houseH-ChimneyH;



//Draw House
rect(houseX,houseY,houseW,houseH);
//Roof
triangle(houseX,houseY,houseX+houseW,houseY,houseX+(.5*houseW),houseY-(.30*houseH));
//Door
rect(doorX,doorY,doorW,doorH);
//Chimney
rect(ChimneyX,ChimneyY,ChimneyW,ChimneyH);

}


void draw()
{
  stroke(#CCCCCC);
  
  //Cloud1-----
  
  rect(CloudoneoneXPos,50,150,50);
  CloudoneoneXPos=CloudoneoneXPos+1;
   if (CloudoneoneXPos>width+20)
  {
    CloudoneoneXPos=-20;
  }
  
  rect(CloudonetwoXPos,40,135,25);
  CloudonetwoXPos=CloudonetwoXPos+1;
  if (CloudonetwoXPos>width+20)
  {
    CloudonetwoXPos=-20;
  }

  
  rect(CloudonethreeXPos,55,50,40);
  CloudonethreeXPos=CloudonethreeXPos+1;
  if (CloudonethreeXPos>width+20)
  {
    CloudonethreeXPos=-20;
  }

  
  //Cloud2-----
  
  rect(CloudtwooneXPos,150,300,70);
  CloudtwooneXPos=CloudtwooneXPos+1;
  
  rect(CloudtwotwoXPos,175,200,50);
  CloudtwotwoXPos=CloudtwotwoXPos+xDir;
  if (CloudtwotwoXPos>width-20 || CloudtwotwoXPos<20)
  {xDir=-xDir;}
  
  //Cloud3-----
  
  rect(CloudthreeoneXPos,250,70,30);
  CloudthreeoneXPos=CloudthreeoneXPos+1;
  
  rect(CloudthreeoneXPos,270,100,40);
  CloudthreetwoXPos=CloudthreetwoXPos+1;
  
  rect(CloudthreethreeXPos,260,100,35);
  CloudthreethreeXPos=CloudthreethreeXPos+1;
  
  
  //Test Birds
  
  //Bird1: Can't get the black streaking to go away and when I set the background to stay the same color as before it erases everything else.
  stroke(0);
  
  line(Birdwing1XPos,400,Birdwing2XPos,410);
  Birdwing1XPos=Birdwing1XPos+1;
  Birdwing2XPos=Birdwing2XPos+1;
  
  line(Birdwing3XPos,400,Birdwing4XPos,410);
  Birdwing3XPos=Birdwing3XPos+1;
  Birdwing4XPos=Birdwing4XPos+1;
  
  //Bird2
  
  //line(780,200,775,190);
  //line(780,200,785,190);
  
  //Smoke
  line(445,billow1Ypos,445,500);
  billow1Ypos=billow1Ypos-1;
  line(450,billow2Ypos,450,500);
  billow2Ypos=billow2Ypos-1;
  line(455,billow3Ypos,455,500);
  billow3Ypos=billow3Ypos-1;
  line(460,billow4Ypos,460,500);
  billow4Ypos=billow4Ypos-1;
  


}
