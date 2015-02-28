
/*
 
Pinak Saha
HW04
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
  Compass aCompass = new Compass();
  if(keyPressed == true)
  {
    aCompass.drawPos();
  }
}
class Compass
{

  void drawOutter()
  {
    stroke(#00ffff);
    fill(000000);
    strokeWeight(5);
    ellipse(200,200,400,400);
  }
  void drawInner()
  {
     //iner circle
      fill(000000);
      stroke(#00ffff);
      strokeWeight(5);
      ellipse(200,200,300,300);

  }
  
  void drawAxis()
  {
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

  }
  
  void drawAxisPosition()
  {
      fill(#00ffff);
      textSize(36);
      text('N',185,40);
      text('E',360,215);
      text('S',190,385); 
      text('W',10,215);
  }
  
  void drawGrid()
  {
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

  }
  
  void drawTrueNorth()
  {
     stroke(#ff0000);
     strokeWeight(3);
     fill(#ff0000);
    line(300,250,100,150);

  }
  
  void drawPos()
  {
          fill( random(200,255), random(200,255), random(200,255), random(200,255));
          textSize(random(24,36));
          text('X',random(100,300),random(100,300));
           
  } 
  
    Compass()
  {
    
    //outer circle
     drawOutter();
     
    //inner circle
     drawInner();
     //axis
     drawAxis();
     drawAxisPosition();
     drawTrueNorth();
     
    //Grid
      drawGrid();
  }
  
  
}


