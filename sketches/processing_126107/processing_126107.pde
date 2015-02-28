
int[][] board;
int playerX = 3;
int playerY = 15;

int blockSize = 20;
int sx;
int sy;

int score = 0;
int rounds = 0;

long lastUpdate = 0;
int frequency = 4000;

void setup(){
  size(400, 415);
  sx = width / blockSize;
  sy = width / blockSize;
  board = new int[sx][sy];
  
  scrambleBoard();
  
  textAlign(LEFT, TOP);
}

void draw(){
  background(200);
  noStroke();
  for(int i = 0; i < board.length; i++){
    for(int j=0; j < board[i].length; j++){
      int count = neighbors(i, j);
      switch(board[i][j]){
        case 0: fill(200); break;
        case 1: fill(205, 0, 0); break;
        case 2: if(count == 1){
          fill(100);
        }else{
          fill(0);
        }
        break;
        default: fill(255); break;
      }
      rect(i*blockSize, j*blockSize+15, blockSize, blockSize);
      if(board[i][j] == 2){
        fill(255);
        text(count, i*blockSize+5, j*blockSize+17);
      }      
    }
  }

  fill(0);
  text("Score: " + score + " Rounds: " + rounds, 0, 0);
  
  if(millis() - frequency > lastUpdate){
    runLife();
    lastUpdate = millis();
    rounds++;
  }
}

void moveVertical(int direction){
  if(playerY + direction >= 0 && playerY + direction < board.length){
    if(board[playerX][playerY+direction] == 0){
      board[playerX][playerY] = 0;
      playerY += direction;
      board[playerX][playerY] = 1;
    }
    else if(board[playerX][playerY+direction] == 2){
      if(neighbors(playerX, playerY+direction) == 1){
        board[playerX][playerY + direction]= 1;
        board[playerX][playerY] = 0;
        playerY += direction;
        score++;
      }else if(playerY + (direction*2) >= 0 &&  playerY + (direction*2) < board.length && board[playerX][playerY+(direction*2)] == 0){
        board[playerX][playerY + direction*2] = 2;
        board[playerX][playerY + direction]= 1;
        board[playerX][playerY] = 0;
        playerY += direction;
      }
    }
  }
}

void moveHorizontal(int direction){
  if(playerX + direction >= 0 && playerX+ direction < board[0].length){
    if(board[playerX+direction][playerY] == 0){
      board[playerX][playerY] = 0;
      playerX += direction;
      board[playerX][playerY] = 1;
    }
    else if(board[playerX+direction][playerY] == 2){
      if(neighbors(playerX+direction, playerY) == 1){
        board[playerX + direction][playerY]= 1;
        board[playerX][playerY] = 0;
        playerX += direction;
        score++;
      }else if(playerX + (direction*2) >= 0 &&  playerX + (direction*2) < board[0].length && board[playerX+(direction*2)][playerY] == 0){
        board[playerX + direction*2][playerY] = 2;
        board[playerX + direction][playerY]= 1;
        board[playerX][playerY] = 0;
        playerX += direction;
      }
    }
  }
}

void keyPressed(){
  switch(key){
    case 'w': moveVertical(-1);
      break;
    case 's': moveVertical(1);
      break;
    case 'd': moveHorizontal(1);
      break;
    case 'a': moveHorizontal(-1);
      break;
    case 'r': score = 0;
      rounds = 0;
      scrambleBoard();
      break;
    default: break;
  }
}

void scrambleBoard(){
  for(int i = 0; i < board.length; i++){
    for(int j=0; j < board[i].length; j++){
      if(random(1) < .5){ 
        board[i][j] = 0;
      }else{
        board[i][j] = 2;
      }
    }
  }
  board[playerX][playerY] = 1;
  lastUpdate = millis();
}

void runLife(){
  int[][] newBoard = new int[sx][sy];
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) {
     int count = neighbors(x, y); 
     if(board[x][y] == 0){ 
        if (count == 3) { 
          newBoard[x][y] = 2;
        } else {
          newBoard[x][y] = 0;
        } 
      } else if (board[x][y] == 2){
        if(count == 2 || count == 3){
          newBoard[x][y] = 2;
        } else {
          newBoard[x][y] = 0;
        }
      }
      else {
        newBoard[x][y] = 1;
    } 
   }
  }
  board = newBoard;
}

int isOccupied(int x, int y){
  return board[x][y] == 2 ? 1:0;
}

// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) { 
  return isOccupied((x + 1) % sx, y) + 
         isOccupied(x, (y + 1) % sy) + 
         isOccupied((x + sx - 1) % sx, y) + 
         isOccupied(x, (y + sy - 1) % sy) + 
         isOccupied((x + 1) % sx, (y + 1) % sy) + 
         isOccupied((x + sx - 1) % sx, (y + 1) % sy) + 
         isOccupied((x + sx - 1) % sx, (y + sy - 1) % sy) + 
         isOccupied((x + 1) % sx, (y + sy - 1) % sy); 
}


