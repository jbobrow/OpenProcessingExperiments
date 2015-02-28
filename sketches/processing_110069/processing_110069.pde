
int base = 30;//base rows x base cols
int bx_size = 30;//square size
int i, j, x, y, flag = 0;//iteration counters
int[][] board = new int[base][base];
int turn = 1;

int players = 2;//-->number of players (MAX 9)
color[] player_color = {#a5edff, #FC5C57};
int[] player_points = new int[players];

void setup(){
  size(base *  bx_size, base * bx_size);
  background(0);
  stroke(210);
  rectMode(CORNER);
  
  for(int i = 0; i< players; i++)
    player_points[i] = 0;
  
  //draw the checkered board
  for(int i = 0; i < base; i++){
    for(int j = 0; j < base; j++){
      rect( bx_size*j,  bx_size*i,  bx_size,  bx_size);
      board[i][j] = 0;
    }
  }
  
}

void draw(){
  i = (int)mouseY/bx_size;
  j = (int)mouseX/bx_size;
  if(board[i][j] == 0)
    cursor(HAND);
  else
    cursor(ARROW);
}

void mouseClicked() {
  fill(player_color[turn-1]);
  i = (int)mouseY/bx_size;
  j = (int)mouseX/bx_size;
  
  //check the turn color
  if(board[i][j] == 0){
    board[i][j] = turn;
    rect( bx_size*j,  bx_size*i,  bx_size,  bx_size);
  }
  
  //check the squares
  fill(0);
  if(i > 1 && j > 1)
  if(board[i-1][j] == turn && board[i-1][j-1] == turn && board[i][j-1] == turn){
    x = j-1;
    y = i-1;
    board[i-1][j] = turn * 10;
    board[i-1][j-1] = turn * 10;
    board[i][j-1] = turn * 10;
    flag = 1;
  }else if(board[i-1][j] == turn && board[i-1][j+1] == turn && board[i][j+1] == turn){
    x = j;
    y = i-1;
    board[i-1][j] = turn * 10;
    board[i-1][j+1] = turn * 10;
    board[i][j+1] = turn * 10;
    flag = 1;
  }else if(board[i+1][j] == turn && board[i+1][j-1] == turn && board[i][j-1] == turn){
    x = j-1;
    y = i;
    board[i+1][j] = turn * 10;
    board[i+1][j-1] = turn * 10;
    board[i][j-1] = turn * 10;
    flag = 1;
  }else if(board[i+1][j] == turn && board[i+1][j+1] == turn && board[i][j+1] == turn){
    x = j;
    y = i;
    board[i+1][j] = turn * 10;
    board[i+1][j+1] = turn * 10;
    board[i][j+1] = turn * 10;
    flag = 1;
  }
  
  if(flag == 1){
    fill(player_color[turn-1]);
    stroke(100);
    rect( bx_size*x,  bx_size*y,  bx_size*2,  bx_size*2);
    line(bx_size*x, bx_size*y, bx_size*x+(bx_size*2), bx_size*y+(bx_size*2));
    player_points[turn-1] ++;
    println("Player "+turn+" "+player_points[turn-1]);
  }
  
  
  flag = 0;
  stroke(210);
  
  //iterate turn
  if(turn < players)
    turn++;
  else
    turn = 1;
}
