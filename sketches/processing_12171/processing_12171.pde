
//Random colored Squares and Circles by Wainer
//September, 14 2010


void setup()

{
 size (400,400);
 background(0);
}

void draw()
{


    

 fill(random(0,255),random(100,200),random(2,250)+50);
 rect(mouseX,mouseY,20,20);
 ellipse(width-mouseX,height-mouseY,20,20);

 
  

  
}

  void mouseDragged()
  {
     fill(200,200,200); 
  rect(mouseX,mouseY,20,20);
  ellipse(width-mouseX,height-mouseY,20,20);
  }
  void mouseReleased()
  {
   background(0);
    
  }

