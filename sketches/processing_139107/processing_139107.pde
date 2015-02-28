
PImage openPic;
PImage missPic;
PImage hitPic;

int EMPTY_NO_BOAT = 0;
int EMPTY_HAS_BOAT = 1;
int PEGGED_NO_BOAT = 2;
int PEGGED_HAS_BOAT = 3;

int[][]player1Board =
{
  {0, 0, 0, 0, 0},
  {0, 1, 0, 0, 1},
  {0, 1, 0, 0, 1},
  {1, 0, 0, 0, 0},
  {1, 0, 0, 1, 0},
};

void setup()
{
  size(500, 500);
  openPic = requestImage("OPEN.jpg");
  missPic = requestImage("MISS.jpg");
  hitPic = requestImage("HIT.jpg");
}

void draw()
{
  for (int row = 0; row < player1Board.length; row++)
  {
    for (int col = 0; col < player1Board.length; col++)
    {
      // empty 
      if (player1Board[row][col] == EMPTY_NO_BOAT || player1Board[row][col] == EMPTY_HAS_BOAT)
      {
        noFill();
      }
      // white
      if (player1Board[row][col] == PEGGED_NO_BOAT)
      {
        fill(15, 170, 183);
      }
      // red
      if (player1Board[row][col] == PEGGED_HAS_BOAT)
      {
        fill(255, 0, 0);
      }
      
      int cellWidth = (width / player1Board[row].length);
      int cellHeight = (height / player1Board.length);
      rect(col * cellWidth, row * cellHeight, cellWidth, cellHeight);
    }
  }
}

void mouseReleased()
{
  int numRows = player1Board.length;
  int numCols = player1Board[0].length;
  
  // convert mouse coordinates to grid coordinates
  int col = floor((float)mouseX / (float)width * numCols);
  int row = floor((float)mouseY / (float)height * numRows);
  
  if (player1Board[row][col] == EMPTY_NO_BOAT)
  {
    player1Board[row][col] = PEGGED_NO_BOAT;
  }
  if (player1Board[row][col] == EMPTY_HAS_BOAT)
  {
    player1Board[row][col] = PEGGED_HAS_BOAT;
  }
}
    


