
float dTurn = 0, dTurn1 = 0;
boolean oneFinished = false, twoFinished = false;
int counter;

void setup()
{
  size(400, 400);
  ellipseMode(CENTER); 
 strokeWeight(2);
 smooth();
  counter = 0; 
 frameRate(5);
}

void draw() 
{
  background(255);
 
  setupCircle();
  if( counter == 1)
    doConstruction();
 
}

void setupCircle()
{
    ellipse(width/2,height/2,300,300);
    line(50,height/2,350,height/2);
    line(200,50,200,350);   
  
}

void doConstruction()
{
  
   line(200,50,275,200);
   noFill();
   animSegmentOne();
   animSegmentTwo(200,50,352.6,122, 144);
   if(twoFinished)
   {
     stroke(#33ccff);
     arc(200,50,352.7,352.7, radians(30),radians(40));
     stroke(#ff0033);
     line(200,50,200+150*cos(radians(18)),200-150*sin(radians(18)));
     ellipse(200,50, 3, 3);
     ellipse(200-150*cos(radians(18)),200-150*sin(radians(18)), 5, 5);
     ellipse(200+150*cos(radians(18)),200-150*sin(radians(18)), 5, 5);
     ellipse(200+150*cos(radians(54)),200+150*sin(radians(54)), 5, 5);
     ellipse(200-150*cos(radians(54)),200+150*sin(radians(54)), 5, 5);
     stroke(#33ccff);
     arc(200+150*cos(radians(18)),200-150*sin(radians(18)),352.7,352.7, radians(100),radians(120));
     arc(200+150*cos(radians(54)),200+150*sin(radians(54)),352.7,352.7, radians(170),radians(190));
     stroke(#ff0033);
     line(200+150*cos(radians(18)),200-150*sin(radians(18)),200+150*cos(radians(54)),200+150*sin(radians(54)));
     line(200+150*cos(radians(54)),200+150*sin(radians(54)),200-150*cos(radians(54)),200+150*sin(radians(54)));
     line(200-150*cos(radians(54)),200+150*sin(radians(54)),200-150*cos(radians(18)),200-150*sin(radians(18)));
     stroke(0);
     
   }
}

void animSegmentOne()
{
 
  if(dTurn < 12)
    {
      dTurn++; 
      stroke(#33ccff);
      arc(275,200,335.4,335.4,radians(240)-radians(5*dTurn), radians(242));
       stroke(0);
      line(275,200,275+167.7*cos(radians(240)-radians(5*dTurn)),200+167.7*sin(radians(240)-radians(5*dTurn)));
    }
    else
    {
       stroke(#33ccff);
       arc(275,200,335.4,335.4,radians(240)-radians(5*12), radians(242));
      // marker
       stroke(#ff0033);
       ellipse(107.3,200,5,5);
       stroke(0);
       line(107.6,200,200,50);
       oneFinished = true;
    }
}

void animSegmentTwo(float centerX, float centerY, float diameter, float startDegree, float endDegree)
{  
  float degreeTurn = endDegree-startDegree;
  
  if( oneFinished)
  {
    if(dTurn1 < degreeTurn)
      {
        dTurn1++; 
        stroke(#33ccff);
        arc(centerX,centerY,diameter,diameter, radians(startDegree), radians(startDegree)+radians(dTurn1));
        stroke(0);
        line(centerX,centerY,centerX+diameter/2*cos(radians(startDegree+dTurn1)),centerY+diameter/2*sin(radians(startDegree+dTurn1)));
      }
      else
      {
        stroke(#33ccff);
        arc(centerX,centerY,diameter,diameter,radians(startDegree), radians(endDegree));
        stroke(#ff0033);
        line(centerX,centerY,centerX+diameter/2*cos(radians(endDegree)),centerY+diameter/2*sin(radians(endDegree)));
        stroke(0);
        twoFinished = true;
      }
  }
    
}

void mouseClicked() 
{
  //if(animOff)
    counter++;
    if (counter > 1)
   { 
    oneFinished = false;
    twoFinished = false;
    dTurn =0;
    dTurn1 =0;    
     counter = 0;
   }
}
  



