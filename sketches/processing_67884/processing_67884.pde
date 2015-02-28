
int x,y=0;

void setup()
{
  size (400,300);}
  void draw () 
 {
  noFill ();
  smooth ();
  frameRate(15);
  background (#C1E6F5);
  strokeWeight (5);
  
  stroke (0,0,255);  
  ellipse (80,80,100,100);

  stroke (0,0,0);         
  ellipse (185,80,100,100);
  
  stroke (255,0,0);
 if(x==310||y==100)
  {
    ellipse (290,80,100,100); 
  }
  else
  {
    x=(int) random(400);
    y=(int) random(300);
    ellipse (x, y,100,100); 
  }
  
  
  stroke (255,255,0);        
  ellipse (133,150,100,100);
  
  stroke (0,255,0);      
  ellipse (238,150,100,100);

  }


