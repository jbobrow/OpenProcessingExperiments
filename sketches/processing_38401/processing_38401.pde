
//This contains all of the glider classes

void Glider() {
  int x = mouseX/(cellSize);
  int y = mouseY/(cellSize);
  for (int i =y; i<y+3; i ++) {
    cells[x][i] = true;
  }
  cells[x-1][y+2] = true;
  cells[x-2][y+1] = true;
}

void Beacon() {
  int x = mouseX/(cellSize);
  int y = mouseY/(cellSize);
  cells[x][y] = true;
  cells[x][y+1] = true;
  cells[x+1][y] = true;
  cells[x+3][y+2] = true;
  cells[x+3][y+3] = true;
  cells[x+2][y+3] = true;
}

void Toad() {
  int x = mouseX/(cellSize);
  int y = mouseY/(cellSize);
  for(int i =0; i < 3; i ++) {
    cells[x+i+1][y] = true;
    cells[x+i][y+1] = true;
  }
}


void Pulsar() {
  int x = mouseX/(cellSize);
  int y = mouseY/(cellSize);

  for(int i =0; i < 9; i ++) {
    if(i ==3) {
      i+=3;
    }
    cells[x][y+i+2] = true;
    cells[x+5][y+i+2] = true;
    cells[x+7][y+i+2] = true;
    cells[x+12][y+i+2] = true;

  }
  
   for(int i =0; i < 9; i ++) {
    if(i ==3) {
      i+=3;
    }
    
    cells[x+i+2][y] = true;
    
    cells[x+i+2][y+5] = true;
    cells[x+i+2][y+7] = true;
    cells[x+i+2][y+12] = true;

  }
}

