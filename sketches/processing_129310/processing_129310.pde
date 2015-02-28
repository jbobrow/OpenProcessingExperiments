
float px, py, px2, py2;
float angle, angle2;
float radius = 50;
float frequency = 2;
float frequency2 = 2;
float x, x2;
int horiz = 300;
int verti = 300;
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
void setup()
{
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}


void draw()
{
  background(0);
  ellipse(horiz,verti,44,44);

  if(horiz > width)
  {
    horiz = 0;
  }
  if(verti > height)
  {
    verti = 0;
  }
}
 
   
void keyPressed()
{
    if (key == 'w' || key == 'W' )
    {
      verti = verti - 3;

    }
    if (key == 's' || key == 'S')
    {
      verti = verti + 3;

 
    }
    if (key == 'a' || key == 'A')
    {
      horiz = horiz - 3;

    }
    if (key == 'd' || key == 'D')
    {
      horiz = horiz + 3;

    }
 
  }

      
