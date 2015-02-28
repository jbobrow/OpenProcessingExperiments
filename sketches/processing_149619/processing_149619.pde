
/* Coloured Life 
 *
 * Coloured Life - Cyclic CA
 *
 * from http://kaytdek.trevorshp.com/projects/computer/neuralNetworks/gameOfLife2.htm
 *
 * "In cyclic cellular automata, an ordering of multiple colors is established.
 *    Whenever a cell is neighbored by a cell whose color is next in the cycle,
 *    it copies that neighbor's color--otherwise, it remains unchanged."
 *
 * Using different levels of thresholding, i.e. enforcing a minimum number of neighbours
 * in the next sequence to qualify cycle increment, this experiment intends to show
 * different behaviours within the cyclic CA system.
 *
 * 
 *
 */

int cellSize = 15;
float cellSpacing = 0.0f;
int gridWidth = 30;
int gridHeight = 30;

Cell [][]cells;

float lastTime;

float MIN_COL_SIZE = 64.f;
float MIN_COL_DISTINCT = 30.f;

boolean blackAndWhiteFlag = false;

boolean doCreateCells = true;
int iterationCounter = 0;

int numCyclicColours = 12;
color []cyclicColours = null;

int minNeighbour = 0;
int maxIterations = 500;

void setup() {
  size( (int)((gridWidth * cellSize * (1.f+cellSpacing))+(cellSize*cellSpacing)), 
  (int)((gridHeight * cellSize * (1.f+cellSpacing))+(cellSize*cellSpacing)) );
  background(0);

  lastTime = (float)millis()/1000.f;
}

Cell trackCell = null;

float WAIT_TIMER_LENGTH = 0.05f;
float waitTimer = WAIT_TIMER_LENGTH;
boolean processNextFrame = false;
boolean change = false;
void draw() {
  
  // time
  float curTime = (float)millis()/1000.f;
  float elapsedTime = curTime - lastTime;
  
  if( doCreateCells ) {
    createCells();
    doCreateCells = false;

  }

  // draw life cells
  if( processNextFrame ) {
    change = false;
  }
  for ( int j = 0 ; j < gridHeight ; j++ ) {
    for ( int i = 0 ; i < gridWidth ; i++ ) {
      cells[j][i].draw( (cellSize*cellSpacing)+(i * (cellSize+(cellSize*cellSpacing))), 
                        (cellSize*cellSpacing)+(j * (cellSize+(cellSize*cellSpacing))), 
                        cellSize );
      if ( processNextFrame ) {
        cells[j][i].nextFrame();
      }
    }
  }
  if ( processNextFrame ) {
    if( !change ) {
      println( "    system is stable / dead, reseting" );
      doCreateCells = true;
    }
    processNextFrame = false;
  }

  // update depending on timer
  waitTimer -= elapsedTime;
  if ( waitTimer <= 0.f ) {
    waitTimer = WAIT_TIMER_LENGTH;
    processNextFrame = true;
  }
  
  iterationCounter++;
  
  // restart simulation if iteration gets over 150
  if( iterationCounter >= maxIterations ) {
    doCreateCells = true;
  } 
  /*
  else if( iterationCounter >= 100 ) {
    if( trackCell != null ) {
      if( iterationCounter % 50 == 0 ) {
        println("maxStilFrames: "+trackCell.maxStillFrames);
      }
      if( trackCell.maxStillFrames < 2 ) {
        // reset
        println("reset due to too fast movement");
        doCreateCells = true;
      }
    }
  }
  */

  // save last time
  lastTime = curTime;
}

void keyPressed() {
  if( key == ' ' ) {
    blackAndWhiteFlag = !blackAndWhiteFlag;
  } else if( key == 'r' || key == 'R' ) {
    doCreateCells = true;
  }
}


