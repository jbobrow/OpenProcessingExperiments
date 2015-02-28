
int r = 255;
int s = 52;
boolean yellow = false;
int squarex = 0;
int squarey = 0;
float timer = 100;
int cellWidth = 52;
int cellHeight = 52;
int offset = 20;
 
int[][] board =
{
  {0, 0, 0},
  {0, 0, 0},
  {0, 0, 0}
};
 
float[][] redTimers =
{
  {0, 0, 0},
  {0, 0, 0},
  {0, 0, 0}
};
 
void setup(){
  size(200,200);
  frameRate(30);
}
 
void draw(){
  timer += 1 / 30.0;
  if (timer > .4)
  {
    background(255);
   
    yellow = false;
     
    for (int row = 0; row < board.length; row++)
    {
      for (int col = 0; col < board[row].length; col++)
      {
        if ( board[row][col] == 4 )
        {
           fill(255,255,0);
        }
        else if(random(100) > 70 && yellow == false)
        {
          fill(255,255,0);
          board[row][col] = 1;
          yellow = true;
        }
       else {
        fill(0,0,random(255));
        board[row][col] = 0;
       }     
        
        int squarey = offset + row * cellHeight;
        int squarex = offset + col * cellWidth;
        rect(squarex, squarey, cellWidth, cellHeight);
      }
    }
    
    timer = 0;
  }
   
  for (int row = 0; row < board.length; row++)
  {
    for (int col = 0; col < board[row].length; col++)
    {
      if (board[row][col] == 2)
      {
        int squarey = offset + row * cellHeight;
        int squarex = offset + col * cellWidth;
        if (redTimers[row][col] < .3)
        {
          redTimers[row][col] += 1 / 30.0;
          fill(255, 0, 0);
          rect(squarex, squarey, cellWidth, cellHeight);
        }
        else
        {
          fill(0,0,random(255));
          board[row][col] = 0; 
          redTimers[row][col] = 0;
          rect(squarex, squarey, cellWidth, cellHeight);
        }
      }
       
    }
  }
}
 
void mouseReleased(){
  if(mouseX > offset && mouseY > offset && mouseX < width - offset
     && mouseY < height - offset)
  {
    int numRows = board.length;
    int numCols = board[0].length;
   
    // convert mouse coordinates to grid coordinates/index
    int col = floor((float)(mouseX - offset) / (float)(width - (offset * 2)) * numCols);
    int row = floor((float)(mouseY - offset) / (float)(height- (offset * 2)) *  numRows);
     
    int squarey = offset + row * cellHeight;
    int squarex = offset + col * cellWidth;
    int currentSquare = board[row][col];
    if (currentSquare == 0)
    {
      board[row][col] = 2;
    }
    else if (currentSquare == 1)
    {
      board[row][col] = 4;
    }
  }
}

