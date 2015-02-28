
int BOX_W = 50;
int GRID_SIZE = 8;
boolean WHITE = true;
boolean BLACK = false;
int[][] DIR;

class BoardClass
{
  GamePieceClass[][] pieces = new GamePieceClass[GRID_SIZE][GRID_SIZE];
  boolean turn=BLACK;
  boolean isAnimating=false;
  boolean arty_white = true;
  boolean arty_black = false;
  boolean needsUndoing = false;
  PGraphics pg;
  int turns_taken = 0;
  int white_score = 2;
  int black_score = 2;
  int[][] turn_history = new int[GRID_SIZE*GRID_SIZE-4][3];
  PFont uiFont = createFont("Calibri",32);

  BoardClass(){
    pg = createGraphics(width,height);
    
    //set the coordinates of the game pieces
    for (int c=0;c<GRID_SIZE;c++) {
      for (int r=0;r<GRID_SIZE;r++) {
        pieces[c][r] = new GamePieceClass(c, r);
      }
    }
    
    //place the intial four pieces
    pieces[GRID_SIZE/2-1][GRID_SIZE/2-1].place(WHITE);
    pieces[GRID_SIZE/2][GRID_SIZE/2].place(WHITE);
    pieces[GRID_SIZE/2-1][GRID_SIZE/2].place(BLACK);
    pieces[GRID_SIZE/2][GRID_SIZE/2-1].place(BLACK);
    
    //refresh the board image
    refresh_board();
  }

  private int[] pix2grid(int iX,int iY){
    int[] result = {constrain(floor(iX/BOX_W),0,GRID_SIZE-1),constrain(floor(iY/BOX_W),0,GRID_SIZE-1)};
    return result;
  }

  void refresh_board(){
    //println("refresh");
    isAnimating = false;
    pg.beginDraw();
    pg.background(0);
    pg.background(127,0);
    pg.noFill();
    pg.stroke(0,255,0);
    pg.strokeWeight(3);
    if(arty_white){
      pg.ellipse(BOX_W*(GRID_SIZE-1+0.5),BOX_W*(GRID_SIZE+0.5),0.8*BOX_W,0.8*BOX_W);
    }
    if(arty_black){
      pg.ellipse(BOX_W*0.5,BOX_W*(GRID_SIZE+0.5),0.8*BOX_W,0.8*BOX_W);
    }
    pg.stroke(0);
    pg.strokeWeight(1);
    
    //draw the placed pieces
    for (int gX=0;gX<GRID_SIZE;gX++) {
      for (int gY=0;gY<GRID_SIZE;gY++) {
        if(pieces[gX][gY].isPlaced){
          boolean isPieceAnimating = pieces[gX][gY].anim_update();
          isAnimating = (isAnimating || isPieceAnimating);
          pg.fill(pieces[gX][gY].face ? 255 : 0);
          pg.ellipse(BOX_W*(gX+0.5), BOX_W*(gY+0.5), 0.8*BOX_W, 0.8*BOX_W*pieces[gX][gY].height_fraction);
        }
      }
    }
    
    int valid_count=0;
    if(!isAnimating){
      for(int i=0;i<2;i++){ //try at most 2 times to find a valid move
        valid_count = rationalize();
        if(valid_count!=0){
          break;
        }
        turn = !turn;
      }
      //display the score
      pg.beginDraw();
      pg.textFont(uiFont);
      pg.textAlign(CENTER,CENTER);
      pg.fill(255);
      pg.text(str(black_score),BOX_W*0.5,BOX_W*(GRID_SIZE+0.5));
      pg.fill(0);
      pg.text(str(white_score),BOX_W*(GRID_SIZE-1+0.5),BOX_W*(GRID_SIZE+0.5));
      pg.endDraw();
      if(valid_count!=0){ //show the valid moves
        for (int gX=0;gX<GRID_SIZE;gX++) {
          for (int gY=0;gY<GRID_SIZE;gY++) {
            if(pieces[gX][gY].isValidMove()){
              pg.fill(turn ? 255 : 0);
              pg.ellipse(BOX_W*(pieces[gX][gY].gridX+0.5), BOX_W*(pieces[gX][gY].gridY+0.5), 0.2*BOX_W, 0.2*BOX_W);
            }
          }
        }
      }else{ //there are no valid moves for either player
        game_over();
      }
    }
    pg.endDraw();
  }

