
//copyright Yoon-ji Kim
//51-257 A, 11/21/14
void setup()
{
  size(400, 400);
  background(15, 73, 93);
  noCursor();
}

float x, y;
float wd, ht;

void draw()
{
  //background(0);
  fill(0, 10);
  x = mouseX;
  y = mouseY;
  
  if(mouseX != pmouseX && mouseY != pmouseY  )
{
    wd = random(0, 70);
    ht = random(50);
    
    fill(83, 148, 211);
    stroke(255);
    ellipse(mouseX, mouseY, wd, ht);
  }
}


