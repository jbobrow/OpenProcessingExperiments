
static final int side = 8;
static final char[][] lookup = makeLookup();

// creates a lookup table mapping rows/columns to their sums
static char[][] makeLookup() {
  char[][] lookup = new char[(int) pow(2, side)][side];
  for(int i = 0; i < lookup.length; i++) {
    char[] bits = new char[side];
    for(int b = 0; b < side; b++)
      bits[b] = (char) ((i & (1 << b)) != 0 ? 1 : 0);
    char[] sum = new char[side];
    for(int b = 0; b < side; b++) {
      sum[b] += bits[b == 0 ? side - 1 : b - 1]; // left
      sum[b] += bits[b]; // center
      sum[b] += bits[b == side - 1 ? 0 : b + 1]; // right
    }
    lookup[i] = sum;
  }
  return lookup;
}

class Game {
  // duplicate data
  boolean[][] board = new boolean[side][side];
   
  Game() {
    for(int x = 0; x < side; x++)
      for(int y = 0; y < side; y++)
        board[x][y] = random(1) > .5;
  }
  
  Game(long game) {
    for(int x = 0; x < side; x++)
      for(int y = 0; y < side; y++)
        board[x][y] = (game & ((long) 1 << (y * side + x))) != 0;
  }
  
  int totalSum;
  void step() {
    // make rows for lookup
    char[] rows = new char[side];
    for(int x = 0; x < side; x++)
      for(int y = 0; y < side; y++)
        if(board[x][y])
          rows[y] |= 1 << x;
      
    // lookup sums for rows
    char[][] rowSums = new char[side][side];
    for(int i = 0; i < side; i++)
      rowSums[i] = lookup[rows[i]];
        
    // recalculate life
    char curSum;
    boolean cur;
    totalSum = 0;
    for(int x = 0; x < side; x++) {
      for(int y = 0; y < side; y++) {
        curSum = rowSums[y == 0 ? side - 1 : y - 1][x];
        curSum += rowSums[y][x];
        curSum += rowSums[y == side - 1 ? 0 : y + 1][x];
        cur = board[x][y];
        if(cur) {
          // self is counted, so 3/4 instead of 2/3
          if(curSum < 3 || curSum > 4)
            board[x][y] = false;
        } else {
          if(curSum == 3)
            board[x][y] = true;
        }
        totalSum += curSum; // non-essential
      }
    }
  }
  
  int size() {
    int size = 0;
    for(int x = 0; x < side; x++)
      for(int y = 0; y < side; y++)
        if(board[x][y])
          size++;
    return size;
  }
   
  void draw(float rectSize) {
    for(int x = 0; x < side; x++)
      for(int y = 0; y < side; y++)
        if(board[x][y])
          rect(rectSize * x, rectSize * y, rectSize, rectSize);
  }
}

