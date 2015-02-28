
void setup()
{
  size (400,300);}
  void draw () 
 {
  noFill ();
  smooth ();
  background (#C1E6F5);
  
  stroke (0,0,255);  
  strokeWeight (5); 
  ellipse (80,80,100,100);

  stroke (0,0,0);         
  ellipse (185,80,100,100);
  
  stroke (255,0,0);
  ellipse (mouseX, mouseY,100,100); 
  
  
  stroke (255,255,0);        
  ellipse (133,150,100,100);
  
  stroke (0,255,0);      
  ellipse (238,150,100,100);

  }