  int rationalize(){
    //check the whole board and update the valid positions
    //println("rationalize");
    int valid_count = 0;
    int w_score = 0;
    int b_score = 0;
    for(int gX=0;gX<GRID_SIZE;gX++){
      for(int gY=0;gY<GRID_SIZE;gY++){
        if(!pieces[gX][gY].isPlaced){
          pieces[gX][gY].lines = validate_position(gX,gY);
        }else{
          if(pieces[gX][gY].face==WHITE){
            w_score++;
          }else{
            b_score++;
          } 
        }
        valid_count += pieces[gX][gY].isValidMove() ? 1 : 0;
      }
    }
    white_score = w_score;
    black_score = b_score;
    return valid_count;
  }

  int[] validate_position(int gX, int gY){
    int[] lines = new int[DIR.length+1];
    lines[DIR.length] = 0;
    for(int i=0;i<DIR.length;i++){
      lines[i] = valid_line(gX,gY,i);
      lines[DIR.length]+=lines[i];
    }
    return lines;
  }

  int valid_line(int gX,int gY,int i){
    int nX = gX+DIR[i][X];
    int nY = gY+DIR[i][Y];
    int count = 0;
    //walk down
    while(nX>=0 && nX<GRID_SIZE && nY>=0 && nY<GRID_SIZE && pieces[nX][nY].isPlaced){
      if(pieces[nX][nY].face != turn){
        count++;
      }else{
        return count;
      }
      nX += DIR[i][X];
      nY += DIR[i][Y]; 
    }
    return 0;
  }

  void flip_lines(GamePieceClass P){
    //println("flip_lines");
    for(int i=0;i<DIR.length;i++){
      for(int j=1;j<=P.lines[i];j++){
        pieces[P.gridX+j*DIR[i][X]][P.gridY+j*DIR[i][Y]].flip();
      }
    }
  }

  void play_piece(int gX, int gY){
    //println("play_piece");
    if(pieces[gX][gY].isValidMove() && !isAnimating){
      pieces[gX][gY].place(turn);
      flip_lines(pieces[gX][gY]);
      turn_history[turns_taken][X] = gX;
      turn_history[turns_taken][Y] = gY;
      turn_history[turns_taken][2] = turn ? 1 : 0;
      turns_taken++;
      turn = !turn;
      refresh_board();
      
    }
  }

  int[] greedy_arty(){
    //println("greedy_arty");
    int[] G = new int[2];
    int max_value = 0;
    for(int gX=0;gX<GRID_SIZE;gX++){
      for(int gY=0;gY<GRID_SIZE;gY++){
        if(pieces[gX][gY].isValidMove()){
          if(pieces[gX][gY].lines[DIR.length]>max_value){
            max_value = pieces[gX][gY].lines[DIR.length];
            G[X] = gX;
            G[Y] = gY;
          }
        }
      }
    }
    return G;
  }

  void game_over(){
    //println("game_over");
    int text_size = 32;
    int text_lead = 10;
    String message = "";
    if(white_score>black_score){
      message+="WHITE WINS";
    }else if(black_score>white_score){
      message+="BLACK WINS";
    }else{
      message+="IT'S A TIE";
    }
    message = message+"\n"+str(white_score)+" TO "+str(black_score);
    //PFont uiFont = createFont("Calibri",text_size);
    pg.beginDraw();
    pg.fill(255,0,0);
    pg.stroke(0);
    pg.rectMode(CENTER);
    pg.textFont(uiFont);
    pg.textSize(text_size);
    pg.textLeading(text_size+text_lead);
    pg.textAlign(CENTER,CENTER);
    pg.rect(width/2,height/2,pg.textWidth(message)+20,2*text_size+text_lead+20,20);
    pg.fill(0);
    pg.text(message,width/2,height/2);
    pg.endDraw();
  }

  void undo(){
    //println("undo");
    if(turns_taken>0){
      turns_taken--;
      flip_lines(pieces[turn_history[turns_taken][X]][turn_history[turns_taken][Y]]);
      pieces[turn_history[turns_taken][X]][turn_history[turns_taken][Y]].isPlaced = false;
      turn = (turn_history[turns_taken][2]==1);
      if((arty_white && turn==WHITE) || (arty_black && turn==BLACK)){
        needsUndoing = true;
      }else{
        needsUndoing = false;
      }
      refresh_board();
    }
  }

