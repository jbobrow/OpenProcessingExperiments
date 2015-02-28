
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
  
  //background(255);
  x = x + speed;
  fill(random(0,255),random(0,255),random(0,255));
  rect(x,y,20,20);
  if(x > 480)
  {
    speed = speed * -1;
    y = y + 25;
  }
  if(x < 0)
  {
    speed = speed * -1;
    y = y + 25;
  }
  if(y > 500)
  {
    x = 0;
    y = 0;
    background(255);
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

