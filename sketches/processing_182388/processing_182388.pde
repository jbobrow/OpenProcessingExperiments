
float radius = 60;
float CSX, CSY;

void setup()
{
  size(400,400);
  
  CSX = width/2;
  CSY = height/2;
}

float x_random=2, y_random=2;

boolean drawn = false;
void draw()
{
  if (!drawn)
  {
    background(0);
    stroke(255);
    
    radius = random(60,90); 
    
    float previousX = sin(0)*(radius/random(0.9f, x_random));
    float previousY = cos(0)*(radius/random(0.9f, y_random));

    float distanceX, distanceY;
    float startX = previousX;
    float startY = previousY;
    
    int inverted_point = 0;
    if (random(100)>50)
      inverted_point = (int)random(1, 6);

    for (int i=1;i<2;i++)
    { 

      if (i!=inverted_point)
      {
        distanceX = sin(i)*(radius/random(0.9f, x_random));
        distanceY = cos(i)*(radius/random(0.9f, y_random));
      }
      else
      {
        distanceX = sin(i)*(radius/random(5,15));
        distanceY = cos(i)*(radius/random(5,15));
      }

      line(previousX+CSX, previousY+CSY, distanceX+CSX, distanceY+CSY);
      line(

      previousX = distanceX;
      previousY = distanceY;
    }

    line(previousX+CSX, previousY+CSY, startX+CSX, startY+CSY);
    drawn=true;
  }
}

void keyPressed()
{
  drawn=false;
}
