

void setup() {
  size(200,200);
  background(180);
  smooth();
}


void draw() {

  if (mousePressed==true && (mouseButton == LEFT) ) 
{
  stroke(0);
  strokeWeight(1);
  point(mouseX++, mouseY);
  }
  else if (mousePressed && (mouseButton == RIGHT))  
{
   stroke(0);
   strokeWeight(1);
   point(mouseX, mouseY++);
  }
    }


  void mouseDragged() 
{
  if (mousePressed==true && (mouseButton == LEFT) ) 
{
  stroke(255,0,0);
  strokeWeight(5);
  }
   else if (mousePressed && (mouseButton == RIGHT))
{
   stroke(180);
   strokeWeight(10);
}
  point(mouseX, mouseY);
  }

 
  
    
 





