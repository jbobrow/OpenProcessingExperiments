

int w = 20;
int h = 20;
int res = 20;

PFont visitor;
int[][] board;
int x_loc, y_loc, x_pel, y_pel, speed, curFrame, leng, score, score_inc, direction;
boolean gameover;

void setup()
{
  size(w * res, h * res);
  
  visitor = loadFont("VisitorTT2BRK-48.vlw");
  board = new int[w][h];
  
  in();
}

void in()
{
  background(0);
  
  x_loc = 0;
  y_loc = 0;
  
  speed = 5;
  
  curFrame = 0;
  
  leng = 3;
  
  score = 0;
  score_inc = 5;
  
  direction = 1;
  
  gameover = false;
  
  for(int i = 0; i < w; i++)
  {
    for(int u = 0; u < h; u++)
    {
      board[i][u] = 0;
    }
  }
  
  fill(255);
  noStroke();
  
  x_pel = round(random(w - 2)) + 1;
  y_pel = round(random(h - 2)) + 1;
  
  rect(x_loc, y_loc, res, res);
}

void draw()
{
  if(!gameover)
  {
    if(curFrame == speed)
    {
      background(0);
      
      switch(direction)
      {
        case 0:
          y_loc -= 1;
          break;
        case 1:
          x_loc += 1;
          break;
        case 2:
          y_loc += 1;
          break;
        case 3:
          x_loc -= 1;
          break;
        default:
          println("no direction");
          break;
      }
      
      
      for(int i = 0; i < w; i++)
      {
        for(int u = 0; u < h; u++)
        {
          if(board[i][u] > 0)
            board[i][u]--;
        }
      }
      
      if(x_loc >= 0 && x_loc < w && y_loc >= 0 && y_loc < h && board[x_loc][y_loc] == 0)
        board[x_loc][y_loc] = leng;
      else
        gameover = true;
        
      if(x_loc == x_pel && y_loc == y_pel)
      {
         leng++;
         score += score_inc;
  
          x_pel = round(random(w - 2)) + 1;
          y_pel = round(random(h - 2)) + 1;
      }
      
      curFrame = 0;
    
      
      for(int i = 0; i < w; i++)
      {
        for(int u = 0; u < h; u++)
        {
          if(board[i][u] > 0)
            rect(i * res, u * res, res, res);
        }
      }
      
      rect(x_pel * res, y_pel * res, res, res);
    
      textAlign(RIGHT);
      fill(255);
      textFont(visitor, 35);
      text(score, w * res - 5, 20);
    }
    
    curFrame++;
  }else{
    background(0);
    textAlign(CENTER);
    fill(255);
    textFont(visitor, 48);
    text("- GAME OVER -", w * res / 2, h * res / 2);
    textAlign(RIGHT);
    textFont(visitor, 35);
    text(score, w * res - 5, 20);
  }
}

void keyPressed()
{
  switch(keyCode)
  {
    case UP:
      if(direction != 2)
        direction = 0;
      break;
    case DOWN:
      if(direction != 0)
        direction = 2;
      break;
    case LEFT:
      if(direction != 1)
        direction = 3;
      break;
    case RIGHT:
      if(direction != 3)
        direction = 1;
      break;
  }
}

void mousePressed()
{
  println("pressed");
  if(gameover)
  {
    in();
  }
}