void createCells() {
  // first, recreate colour table
  // set random number of colours in table, between 3 and 24
  numCyclicColours = 15 + (int)random(11);
  cyclicColours = createColourTable_better( cyclicColours, numCyclicColours );

  // create
  cells = new Cell[gridHeight][];
  minNeighbour = 1 + (int)  random(2);
  int type = (int)random(10);

  println( "New simulation with "+numCyclicColours+" colour states and min "+minNeighbour+" neighbours, and type "+type );

  for ( int j = 0 ; j < gridHeight ; j++ ) {
    cells[j] = new Cell[gridWidth];
    for ( int i = 0 ; i < gridWidth ; i++ ) {
      //cells[j][i] = (Cell)new LifeCell( (random(1) < 0.5f) ? false : true );
      //cells[j][i] = (Cell)new ColNeighbourCellRnd();
      //cells[j][i] = (Cell)new ColNeighbourSelectedCellRnd( SELECTION_TOP_LEFT + SELECTION_RIGHT );
      //cells[j][i] = (Cell)new ColSizeNeighbourCellRnd();
      //cells[j][i] = (Cell)new LifeCellColor();
      //cells[j][i] = (Cell)new LifeCellColorized();
      //cells[j][i] = (Cell)new LifeCellWithColour( (random(1) < 0.5f) ? false : true );
      /*
      cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i<(gridWidth/2)&&j<(gridHeight/2)) ? 1 : 0)
                                      + ((i>=(gridWidth/2)&&j>=(gridHeight/2)) ? 2 : 0) );
      */
      /*
      cells[j][i] = (Cell)new LifeCellCyclicColour( 1 + 
                                      ((random(1)<0.6)? 0 : 
                                          ((random(1)<0.6)? 1 : 
                                             ((random(1)<0.6? 1 :
                                                ((random(1)<0.6? 1 : 2)))) )) );
      */
      //cells[j][i] = (Cell)new LifeCellCyclicColour( 1 + (int)random(4) );
      //cells[j][i] = (Cell)new LifeCellCyclicColour( minNeighbour );
      switch(type) {
        case 0:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i<(gridWidth/2)&&j<(gridHeight/2)) ? 1 : 0)
                                      + ((i>=(gridWidth/2)&&j>=(gridHeight/2)) ? 1 : 0) );
          break;
        case 1:
          cells[j][i] = (Cell)new LifeCellCyclicColour( minNeighbour );
          break;
        case 2:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 + (int)random(2) );
          break;
        case 3:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i<(gridWidth/2)) ? 1 : 0)
                                      + ((j<(gridHeight/2)) ? 1 : 0) );
          break;
        case 4:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i>(gridWidth/2)) ? 1 : 0)
                                      + ((j>(gridHeight/2)) ? 1 : 0) );
          break;
        case 5:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i<(gridWidth/8)&&i>((gridWidth*6)/8)) ? 1 : 0)
                                      + ((j>((gridHeight*4)/8)&&j<((gridHeight*5)/8)) ? 1 : 0)
                                       );
          break;
        case 6:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 
                                      + ((i>((gridWidth*2)/8)&&i<((gridWidth*3)/8)) ? 1 : 0)
                                      + ((j>((gridHeight*6)/8)&&j<((gridHeight*7)/8)) ? 1 : 0)
                                       );
          break;
        case 7:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 + ((random(2)<0.2)?1:0) );
          break;
        case 8:
          cells[j][i] = (Cell)new LifeCellCyclicColour( 1 + ((random(2)<0.1)?2:0) );
          break;
        default:
          cells[j][i] = (Cell)new LifeCellCyclicColour( minNeighbour );
      }
    }
  }
  // add adjacent cell list for each cell
  for ( int j = 0 ; j < gridHeight ; j++ ) {
    for ( int i = 0 ; i < gridWidth ; i++ ) {
      Cell []adjacent = new Cell[8];
      int idx = 0;
      for ( int k = 0 ; k < 3 ; k++ ) {
        for ( int m = 0 ; m < 3 ; m++ ) {
          // calculate coordinate
          int y = (j+k-1);
          int x = (i+m-1);
          if ( y < 0 ) {
            y += gridHeight;
          } 
          else if ( y >= gridHeight ) {
            y -= gridHeight;
          }
          if ( x < 0 ) {
            x += gridWidth;
          } 
          else if ( x >= gridWidth ) {
            x -= gridWidth;
          }
          // skip middle cell (self)
          if ( !(k == m && k == 1) ) {
            adjacent[idx] = cells[y][x];
            idx++;
          }
        }
      }
      cells[j][i].addAdjacentCells( adjacent );
      //println( "cell "+j+", "+i+", has "+(idx+1)+"adjacent Cells Counted" );
    }
  }
  // pick random cell for test cell
  trackCell = cells[(int)random(cells.length)][(int)random(cells[0].length)];
  // reset iteration counter
  iterationCounter = 0;
}


