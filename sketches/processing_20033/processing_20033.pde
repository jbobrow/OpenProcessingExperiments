
// Mouse input
color backFillColor = (#000000);


void setup ()
{
  size(600,600);
  colorMode(HSB, 100);
  smooth();
  background(backFillColor);
}

void draw ()
{
  //noCursor();
  

  //Draw a retangle that follows the mouse
 // fill(#BBCDFA, 150);
  noStroke ();

  
  //Draw a retangle that follows the mouse's previous position

  fill(30, (mouseX-pmouseX)*2, 200, 30);
  triangle(pmouseX+15, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);
  
   fill(30, (pmouseX-mouseX)*2, 200, 30);
  triangle(pmouseX+15, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);
  
    fill(20, (mouseY-pmouseY)*2, 200, 30);
  triangle(pmouseX+15, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);
  
   fill(20, (pmouseY-mouseY)*2, 200, 30);
  triangle(pmouseX+15, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);

  
  //Draw a line that indicates the mouse's direction of movement
  //line (width/2, height/2, (mouseX-pmouseX)+width/2, (mouseY-pmouseY)+height/2);
}

void mousePressed()
{
  noFill();
  stroke (#6A92F5);
  triangle(pmouseX+5, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);
  //Set it to green
  //backFillColor = #3DFC81;
  saveFrame("Mouse movement_r.jpg");
}


void mouseDragged()
{
  //Set it to pink
  noFill();
  stroke (#6A92F5);
  triangle(pmouseX+5, pmouseY+15, mouseX+10, mouseY+10, mouseX+20, mouseY+20);
  //backFillColor = #F238E6;
  
}


