
int [] pos = {40, 70, 100, 130, 160};
 
void setup ()
{
  size (200, 200);
}

void draw()
{
  background(0,0,0);
  noStroke();
  rect(0,180,200,20);
  rect(0,0,20,180);
  rect(180,0,20,180);
   if ((mouseX > width-20 || mouseX < 20)||(mouseY > height - 20))
   {
    for (int i = 0; i < pos.length; i ++)
    {
     fill(255);
     ellipse (pos[i], 100, 20, 20);
    }
  }
}