public class Cell {
  color col;
  boolean doCommitNext = false;
  Cell []adjacentCells = new Cell[8];
  public int maxStillFrames = 0;
  int stillFrames = 0;
  
  Cell() {
    // initiallise self with default values
    col = color(255);
  }
  
  void addAdjacentCells( Cell []_adjacentCells ) {
    adjacentCells = _adjacentCells;
  }
  
  void nextFrame() {
    // modify seld based on adjacent cells
  }
  
  void commitFrame() {
    // actually make changes
  }
  
  void draw( float x, float y, float cellSize ) {
    if( doCommitNext ) {
      doCommitNext = false;
      commitFrame();
      stillFrames = 0;
    } else {
      stillFrames++;
      if( stillFrames > maxStillFrames ) {
        maxStillFrames = stillFrames;
      }
    }
    pushStyle();
      noStroke();
      fill( col );
      rect( x, y, cellSize, cellSize );
    popStyle();
  }
}

class LifeCell extends Cell {
  boolean isAlive, isAliveNext;
  
  LifeCell( boolean state ) {
    // initiallise self with default values
    isAlive = state;
    setColour();
    isAliveNext = false;
  }
  
  void setColour() {
    if( isAlive ) {
      col = color(255);
    } else {
      col = color(0);
    }
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // count alive neighbours
    int aliveNeighbours = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      LifeCell cell = (LifeCell)adjacentCells[i];
      if( cell.isAlive ) {
        aliveNeighbours++;
      }
    }
    // change state depending on neighbours
    if( isAlive ) {
      if( aliveNeighbours < 2 ) {
        isAliveNext = false;
      } else if( aliveNeighbours < 4 ) {
        isAliveNext = true;
      } else {
        isAliveNext = false;
      }
    } else {
      if( aliveNeighbours == 3 ) {
        isAliveNext = true;
      }
    }
    doCommitNext = true;
  }
  
  void commitFrame() {
    isAlive = isAliveNext;
    setColour();
  }
}



class ColNeighbourCellRnd extends Cell {
  color nextCol;
 
  ColNeighbourCellRnd() {
    // initiallise self with default values
    col = color( (int)random(255), (int)random(255), (int)random(255) );
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // average neighbours colours
    float r = 0;
    float g = 0;
    float b = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      r += red(adjacentCells[i].col);
      g += green(adjacentCells[i].col);
      b += blue(adjacentCells[i].col);
    }
    nextCol = color( (int)(r / 8.f), (int)(g / 8.f), (int)(b / 8.f) );
    doCommitNext = true;
  }
  
  void commitFrame() {
    col = nextCol;
  }
}


int SELECTION_TOP_LEFT = 1;
int SELECTION_TOP = 2;
int SELECTION_TOP_RIGHT = 4;
int SELECTION_LEFT = 8;
int SELECTION_RIGHT = 16;
int SELECTION_BOTTOM_LEFT = 32;
int SELECTION_BOTTOM = 64;
int SELECTION_BOTTOM_RIGHT = 128;

class ColNeighbourSelectedCellRnd extends Cell {
  color nextCol;
  int selection;
 
  ColNeighbourSelectedCellRnd( int _selection ) {
    // initiallise self with default values
    col = color( (int)random(255), (int)random(255), (int)random(255) );
    selection = _selection;
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // average neighbours colours
    float r = 0;
    float g = 0;
    float b = 0;
    int numSelected = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      int selectionNum = 1 << i;
      if( (selection & selectionNum) == selectionNum ) {
        //println( "selection Num "+selectionNum);
        r += red(adjacentCells[i].col);
        g += green(adjacentCells[i].col);
        b += blue(adjacentCells[i].col);
        //println( i+"  r:"+r+", g:"+g+", b:"+b);
        numSelected++;
      }
    }
    nextCol = color( (int)(r / (float)numSelected),
                     (int)(g / (float)numSelected),
                     (int)(b / (float)numSelected) );
    //println( "nextCol  r:"+red(nextCol)+", g:"+green(nextCol)+", b:"+blue(nextCol));
    doCommitNext = true;
  }
  
  void commitFrame() {
    col = nextCol;
  }
}


