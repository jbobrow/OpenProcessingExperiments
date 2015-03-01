
final int ROW = 32;
final int COL = 32;

int[][] brightness;

void setup(){
  size(800, 800);
  brightness = new int[ROW][COL];
  for(int i = 0; i < ROW; i++){
    for(int j = 0; j < COL; j++){
      brightness[i][j] = 0;
    }
  }
}

void draw(){
  background(0);
  for(int i = 0; i < ROW; i++){
    for(int j = 0; j < COL; j++){
      drawTile(i, j);
    }
  }
}

void mouseClicked(){
  for(int i = 0; i < ROW; i++){
    for(int j = 0; j < COL; j++){
      if(isMouseOver(i, j)){
        if(brightness[i][j] == 0){
          brightness[i][j] = (int)random(50, 255);
        }else{
          brightness[i][j] = 0;
        }
      }
    }
  }
}

int x1(int r, int c){
  return c * (width / COL);
}

int y1(int r, int c){
  return r * (height / ROW);
}

int x2(int r, int c){
  return (c + 1) * (width / COL);
}

int y2(int r, int c){
  return (r + 1) * (height / ROW);
}

boolean isMouseOver(int r, int c){
  if(x1(r, c) <= mouseX && mouseX <= x2(r, c) && y1(r, c) <= mouseY && mouseY <= y2(r, c)){
    return true;
  }else{
    return false;
  }
}

void drawTile(int r, int c){
  fill(brightness[r][c]);
  rect(x1(r, c), y1(r, c), x2(r, c) - x1(r, c), y2(r, c) - y1(r, c));
}


