
int horiz = 300;
int verti = 300;;

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
  fill(225);
  ellipse(horiz,verti,150,150);
  fill(0);
  ellipse(horiz,verti,10,10);



 
  
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