class ColSizeNeighbourCellRnd extends Cell {
  color nextCol;
 
  ColSizeNeighbourCellRnd() {
    // initiallise self with default values
    col = color( (int)random(255), (int)random(255), (int)random(255) );
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // average neighbours colours
    float r = 0;
    float g = 0;
    float b = 0;
    float numCols = 0.f;
    for( int i = 0 ; i < 8 ; i++ ) {
      if( colSize(adjacentCells[i].col) > MIN_COL_SIZE ) {
        numCols += 1.f;
        r += adjacentCells[i].col >> 16 & 0xFF;
        g += adjacentCells[i].col >> 8 & 0xFF;
        b += adjacentCells[i].col & 0xFF;
      }
    }
    if( numCols > 0.f ) {
      nextCol = color( (int)(r / numCols), (int)(g / numCols), (int)(b / numCols) );
      //nextCol = raiseColToMinSize( nextCol, MIN_COL_SIZE );
      if( colDistinct( nextCol, MIN_COL_SIZE, MIN_COL_DISTINCT ) ) {
        doCommitNext = true;
      }
    }
  }
  
  void commitFrame() {
    col = nextCol;
  }
}

float COL_CHANGE = 40.f;
class LifeCellColor extends Cell {
  boolean isAlive;
  color nextCol;
  
  LifeCellColor() {
    // initiallise self with default values
    /*
    col = color( (int)(MIN_COL_SIZE+random(255.F-MIN_COL_SIZE)),
                 (int)(MIN_COL_SIZE+random(255.F-MIN_COL_SIZE)),
                 (int)(MIN_COL_SIZE+random(255.F-MIN_COL_SIZE)) );
     */
    col = color( (int)random(255), (int)random(255), (int)random(255) );
    setAlive();
  }
  
  void setAlive() {
    //isAlive = (strongestColour(col) >= MIN_COL_SIZE);
    isAlive = brightness(col) >= MIN_COL_SIZE;
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // count alive neighbours
    int aliveNeighbours = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      LifeCellColor cell = (LifeCellColor)adjacentCells[i];
      if( cell.isAlive ) {
        aliveNeighbours++;
      }
    }
    // change state depending on neighbours
    boolean isAliveNext = false;
    if( isAlive ) {
      if( aliveNeighbours < 2 ) {
        isAliveNext = false;
      } else if( aliveNeighbours < 4 ) {
        isAliveNext = true;
      } else {
        isAliveNext = false;
      }
    } else {
      if( aliveNeighbours == 3 ) {
        isAliveNext = true;
      }
    }
    if( isAliveNext ) {
      nextCol = changeStrongestColour( col, COL_CHANGE );    
      //nextCol = color(255);
    } else {
      nextCol = changeStrongestColour( col, -COL_CHANGE );
      //nextCol = color(0);
    }
    doCommitNext = true;
  }
  
  void commitFrame() {
    col = nextCol;
    setAlive();
  }
  
  void draw( float x, float y, float cellSize ) {
    if( doCommitNext ) {
      doCommitNext = false;
      commitFrame();
    }
    pushStyle();
      noStroke();
      fill( blackAndWhiteFlag?(isAlive?color(255):color(0)):col );
      rect( x, y, cellSize, cellSize );
    popStyle();
  }
}


final int TYPE_RED = 0;
final int TYPE_GREEN = 1;
final int TYPE_BLUE = 2;

class LifeCellColorized extends Cell {
  boolean isAlive, isAliveNext;
  int type;
  
  LifeCellColorized() {
    // initiallise self with default values
    isAlive = (random(1)<0.5f) ? true : false;
    type = (int)random(2.9f);
    setColour();
    isAliveNext = false;
  }
  
