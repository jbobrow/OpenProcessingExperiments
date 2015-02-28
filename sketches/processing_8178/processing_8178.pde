
class Canvas{
  
  int h;
  int w;
  int cellSize;
  int canvasHeight; 
  
  Grid grid;
  
  Canvas( Grid grid, int canvasHeight ){
    this.grid = grid;      
    this.canvasHeight = canvasHeight;
    
  }

  private void setDimensions(){
    this.setWidth();
    this.setHeight();
  }
  
  private void setWidth(){
    this.w = this.cellSize * this.grid.columns;
  }
  
  private void setHeight(){
    this.h = this.cellSize * this.grid.rows;    
  }
  
  void setCellSizeInPixels( int cellSize ){
    this.cellSize = cellSize;
  }
  
  void display(){
    fill(255);
    rect(0,0,canvasHeight,width);
   
    
    for (int i = 0; i < grid.rows; i++ ) {
      for (int j = 0; j < grid.columns; j++ ) {   
        renderCell( this.grid.cells[i][j] );       
      }
    }

  }
  
  void renderCell( Cell cell ){
    if( cell.isAlive() ){
      fill(0);
    }
    else{
      fill(255);
    }
    rect(cell.x*cellSize, cell.y*cellSize, cellSize, cellSize );  
  }
  
  void renderCell( Cell cell, int c ){
    fill(c);
    rect(cell.x*cellSize, cell.y*cellSize, cellSize, cellSize );  
  }
  
  
}

