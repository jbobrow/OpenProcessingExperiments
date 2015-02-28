
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
    background(255);
    translate(250,250);
    rotateZ(radians(degs));
    translate(-250,-250);
    for (int i = 0; i < grid.rows; i++ ) {      
      for (int j = 0; j < grid.columns; j++ ) {         
        renderCell( this.grid.cells[i][j] );
      }      
    }
    
   

  }
  
  void renderCell( Cell cell ){
    stroke(0); 
    fill(0);   
     pushMatrix();
    translate( cell.x*cellSize, cell.y*cellSize, cell.chips);
    point(0,0,0);
    popMatrix();
  }
  
  
}