  void setColour() {
    if( isAlive ) {
      switch( type ) {
        case TYPE_RED:
          col = color(255,0,0);
          break;
        case TYPE_GREEN:
          col = color(0,255,0);
          break;
        case TYPE_BLUE:
          col = color(0,0,255);
          break;
        default:
          col = color(255);
      }
    } else {
      col = color(0);
    }
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // count alive neighbours
    int []aliveNeighbours = new int[3];
    for( int i = 0 ; i < 3 ; i++ ) {
      aliveNeighbours[i] = 0;
    }
    for( int i = 0 ; i < 8 ; i++ ) {
      LifeCellColorized cell = (LifeCellColorized)adjacentCells[i];
      if( cell.isAlive ) {
        aliveNeighbours[cell.type]++;
      }
    }
    // change state depending on neighbours
    if( isAlive ) {
      if( aliveNeighbours[type] < 2 ) {
        isAliveNext = false;
      } else if( aliveNeighbours[type] < 4 ) {
        isAliveNext = true;
      } else {
        isAliveNext = false;
      }
    } else {
      if( aliveNeighbours[type] == 3 ) {
        isAliveNext = true;
      }
    }

    // now check other neighbours
    int changeToType = type;
    int []twoOtherTypes = new int[2];
    int idx = 0;
    for( int i = 0 ; i < 3 ; i++ ) {
      if( i != type ) {
        twoOtherTypes[idx] = i;
        idx++;
      }
    }
    if( isAliveNext ) {
      if( aliveNeighbours[twoOtherTypes[0]] >= 2
          && aliveNeighbours[twoOtherTypes[0]] >= aliveNeighbours[twoOtherTypes[1]]) {
        changeToType = twoOtherTypes[0];
      } else if( aliveNeighbours[twoOtherTypes[1]] >= 2
          && aliveNeighbours[twoOtherTypes[1]] >= aliveNeighbours[twoOtherTypes[0]]) {
        changeToType = twoOtherTypes[1];
      }
    } else {
      if( aliveNeighbours[twoOtherTypes[0]] >= 3
          && aliveNeighbours[twoOtherTypes[0]] >= aliveNeighbours[twoOtherTypes[1]]) {
        changeToType = twoOtherTypes[0];
        isAliveNext = true;
      } else if( aliveNeighbours[twoOtherTypes[1]] >= 3
          && aliveNeighbours[twoOtherTypes[1]] >= aliveNeighbours[twoOtherTypes[0]]) {
        changeToType = twoOtherTypes[1];
        isAliveNext = true;
      }
    }

    doCommitNext = true;
  }
  
  void commitFrame() {
    isAlive = isAliveNext;
    setColour();
  }
}

class LifeCellWithColour extends Cell {
  boolean isAlive, isAliveNext;
  color aliveCol;
  
  LifeCellWithColour( boolean state ) {
    // initiallise self with default values
    isAlive = state;
    aliveCol = color( (int)random(255), (int)random(255), (int)random(255) );
    setColour();
    isAliveNext = false;
  }
  
  void setColour() {
    if( isAlive ) {
      col = aliveCol;
    } else {
      col = color(0);
    }
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // count alive neighbours
    // average neighbours colours
    float r = aliveCol >> 16 & 0xFF;
    float g = aliveCol >> 8 & 0xFF;
    float b = aliveCol & 0xFF;
    float numCols = 1.f;
    int aliveNeighbours = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      LifeCellWithColour cell = (LifeCellWithColour)adjacentCells[i];
      if( cell.isAlive ) {
        aliveNeighbours++;
        numCols += 1.f;
        r += cell.col >> 16 & 0xFF;
        g += cell.col >> 8 & 0xFF;
        b += cell.col & 0xFF;
      }
    }
    // change state depending on neighbours
    if( isAlive ) {
      if( aliveNeighbours < 2 ) {
        isAliveNext = false;
      } else if( aliveNeighbours < 4 ) {
        isAliveNext = true;
        aliveCol = color( r/numCols, g/numCols, b/numCols );
      } else {
        isAliveNext = false;
      }
    } else {
      if( aliveNeighbours == 3 ) {
        isAliveNext = true;
        aliveCol = color( (int)random(255), (int)random(255), (int)random(255) );
      }
    }
    doCommitNext = true;
  }
  
  void commitFrame() {
    isAlive = isAliveNext;
    setColour();
  }
}


