
void setup() 
{
  size(400, 400); 
  stroke(255);  
}

int framecount = 0;
int mouthGape = 30;

void draw()
{
  update();
  background(255);
  stroke(50);
  line(mouseX, mouseY, mouseX+30, mouseY+mouthGape);
 line(mouseX, mouseY, mouseX+30, mouseY-mouthGape);
}

void update()
{
  framecount++;

  if(mousePressed)
  {
      if(mouthGape > 0)
      {
        mouthGape--;
      }
      
  }
  else
      {
        if(mouthGape < 30)
        {
           mouthGape++;
        }
      }

}




