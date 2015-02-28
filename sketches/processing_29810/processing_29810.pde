
//codigo que so corre uma vez
void setup()
{
  size (800,600);
  background(255);
  smooth();
  
  fill(255,0,0);
  ellipse(width/2, height/2,20,20); 
  
  

}

void draw()
{
  //background(255);
  fill(255,255,0);
  ellipse(mouseX, mouseY,20,20);
  fill(255,100);
  rect(0,0,width,height);

}

