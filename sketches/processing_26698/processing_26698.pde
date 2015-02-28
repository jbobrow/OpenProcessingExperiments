
float diameter = 5;
float space = 10;
float counter = 50;
float distance;

void setup(){
  size (500,500);
  background(0);
}


void draw()
{
  
  background(0);
 for (float x = 0; x < 100; x = x + 1)
  {
    for (float y = 0; y < 150; y = y + 3)
    {
    distance = dist(mouseX,mouseY,50,53);
    fill(255);
  
    if (distance< 100)
    {
      fill (250,243,28);
    }
    if (distance >100)
    {
      fill(168,47,245);
    }
    if (distance >200)
    {
      fill (113,56,2);
    }
    if (distance >300)
    {
      fill (5,77,21);
    }
   ellipse(mouseX,mouseY,25,25);
      ellipse(x * counter, y *space , diameter, diameter);
  }
  }
   
  counter = counter + 0.2;
  

  if (counter > 100)
  {
    counter = 10;
  }

}


