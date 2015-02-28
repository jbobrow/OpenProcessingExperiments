
void setup() 
{
  size (500, 500);
  fill(255, 255, 255);
  smooth();
  noStroke();
  frameRate(15);
}
 
 
void draw() 
{
  background(#D4F3FA);
 
 //beehive outline
  fill(#A0895C);
  ellipse(250,110,120,60);
  ellipse(250,150,170,90);
  ellipse(250,200,220,120);
  ellipse(250,250,270,150);
  
  //beehive
  fill(#EDCE90);
  ellipse(250,110,110,50);
  ellipse(250,150,160,80);
  ellipse(250,200,210,110);
  ellipse(250,250,260,140);
  
  //beehive door
  fill(#A0895C);
  ellipse(250,270,40,60);
  fill(#EDCE90);
  rect(220,280,50,20);
 
  float xPos;
  float yPos;
  float beeNum = random(mouseX/15);
  
 //BEEZ

      for (int x=0; x<=beeNum; x=x+10) 
      { 
        for (int y=0; y<=beeNum; y=y+10) 
        {
          xPos = random(mouseX);
          yPos = random(mouseX);
     
          fill(#F0F5F7);
          ellipse(xPos, yPos-10,7,10);
          fill(#FFE062);
          ellipse(xPos, yPos, 20, 15);
          fill(#292823);
          rect(xPos-3,yPos-8,2,15);
          rect(xPos+1,yPos-8,2,15);
          ellipse(xPos-7,yPos,2,2);
          
          if(mouseX>200)
          {
    
            text("SWARM!!",230,400);
          }
          
        }
      }
 
  //END BEEZ
}
