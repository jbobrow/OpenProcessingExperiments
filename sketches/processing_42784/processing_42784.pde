
/*
Deanna Hagopian
Paint Program
*/

PShape s;

void setup()
{
size (600,600);
smooth();
background(255);
//rectMode(CENTER);

s = loadShape ("final_logo_wb.svg");
//noLoop();

}




void draw()
{

  if(mousePressed && mouseButton == LEFT)
  {
    logo(mouseX,mouseY);
  }
else if (mousePressed && mouseButton == RIGHT) 
{
    background(255);
  }
}





void logo(float x, float y)
{ 
  pushMatrix(); 
  //translate(width/2, height/2);

  shape(s, mouseX, mouseY, 100, 100);
  
  popMatrix();
}


