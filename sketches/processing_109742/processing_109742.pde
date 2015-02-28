
/*

Pinak Saha
HW02 & HW03
Visual Foundation Studio
Fall2013
(0408908)

Positions Drawn at random on a grid & grid is generated 
through looping

*/


void setup()
{
  size(400,400);
  background(000000);
  frameRate(10);
}

void draw()
{
  drawRadarTemplate();
  if(keyPressed == true)
  {
    drawPos();
  }
}
void drawRadarTemplate()
{
  //ellipseMode(CENTER);
  
  //outer circle
  stroke(#00ffff);
  fill(000000);
  strokeWeight(5);
  ellipse(200,200,400,400);
  
  //iner circle
  fill(000000);
  stroke(#00ffff);
  strokeWeight(5);
  ellipse(200,200,300,300);
  
  
  stroke(#00ffff);
  strokeWeight(5);
  line(200,350,200,50);
  
  
  stroke(#00ffff);
  strokeWeight(5);
  line(50,200,350,200);
  
  
  stroke(#00ffff);
  strokeWeight(5);
  fill(#00ffff);
  //(x1,y1,x2,y2)
  line(100,300,300,100);
  
  
  PFont HelveticaNeue;
  HelveticaNeue = loadFont("HelveticaNeue-Light-36.vlw");
  textSize(36);
  
  textFont(HelveticaNeue);
  
  
  
  fill(#00ffff);
  textSize(36);
  text('N',185,40);
  text('E',360,215);
  
  text('S',190,385);
  
  text('W',10,215);
  
  // Drawing Grid
  
  for(int x=100; x < 300; x = x+10)
  {
      for(int y =100; y < 300; y = y+10)
      
      {
        
        stroke(#00ffff);
         strokeWeight(1);
         line(x,y,300,y);
         line(x,y,x,300);
      }
  }

//red line

  stroke(#ff0000);
  strokeWeight(3);
  fill(#ff0000);
  //(x1,y1,x2,y2)
  line(300,250,100,150);
  
  
  // make positons appear on random cordinates
   
}



void drawPos()
{
          drawRadarTemplate();
          fill( random(200,255), random(200,255), random(200,255), random(200,255));
          textSize(random(24,36));
          text('X',random(100,300),random(100,300));
          
}  


