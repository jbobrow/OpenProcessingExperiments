
void setup()
{
size(500,500);
background(0);
}
void draw()
{
if(mousePressed == true){
}
fill(255, 0, 0);

  translate(mouseX, mouseY);
  rotate(radians(100));
  
  ellipseMode(CENTER); 
  fill(0,0,255);
  ellipse(250,90,80,80);
  fill(255, 255, 0);
  ellipse(200, 120, 80, 80);
  fill(0,255,255);
  ellipse(200, 50, 80, 80);
  fill(255,0,0);
  ellipse(160,90,80,80);
  
  }