/*
color []cyclicColours = { color(255,0,0), color(255,255,0), color(0,255,0), color(0,255,255),
                          color(0,0,255), color(255,0,255) };



color []cyclicColours = { color(255,0,0), color(255,128,0), color(255,255,0), color(128,255,0), 
                          color(0,255,0), color(0,255,128), color(0,255,255), color(0,128,255),
                          color(0,0,255), color(128,0,255), color(255,0,255), color(255,0,128) };


color []cyclicColours = { color(255,0,0), color(255,128,0), color(255,255,0), color(128,255,0), 
                          color(0,255,0), color(0,255,128), color(0,255,255), color(0,128,255),
                          color(0,0,255), color(128,0,255), color(255,0,255), color(255,0,128),
                          color(255,0,0), color(255,128,0), color(255,255,0), color(128,255,0), 
                          color(0,255,0), color(0,255,128), color(0,255,255), color(0,128,255),
                          color(0,0,255), color(128,0,255), color(255,0,255), color(255,0,128) };
*/



class LifeCellCyclicColour extends Cell {
  boolean isImmortal;
  int curCyclicColour, nextCyclicColour;
  int minNeighbours;
  
  LifeCellCyclicColour( int _minNeighbours ) {
    // initiallise self with default values
    minNeighbours = _minNeighbours;
    curCyclicColour = (int)random(numCyclicColours);
    nextCyclicColour = curCyclicColour;
    setColour();
  }
  
  void setColour() {
    col = cyclicColours[curCyclicColour];
  }
  
  void nextFrame() {
    if( adjacentCells == null ) {
      return;
    }
    // count alive neighbours
    // average neighbours colours
    int numNextColourNeighbours = 0;
    for( int i = 0 ; i < 8 ; i++ ) {
      LifeCellCyclicColour cell = (LifeCellCyclicColour)adjacentCells[i];
      if( cell.curCyclicColour == ((curCyclicColour+1)%numCyclicColours) ) {
        numNextColourNeighbours++;
      }
    }
    if( numNextColourNeighbours >= minNeighbours ) {
      nextCyclicColour = ((curCyclicColour+1)%numCyclicColours);
      change = true;
    }
    // change state depending on neighbours
    doCommitNext = true;
  }
  
  void commitFrame() {
    curCyclicColour = nextCyclicColour;
    setColour();
  }
}
float colSize( color col ) {
  float r = abs((col >> 16 & 0xFF) - 128);
  float g = abs((col >> 8 & 0xFF) - 128);
  float b = abs((col & 0xFF) - 128);
  return (r+g+b) / 3.f;
}

boolean colDistinct( color col, float minSize, float minDistinct ) {
  float r = abs((col >> 16 & 0xFF) - 128);
  float g = abs((col >> 8 & 0xFF) - 128);
  float b = abs((col & 0xFF) - 128);
  // get greatest dist
  float cSize = 0.f;
  float dist1 = 0.f;
  float dist2 = 0.f;
  // red biggest
  if( r > g && r > b ) {
    cSize = r;
    dist1 = r - g;
    dist2 = r - b;
  }
  // green biggest
  if( g > r && g > b ) {
    cSize = g;
    dist1 = g - r;
    dist2 = g - b;
  }
  // blue biggest
  if( b > r && b > g ) {
    cSize = b;
    dist1 = b - r;
    dist2 = b - g;
  }
  float greatestDist = 0.f;
  if( dist1 > dist2 ) {
    greatestDist = dist1;
  } else {
    greatestDist = dist2;
  }
  if( cSize >= minSize && (cSize - greatestDist) >= minDistinct ) {
    return true;
  }
  return false;
}


color raiseColToMinSize( color col, float minSize ) {
  color c = col;
  float cSize = colSize(c);
  //println( cSize+ " < "+minSize );
  if( cSize < minSize ) {
    //println( "colour size too small!" );
    float colDif = minSize - cSize;
    float r = ((col >> 16 & 0xFF) - 128) + cSize;
    float g = ((col >> 8 & 0xFF) - 128) + cSize;
    float b = ((col & 0xFF) - 128) + cSize;
    if( r > 255.f ) {
      r = 255.f;
    }
    if( g > 255.f ) {
      g = 255.f;
    }
    if( b > 255.f ) {
      b = 255.f;
    }
    c = color(r, g, b);
  }
  return c;
}

