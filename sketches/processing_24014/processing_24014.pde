
class Cell
{
  int x,y,cellSize,xCells,yCells;
  boolean disable = false;
  boolean stranded = false;
  boolean passage = false;
  boolean start = false;
  boolean end = false;
  Cell[][] maze;
  Cell( int x, int y, int xCells, int yCells, int cellSize, Cell[][] maze )
  {
    this.maze = maze;
    this.x = x;
    this.y = y;
    this.xCells = xCells;
    this.yCells = yCells;
    this.cellSize = cellSize;
  }

  void setStart()
  {
    start = true;
    passage = true;
  }
  void setEnd()
  {
    end = true;
    passage = true;
  }

  void drawLines(int passageWidth)
  {
    stroke( 255 );
    strokeWeight( 3 );
    //vertical lines
    if( x < xCells - 1 )
      if( ! maze[x+1][y].passage )
        line( x * passageWidth + passageWidth, y * passageWidth, x * passageWidth + passageWidth, y * passageWidth + passageWidth );

    if( x > 0 )
      if( !maze[x-1][y].passage )
        line( x * passageWidth, y * passageWidth, x * passageWidth, y * passageWidth + passageWidth );

    //horizontal lines
    if( y > 0 )
      if( !maze[x][y-1].passage )
        line( x * passageWidth, y * passageWidth, x * passageWidth + passageWidth, y * passageWidth );
    if( y < yCells - 1 )
      if(! maze[x][y+1].passage )
        line( x * passageWidth, y * passageWidth + passageWidth, x * passageWidth + passageWidth, y * passageWidth + passageWidth );


    if( x == 0 )
      line( 0, y * passageWidth, 0, y* passageWidth + passageWidth );
    if( y == 0 )
      line( x * passageWidth, 0, x * passageWidth + passageWidth, 0 );

    if( x == xCells -1 )
      line( x * passageWidth + passageWidth, y * passageWidth, x*passageWidth + passageWidth, y* passageWidth + passageWidth );
    if( y == yCells - 1 )
      line( x * passageWidth, y * passageWidth + passageWidth, x * passageWidth + passageWidth, y * passageWidth + passageWidth );
  }


  ArrayList getAllNeighbours()
  {
    ArrayList neighbours = new ArrayList();
    if( x < xCells - 1 )
      neighbours.add(maze[x+1][y]);
    if( x > 0 )
      neighbours.add( maze[x-1][y]);
    if( y > 0 )
      neighbours.add(maze[x][y-1]);
    if( y < yCells - 1 )
      neighbours.add( maze[x][y+1]);  
    return neighbours;
  }
  ArrayList getPassageNeighbours()
  {
    ArrayList neighbours = new ArrayList();
    if( x < xCells - 1 )
      if( maze[x+1][y].passage )
        neighbours.add(maze[x+1][y]);
    if( x > 0 )
      if( maze[x-1][y].passage )
        neighbours.add( maze[x-1][y]);
    if( y > 0 )
      if( maze[x][y-1].passage )
        neighbours.add(maze[x][y-1]);
    if( y < yCells - 1 )
      if( maze[x][y+1].passage )
        neighbours.add( maze[x][y+1]);      


    return neighbours;
  }
  boolean isNeighbourPassage( String dir )
  {
    if( dir.contentEquals( "LEFT" ) )
     if( x > 0 )
       if( maze[x-1][y].passage )
         return true;
    if( dir.contentEquals( "RIGHT" ) )
      if( x < xCells - 1 )
        if( maze[x+1][y].passage )
          return true;
    
    if( dir.contentEquals( "TOP" ) )
      if( y > 0 )
        if( maze[x][y-1].passage )
          return true;
    if( dir.contentEquals( "BOTTOM" ) )
      if( y < yCells - 1 )
        if( maze[x][y+1].passage )
          return true;
    return false;
  }

  void disable()
  {
    disable = true;
  }
  boolean mouseInside(int mx, int my )
  {
       if( isSpecial() )
     return false;
     
    if( mx > x*cellSize && mx < x*cellSize+cellSize && my > y*cellSize && my < y * cellSize + cellSize )
       return true;
    return false;
  }
  
  boolean isSpecial()
  {
    if( start)
      return true;
    if( end)
      return true;
    if( disable )
      return true; 
      return false;
  }
  void toggle()
  {
    //can't toggle start or end spots
   if( isSpecial() )
     return;
      
    if( passage == true )
      passage = false;
    else
      passage = true;
  }
  boolean isEdge()
  {
    if( x == 0 || x == xCells -1 )
      return true;
    if( y == 0 || y == yCells - 1 )
      return true;
    return false;
  } 


  void highLight()
  {
    if( passage )
      fill( 0 );
    else
      fill( 255 );
    rect(x*cellSize,y*cellSize,cellSize,cellSize);
  }
  void drawOutline()
  {
    if( disable )
      return;
    noFill();
    if( passage )
    {
      //  println( "tru" + x + ":" + y );
      fill( 255 );
    }
    if( start )
      fill( color( 0,0, 255 ));

    if( end)
      fill( color( 0,0, 255 ) );

    if( stranded )
      fill( color( 0,0,255 ));

    strokeWeight( 1 );
    stroke( 255 );
    rect(x*cellSize,y*cellSize,cellSize,cellSize);
  }
}


