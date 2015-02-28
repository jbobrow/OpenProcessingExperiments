
int timesH = 25; //changes the number of columns of circles
int timesV = 25; //changes the number of rows of circles

int move = 20; //changes amount of space between each circle

int x = 0; //changes the central x location of pattern
int y = 0; // changes the central y location of pattern



void setup()
{
  background(200);
  size(750,750);
  ellipseMode(CENTER);
  noFill();
  x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
}

void keyPressed()
{
  if (key == 'z') // increases space between circles
  {
  move = move+1;
   x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
  }
   if (key == 'x') // decreases space between circles
  {
  move = move-1;
   x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
  }
  if (key == CODED)
  {
    if (keyCode == DOWN) // decreases number of rows
    {
      timesV = timesV-1;
     x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
    }
    else if (keyCode == UP) //increases number of rows
    {
      timesV = timesV+1;
           x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
    }
    else if (keyCode == LEFT) //decreases number of columns
    {
      timesH = timesH-1;
          x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
    }
    else if (keyCode == RIGHT) //increases number of columns
    {
      timesH = timesH+1;
          x = (width/2)-((timesH*move)/2);
  y = (height/2)+((timesV*move)/2);
    }
  }
}

void draw()
{
  background(200);
  for(int i=0;i<timesH;i++)
  {
    x = x+move;
    ellipse(x,y,mouseX,mouseY);  
  }
  
  for(int i=0;i<timesV;i++)
  {
    y = y-move;
    ellipse(x,y,mouseX,mouseY);  
  }
   
  for(int i=0;i<timesH;i++)
  {
    x = x-move;
    ellipse(x,y,mouseX,mouseY);  
  }
   
 for(int i=0;i<timesV;i++)
  {
    y = y+move;
    ellipse(x,y,mouseX,mouseY);  
  }
   
}
















































