  void reset(){
    for(int gX=0;gX<GRID_SIZE;gX++){
      for(int gY=0;gY<GRID_SIZE;gY++){
        pieces[gX][gY].isPlaced = false;
      }
    }
    pieces[GRID_SIZE/2-1][GRID_SIZE/2-1].place(WHITE);
    pieces[GRID_SIZE/2][GRID_SIZE/2].place(WHITE);
    pieces[GRID_SIZE/2-1][GRID_SIZE/2].place(BLACK);
    pieces[GRID_SIZE/2][GRID_SIZE/2-1].place(BLACK);
    refresh_board();
  }

  void mouse_clicked(){
    if(mouseY<(BOX_W*GRID_SIZE)){
      int[] coords = pix2grid(mouseX,mouseY);
      play_piece(coords[X],coords[Y]);
    }else{
      int gX = floor(mouseX/BOX_W);
      if(gX==0){
        arty_black = !arty_black;
        refresh_board();
      }else if(gX==GRID_SIZE-1){
        arty_white = !arty_white;
        refresh_board();
      }
    }
  }

  void display() {
    if(isAnimating){
      refresh_board();
      image(pg,0,0);
    }else{
      image(pg,0,0);
      if((arty_white && turn==WHITE) || (arty_black && turn==BLACK)){
        if(needsUndoing){
          //println("undoing again");
          undo();
        }else{
          //println("artys_turn");
          int[] G = greedy_arty();
          play_piece(G[X],G[Y]);
        }
      }
    }
  }
}

class GamePieceClass
{
  int gridX;
  int gridY;
  int[] lines = new int[DIR.length+1];
  float height_fraction = 1.0;
  int animationLength = 500;
  int animationStart = -animationLength;
  boolean face;
  boolean isPlaced = false;
  boolean isClosing = true;

  GamePieceClass(int iX, int iY) {

    gridX = iX;
    gridY = iY;
    lines[DIR.length] = 0;
  }

  boolean anim_update(){
    int timePassed = millis() - animationStart;
    if(timePassed<animationLength*0.5){
      height_fraction = (1.0-timePassed/(animationLength*0.5));
      return true;
    }else if(timePassed<animationLength){
      height_fraction = (timePassed/(animationLength*0.5) - 1.0);
      if(isClosing){
        face = !face;
        isClosing = false;
      }
      return true;
    }else{
      height_fraction = 1.0;
      return false;
    }
  }

  boolean isValidMove(){
    return (lines[DIR.length]!=0 && !isPlaced);
  }

  void flip() {
    if (isPlaced) {
      animationStart = millis();
      isClosing = true;
    }
  }

  void place(boolean F){
    if(!isPlaced){
      isPlaced = true;
      face = F;
    }
  }
}

PGraphics felt;
BoardClass board;

void setup() {
  size(BOX_W*GRID_SIZE, BOX_W*(GRID_SIZE+1),P2D);
  frameRate(30);
  smooth();
  int j = 0;
  DIR = new int[8][2];
  for(int dx=-1;dx<=1;dx++){
    for(int dy=-1;dy<=1;dy++){
      if(dx!=0 || dy!=0){
        DIR[j][X] = dx;
        DIR[j][Y] = dy;
        j++;
      }
    }
  }
  felt = createGraphics(width, height);
  felt.beginDraw();
  felt.background(0, 255, 0);
  felt.stroke(0);

  for (int c=1;c<GRID_SIZE;c++) {
    felt.line(c*BOX_W, 0, c*BOX_W, height);
  }
  for (int r=1;r<GRID_SIZE;r++) {
    felt.line(0, r*BOX_W, width, r*BOX_W);
  }
  felt.fill(127);
  felt.rect(0,BOX_W*GRID_SIZE,width,BOX_W);
  felt.fill(0);
  felt.ellipse(BOX_W*0.5,BOX_W*(GRID_SIZE+0.5),0.8*BOX_W,0.8*BOX_W);
  felt.fill(255);
  felt.ellipse(BOX_W*(GRID_SIZE-1+0.5),BOX_W*(GRID_SIZE+0.5),0.8*BOX_W,0.8*BOX_W);
  felt.textAlign(CENTER,CENTER);
  felt.text("<-Click the score to let Greedy Arty play->\nPress 'u' to undo\nPress 'r' to reset",width/2.0,BOX_W*(GRID_SIZE+0.5));
  felt.endDraw();
  board = new BoardClass();
}

void draw() {
  image(felt, 0, 0);
  board.display();
}

void mouseReleased(){
  board.mouse_clicked();
}

void keyReleased(){
  char k = key;
  if(k=='u'){
    board.undo();
  }else if(k=='r'){
    board.reset();
  }
}
