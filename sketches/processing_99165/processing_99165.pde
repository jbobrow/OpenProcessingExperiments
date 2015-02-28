
void setup()
{
  size (400,400);
  background (167, 235,255);
  smooth();
  frameRate (10);
}
void draw()
{
  fill(167, 235,255, 5);
  noStroke();
  rect(0, 0, width, height);
  stroke(70, 201, 232);
  line(mouseX-10, mouseY-10, mouseX+10, mouseY+10);
  line(mouseX-10, mouseY+10, mouseX+10, mouseY-10);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
  
  fill( 255,255,255,255);
  rect(0,300,600,600);

  ellipse(100,280,60,60);  
  ellipse(100,234,45,45);        
  ellipse(100,200,30,30);
  
  fill(255,190,49,255);
  triangle (100,200,100,207,114,203);
  
  fill (0,0,0,255);
  ellipse (95,194,5,5);
  
  fill (0,0,0,255);
  ellipse(105,194,5,5);
  
 
  
  }
