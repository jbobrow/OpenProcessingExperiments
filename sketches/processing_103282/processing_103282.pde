
//Name : Liheng Zhang
//Date : 07/08/2013
//Project Name : Sad/Happy Face
//Click your mouse makes it happy.

void setup () {
  size (600, 600);
  smooth();
  fill(0,102);
}

void draw() 
  {
    background (240);
    
    fill(180);
    ellipse (mouseX, mouseY, 200,200);
    
    fill(0);
    ellipse (mouseX-40, mouseY-30, 40,50);
    
    fill(240);
    ellipse (mouseX-50, mouseY-40, 10,15);
    
    fill(0);
    ellipse (mouseX+40, mouseY-30, 40,50);
    
    fill(240);
    ellipse (mouseX+30, mouseY-40, 10,15);
    
    line (mouseX-60, mouseY+40, mouseX+60, mouseY+40);
    
    
    if(mousePressed == true)
    {
      fill(255,182,193);
      ellipse (mouseX, mouseY, 200,200);
      
      fill(0);
      ellipse (mouseX-40, mouseY-30, 40,50);
      
      fill(240);
      ellipse (mouseX-50, mouseY-40, 10,15);
      
      fill(0);
      ellipse (mouseX+40, mouseY-30, 40,50);
      
      fill(240);
      ellipse (mouseX+30, mouseY-40, 10,15);
      
      fill(139,0,0);
      arc (mouseX, mouseY+40, 120, 80, radians(0), radians(180) );
      
    }
  }
