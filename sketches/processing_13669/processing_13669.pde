


void calcPixel(int row, int col){
  cVec temp = coords[row][col];
  for(int i = 0; i < maxIterations; i++){
    temp = temp.square().sum(c);
    if(temp.getMag() > blowup){
      i = maxIterations;
      //break;
    } else {
      scene[row][col] = i;
    }
  }
  //println(scene[row][col]);
}

void makeMatrix(){
  for(int currentRow = 0; currentRow < rows; currentRow++){
      for(int currentCol = 0; currentCol < cols; currentCol++){
        calcPixel(currentRow,currentCol);
      }
  } 
}

void drawMatrix(){
  for(int currentRow = 0; currentRow < rows; currentRow++){
      for(int currentCol = 0; currentCol < cols; currentCol++){
        stroke(colours[(scene[currentRow][currentCol]+(frameCount*10))%maxIterations]);
        point(currentCol,currentRow);
      }
      //println("row "+currentRow+" done");
  }
}

void saveScreen(){
  saveFrame("c="+c.getReal()+","+c.getComplex()+"_###.jpg");
}

