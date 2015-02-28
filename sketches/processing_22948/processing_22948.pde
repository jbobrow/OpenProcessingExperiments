
///////////////////////////////////////////////
/// Written by Ben Jack, 14th February 2011 ///
///////////////////////////////////////////////

int x = 0;
int y = 0;
int speed = 1;
int cspeed;

void setup(){
  smooth();
  size(500,500);
  
}

void draw()
{
  for(int a = 0; a <100; a = a + 20)
  {
    float x = random(0,500);
    float y = random(0,500);
    fill(255);
    arc(x, y, 50, 50, 0, PI);
    fill(255,0,0);
    arc(x, y, 50, 50,PI, TWO_PI);
    fill(0);
    ellipse(x,y,10,10);
    line(x+25,y,x-25,y);
  }
}

void yourFunction(){    
  
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
  if(key == 'u')
  {
    speed = speed + 1;
  }
  if(key == 'i')
  {
    speed = speed - 1;
  }
  
}

