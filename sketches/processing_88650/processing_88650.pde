
public life[][] world = new life[100][100];
public boolean playing; 
public boolean mouseReleased;
class life
{
  int locX;
  int locY;
  boolean alive;
  int neighbors = 0;
  
  void updateNeighbors()
  {
        neighbors = 0;
        if(world[locX + 1][locY].alive)
        {
          neighbors++;
        }
        if(world[locX][locY + 1].alive)
        {
          neighbors++;
        }
        if(world[locX - 1][locY].alive)
        {
          neighbors++;
        }
        if(world[locX][locY - 1].alive)
        {
          neighbors++;
        }
        if(world[locX + 1][locY + 1].alive)
        {
          neighbors++;
        }
        if(world[locX -1 ][locY - 1].alive)
        {
          neighbors++;
        }
        if(world[locX + 1][locY - 1].alive)
        {
          neighbors++;
        }
        if(world[locX - 1][locY + 1].alive)
        {
          neighbors++;
        }
  }
  void updateDraw()
  {
        if(playing)
        {
          if(neighbors < 2)
          {
            alive = false;
          }else if(neighbors < 4 && alive)
          {
            alive = true;
          }else if(neighbors == 3 && !alive)
          {
            alive = true;
          }else if(neighbors > 3)
          {
            alive = false;
          }
        }
        if(alive)
        {
          fill(255);
          rect(locX*6,locY*6,6,6);
        }
        
  }
}



void setup()
{
  size(600,600);
   for(int i = 0; i <100; i++)
    {
       for(int j = 0; j <100; j++)
         {
             world[i][j] = new life();
             world[i][j].locX = i;
             world[i][j].locY = j;
         }
    }
    
    world[18][50].alive = true;
    world[19][50].alive = true;
    world[18][51].alive = true;
    world[19][51].alive = true;
    
     world[28][50].alive = true;
     world[28][51].alive = true;
     world[28][52].alive = true;
     world[29][49].alive = true;
     world[29][53].alive = true;
     world[30][48].alive = true;
     world[31][48].alive = true;
     world[30][54].alive = true;
     world[31][54].alive = true;
     
     world[32][51].alive = true;
     
     world[34][51].alive = true;
     world[35][51].alive = true;
     world[33][49].alive = true;
     world[33][53].alive = true;
     world[34][50].alive = true;
     world[34][52].alive = true;
     
     world[38][50].alive = true;
     world[38][49].alive = true;
     world[38][48].alive = true;
     
     world[39][50].alive = true;
     world[39][49].alive = true;
     world[39][48].alive = true;
     
     world[40][47].alive = true;
     world[40][51].alive = true;
     
     world[42][47].alive = true;
     world[42][51].alive = true;
     
     world[42][46].alive = true;
     world[42][52].alive = true;
     
    
    
    world[52][49].alive = true;
    world[52][48].alive = true;
    world[53][49].alive = true;
    world[53][48].alive = true;
    
  
}



void draw ()
{
  background(0);

 for(int i = 1; i <99; i++)
    {
       for(int j = 1; j < 99; j++)
         {
             world[i][j].updateNeighbors();
         }
    }
    
    
 for(int i = 1; i <99; i++)
    {
       for(int j = 1; j < 99; j++)
         {
             world[i][j].updateDraw();
         }
    }
    if(mouseReleased && mouseX <35 && mouseY <35)
    {
 
        playing = !playing;
        
    }else if (mousePressed && mouseButton == LEFT)
    {
      world[mouseX/6][mouseY/6].alive = true;
    }else if (mousePressed && mouseButton == RIGHT)
    {
      world[mouseX/6][mouseY/6].alive = false;
    }
    if(playing)
    {
      beginShape();
      vertex(5,5);
      vertex(20,20);
      vertex(5,35);
      endShape();
    }else{
      rect(5,5,10,30);
      rect(25,5,10,30);
      
    }
    mouseReleased = false;
}

void mouseReleased()
{
  mouseReleased = true;
}


