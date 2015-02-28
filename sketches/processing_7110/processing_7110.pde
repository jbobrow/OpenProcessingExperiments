
void resetCells(){
  for(int i = 0; i<num; i++){
    for(int j = 0; j<num; j++){
      celulas[i][j] = false;
      celulasNext[i][j] = false;
    }
  }
}

void changeCells(int xOf, int yOf){
  int oft = 50;
  for(int i = 0; i < 200; i+=xOf){
    for(int j = 0; j < 200; j+=yOf){
      celulas[i+oft][j+oft] = true;
    }
  }
}