float strongestColour( color col ) {
  float r = (col >> 16 & 0xFF);
  float g = (col >> 8 & 0xFF);
  float b = (col & 0xFF);
  // red biggest
  if( r > g && r > b ) {
    return r;
  }
  // green biggest
  if( g > r && g > b ) {
    return g;
  }
  // blue biggest
  if( b > r && b > g ) {
    return b;
  }
  return (r+g+b)/3.f;
}

color changeStrongestColour( color col, float change ) {
  float r = (col >> 16 & 0xFF);
  float g = (col >> 8 & 0xFF);
  float b = (col & 0xFF);
  // red biggest
  if( r > g && r > b ) {
    r += change;
    if( r > 255.f ) {
      r = 255.f;
    } else if( r < 0.f ) {
      r = 0.f;
    }
  }
  // green biggest
  if( g > r && g > b ) {
    g += change;
    if( g > 255.f ) {
      g = 255.f;
    } else if( g < 0.f ) {
      g = 0.f;
    }
  }
  // blue biggest
  if( b > r && b > g ) {
    b += change;
    if( b > 255.f ) {
      b = 255.f;
    } else if( b < 0.f ) {
      b = 0.f;
    }
  }
  return color(r, g, b);
}

color[] createColourTable( color []colourTable, int numCols ) {
  colourTable = new color[numCols];
  for( int i = 0 ; i < numCols ; i++ ) {
    colourTable[i] = getRainbowColourFromLinearNumber( (1.f/(float)numCols) * (float)i );
  }
  return colourTable;
}



int INC_RED = 1;
int INC_GREEN = 2;
int INC_BLUE = 4;
int DEC_RED = 8;
int DEC_GREEN = 16;
int DEC_BLUE = 32;

color []interpolateColourTable = { color(255,0,0), color(255,255,0), color(0,255,0), color(0,255,255),
                          color(0,0,255), color(255,0,255) };
int []colourMovementTable = { INC_GREEN, DEC_RED, INC_BLUE, DEC_GREEN, INC_RED, DEC_BLUE };                         
                          
color getRainbowColourFromLinearNumber( float num ) {
  int idx = -1;
  float scaledNum = 0.f;
  for( int i = 1 ; i <= 6 ; i++ ) {
    if( num < ((1.f / 6.f)*((float)i)) ) {
      scaledNum = num - ((1.f / 6.f)*((float)i-1));
      scaledNum *= 6f;
      //println( num + " is in group "+i+", "+scaledNum+" in it" );
      idx = i - 1;
      break;
    }
  }
  if( idx >= 0 ) {
    return color( red(interpolateColourTable[idx])
                        + (((colourMovementTable[idx]&INC_RED)==INC_RED) ? (int)(255.f * scaledNum) : 0)
                        - (((colourMovementTable[idx]&DEC_RED)==DEC_RED) ? (int)(255.f-(255.f * (1.f-scaledNum))) : 0),
                  green(interpolateColourTable[idx])
                        + (((colourMovementTable[idx]&INC_GREEN)==INC_GREEN) ? (int)(255.f * scaledNum) : 0)
                        - (((colourMovementTable[idx]&DEC_GREEN)==DEC_GREEN) ? (int)(255.f-(255.f * (1.f-scaledNum))) : 0),
                  blue(interpolateColourTable[idx])
                        + (((colourMovementTable[idx]&INC_BLUE)==INC_BLUE) ? (int)(255.f * scaledNum) : 0)
                        - (((colourMovementTable[idx]&DEC_BLUE)==DEC_BLUE) ? (int)(255.f-(255.f * (1.f-scaledNum))) : 0) );
  }
  return color(255);
}


