
class Canvas{
  
  int h;
  int w;
  int cellSize;
  int squareSize; 
  
  Grid grid;
  
  Canvas( Grid grid, int squareSize ){
    this.grid = grid;      
    this.squareSize = squareSize;
    
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
    for (int i = 0; i < grid.rows; i++ ) {      
      for (int j = 0; j < grid.columns; j++ ) {         
        renderCell( this.grid.cells[i][j] );
      }      
    }
    
   

  }
  
  void renderCell( Cell cell ){
   
    stroke(color(150,100,50));
    fill(color(150,100,50));
    pushMatrix();
    translate( cell.x*cellSize, cell.y*cellSize, cell.chips);
    if( ui.mouseOverCell == cell ){
     fill(color(100,100,150));
     box(5); 
    }
     else{
       point(0,0,0);
     }
    popMatrix();
  }
  
  
}

