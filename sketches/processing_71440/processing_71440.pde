
//Matthew Quesada, Computer Programming Mods 4-5
//UserInput
void setup()
{
  background(0);
  size (1000, 1000);
}
void draw()
{
  
   fill(0,0,0,10);
  strokeWeight(45);
  rect(0,0,1000,1000);
  
  strokeWeight(1);
  stroke(0,random(0,255), random(0,255));
  triangle(mouseX,mouseY,1000-mouseX,1000-mouseY,
  mouseX+400,mouseY+400);
    
 
}

void mousePressed()
{
  if (mouseButton==RIGHT)
  {
    fill(0, 0, 0, 10);
    rect(0, 0, 1000, 1000);

  strokeWeight(15);
    stroke(255);


    stroke(234, 222, 85);
   quad(random(0,1000),random(0,1000), random(0,1000),random(0,1000),
random(0,1000),random(0,1000), random(0,1000),random(0,1000));

  }
}

void keyPressed()
{
if (keyPressed==true)
{
 fill(0,0,0,10);
rect(0,0,1000,1000);  
strokeWeight(15);
stroke(245,174,67);
quad(random(0,1000),random(0,1000), random(0,1000),random(0,1000),
random(0,1000),random(0,1000), random(0,1000),random(0,1000));
 }
}
