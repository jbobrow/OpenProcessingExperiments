

PImage online;

void setup()
{
   size(500, 500);
   background(0)
   textSize(32);
   text("Frances' Drawing Canvas", 10, 35);
   
   
   
}



void draw() 
{
  strokeWeight(4);
  stroke(80,0,20);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  
}
  
 
  
}

