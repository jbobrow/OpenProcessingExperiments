
ArrayList walls;
PFont f;
int x = 450;
int y = 450;

boolean moveLeft = true;
boolean moveRight = true;
boolean moveUp = true;
boolean moveDown = true;

public void setup()
{
  size(500, 500);
  f = createFont("Times New Roman", 16, true);

  walls = new ArrayList();
  walls.add(new Wall(50, 50, 500, 50) );
  walls.add(new Wall(0, 150, 400, 500) );
}

public void draw()
{
  println(x + "," + y);
  if (x == 0 && y == 50)
  {
    textFont(f, 30);
    background(0);
    fill(255);
    textAlign(CENTER);
    text("CONGRATULATIONS, YOU WIN! :)", 250, 250);
    textFont(f, 20);
    text("Click R to restart", 250, 400);
  }
  else
  {
    textFont(f, 50);
    background(255);

    //Title
    fill(0);
    text("The Maze Game", 75, 40);
    line(0, 50, 500, 50); //top border

    //Walls
    for (int i = walls.size()-1; i>=0; i--)
    {
      Wall w = (Wall) walls.get(i);
      w.display();
    }

    textFont(f, 16);
    //Start Post
    text("START", 451, 478);
    rect(450, 450, 50, 50); 
    //Goal Post
    text("GOAL", 4, 80);
    rect(0, 50, 50, 50); 

    //Object
    fill(#5CE4EA);
    rect(x, y, 50, 50);
    noFill();
    
    canMove();
  }
  if (key == 'r') //restart button
  {
    x = 450;
    y = 450;
  }
}

public void canMove()
{
  if(x>0 && y==100)
  {
    moveUp = false;
  }
  else
  {
    moveUp = true;
  }
  
  if(x<400 && y==100 )
  {
    moveDown = false;
  }
  else
  {
    moveDown = true;
  }
  
  if(x==400 && y>=105)
  {
    moveLeft = false;
  }
  else
  {
    moveLeft = true;
  }
  
  if(x>=0 && y<100)
  {
    moveRight = false;
  }
  else
  {
    moveRight = true;
  }
}

public void keyPressed()
{
  //if ( !((x<400 && y>100) || (x>0 && y<100)) )
  {
    if ( keyCode == UP && y>50 && moveUp ) 
    {
      y-=5;
    }
    if ( keyCode == DOWN && (y+50)<height && moveDown )
    {
      y+=5;
    }
    if ( keyCode == LEFT && x>0 && moveLeft )
    {
      x-=5;
    }
    if ( keyCode == RIGHT && (x+50)<width && moveRight )
    {
      x+=5;
    }
  }
}