int [][]colours = {
    { #5D5C4A,#686752,#8D8B6B,#CEC8B7,#6B7257,#7D866C,#302E4A,#313046,#313345,#373748,#3A3A4B,#49445A,#817A85,#B2A7AB,#A49EA5 },                    // Pennys & Polaroids - SeeFig
    { #433D29,#50442C,#5C4E2C,#7B5D2E,#836231,#88744B,#8D7A4E,#A18847,#AA8F54,#B39B5C },                                                            // Emers Garden (wood) - SeeFig
    { #947D72,#A08E8D,#A38280,#977977,#AB8F8D,#A18582,#B2ABA9,#CAD0C5,#919195,#998694,#8B6E7B,#846F7C,#7E6B77,#9B808C,#A08F9B,#A78896,#AB939C,#6B4852,#BA9EA3,#B19196,#BA9599,#9C7374,#976C6B }, //Blossoms - SeeFig
    { #21431C,#103113,#144217,#736E39,#867238,#588D35,#7E9644,#B0A345,#D0B93E,#DFCE46,#EDE951,#E2D597 },                                            // Spring - SeeFig
    { #E5B9B9,#B78C78,#CC9F82,#E1B57F,#C69547,#E6D1A6,#D8BB7C,#E1C679,#E6D488,#EADEAE,#EEE8C4,#F5F5EC,#ABA9BC,#DA3B88,#DD7FA2,#DB9DA9,#DF8D95 },    // Colourblocc (ice cream) - SeeFig
    { #120602,#220B03,#360E02,#3C1102,#431302,#4E1401,#5F2A07,#742F07,#7D2D01,#843A07,#A1621D },                                                    // Galway Cathedral (dark fire) - SeeFig
    { #532700,#914F0B,#512C04,#994710,#503010,#6B451A,#A27D4A,#CAAA7D,#BA8840,#E2B46D,#6A5017,#89681F,#989A40,#7E7B12,#5C5C19,#4A5117,#343A1E },    // Salad Fingers(wood and grass) - SeeFig
    { #AF2E35,#C35132,#B43E18,#B76E3C,#724524,#C69060,#D58E1D,#A27C2C,#907121,#997B24,#988D49,#CCC071 },                                            // Untitled (natural tasty) - Alison
    { #671C2C,#73162A,#B33A54,#C4526B,#C16175,#CC7487,#C7798A,#E0768D,#FE6686,#EA7A92,#D8899A,#F37B95,#E4889B,#DA91A1,#E593A5,#DC98A6,#DC98A7,
      #E197A7,#EA94A6,#DE9DAB,#DE9FAC,#E2ABB7,#E8B3BE,#EEB1BE,#E9BAC4,#E8C1CA,#FEBAC9,#FEC1CE,#FEEEF2,#F9F9F9,#FEFEFE},                             // Samuari Hack
    { #946D52,#776746,#63612E,#4D5528,#37420F,#4E5B22,#465826,#374D18,#576841,#354D29,#71A559,#457A4F,#538F60 },                                    // Moschops
    { #333933,#444D47,#48534F,#515D59,#ABB7AC,#CDDAD2,#D0DBD3,#DCE6DF,#E4EFE7,#F6F0EE,#F8FBF9,#FCFEFC,#FDFFFD },                                    // Poster on poll
    { #6E4A38,#C3A795,#886B58,#342418,#7E5C42,#BAA38F,#4C3928,#4F4134,#5F5A55,#9A988E,#5D5B4E,#62675A,#64675E,#6A6F6A },                            // Anne
    { #141B90,#12E940,#123750,#2104E0,#20307B,#2E3468,#104350,#505340,#202320,#48456A,#363253,#514462,#3C3147,#7C6469 },                                   // Jellyfish
    { #C08814,#D69E13,#D09910,#D49C10,#CD9812,#9C750D,#956D01,#957106,#434501,#C4C681,#9DCFFE,#9AC6CD,#C9D2B4,#B1BFAD },                            // Buttercup
    { #F5A630,#4EBBC9,#64C4CF,#65C4D0,#69C5D0,#6BC3CE,#6EC7D2,#8DD4DC,#89CCD4,#90D5DD,#A5DDE3,#ABDFE5,#B7E4E8,#CAEAEC },                             // Ice
    { #F97C44,#F77C38,#F57D2B,#F68131,#F48326,#F78E37,#F68D30,#F69232,#F6982E,#F59729,#F3921D,#F3981E,#F49C24,#F4AE1D }                             // Sun
  };


color[] createColourTable_better( color []colourTable, int numCols ) {
  colourTable = new color[numCols];
  int table = (int)random(colours.length);
  int tableLen = colours[table].length;
  for( int i = 0 ; i < numCols ; i++ ) {
    colourTable[i] = colours[table][(int)(((float)i/(float)numCols)*(float)tableLen)];
  }
  return colourTable;
}


