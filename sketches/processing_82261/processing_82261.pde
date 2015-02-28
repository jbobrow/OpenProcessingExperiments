
class Calculation {
  
  float [] eightneighbor = new float[8];
  int row,col,lowCell;
  
  Calculation(int row_, int col_) {
    row = row_;
    col = col_;
    lowCell=0;
  }

  int findlowestN(int index) {
    Cell cell = (Cell) loc.get(index);
    //check edge cases
    if (cell.cx==0) {
      //first row
    }
    else if (cell.cx==rows-1) {
      //last row
    }
    else if (cell.cy==0) {
      //first col
    }
    else if (cell.cy==cols-1) {
      //last col
    }
    //middle 
    else {
      for (int i=0;i<8;i++) {
        //initialize neighbor cells
        Cell cell_e = (Cell) loc.get(index+1);
        eightneighbor[0]=cell_e.cz;
        Cell cell_w = (Cell) loc.get(index-1);
        eightneighbor[1]=cell_w.cz;
        Cell cell_n = (Cell) loc.get(index-row);
        eightneighbor[2]=cell_w.cz;
        Cell cell_s = (Cell) loc.get(index+row);         
        eightneighbor[3]=cell_s.cz;
        Cell cell_ne = (Cell) loc.get(index-row+col);
        eightneighbor[4]=cell_ne.cz;
        Cell cell_nw = (Cell) loc.get(index-row-col);
        eightneighbor[5]=cell_nw.cz;
        Cell cell_se = (Cell) loc.get(index+row+col);
        eightneighbor[6]=cell_se.cz;
        Cell cell_sw = (Cell) loc.get(index+row-col);
        eightneighbor[7]=cell_sw.cz;
        
        //find lowest
        float accum=eightneighbor[0];
        for(int j=0;j<eightneighbor.length;j++){
          float nht = eightneighbor[j]; 
          if(accum < nht){
            accum=nht;
            lowCell=j;
          }
        }         
      }
    }
    return lowCell;
  }
}


