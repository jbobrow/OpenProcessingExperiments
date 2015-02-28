
class Cell {
  int type;
  PVector position;
  ArrayList<Cell> neighbors;
  World world;
  PGraphics pg;
  boolean isNull;
  
  Cell(World world_,PVector position_,int type_) {
    world = world_;
    type = type_;
    position = position_;
    //if (type != CELL_UNKNOWN) createDetail();
    neighbors = new ArrayList<Cell>();
    isNull = false;
  }
  
  Cell() {
    //create a null cell
    type = CELL_UNKNOWN;
    isNull = true;
  }
  
  Cell getNeighbor(int neighbor) {
    if (neighbors.size() <= neighbor + 1) return null;
    if (neighbors.get(neighbor).isNull) return null;
    return neighbors.get(neighbor);
  }
  
  int getNeighborType(int neighbor) {
    Cell cell = getNeighbor(neighbor);
    if (cell != null) return cell.type;
    else return 0;
  }
  
  void setNeighborType(int neighbor, int type_) {
    Cell cell = getNeighbor(neighbor);
    if (cell != null) {
      cell.type = type_;
    }
  }
  
  void createDetail() {
    if (type == CELL_UNKNOWN) return;
    
    color[][] detail = new color[CELL_SIZE][CELL_SIZE];
    color[] colors = new color[CELL_NUM_TYPES*2+2];
    
    
    colors[CELL_TYPE_GRASS*2]   = color(39,160,34);
    colors[CELL_TYPE_GRASS*2+1] =  color(100,206,15);
    
    colors[CELL_TYPE_WATER*2]   =  color(35,68,247);
    colors[CELL_TYPE_WATER*2+1] =  color(87,111,245);
    
    colors[CELL_TYPE_ROCK*2]   =  color(209,209,209);
    colors[CELL_TYPE_ROCK*2+1] =  color(176,176,176);
    
    pg = createGraphics(CELL_SIZE*ATOM_SIZE+1,CELL_SIZE*ATOM_SIZE+1,P2D);
    pg.beginDraw();
    pg.noSmooth();
    pg.noStroke();
    for (int x = 0; x <= CELL_SIZE; x++) {
      for (int y = 0; y <= CELL_SIZE; y++) {
        if (random(1) > .2) {
          pg.fill(colors[type*2]);
        } else {
          pg.fill(colors[type*2+1]);
        }
        pg.rect(x*ATOM_SIZE,y*ATOM_SIZE,ATOM_SIZE,ATOM_SIZE);
      }
    }
    pg.endDraw();
    
    
  }
  
  void draw(boolean highlight) {
    if (type == CELL_UNKNOWN) return;
    if (pg == null) {println("error, creating detail for " + position.x + "," + position.y); createDetail();}
    
    translate(-1 * CELL_SIZE/2,-1 * CELL_SIZE/2,0);
    noStroke();

    beginShape();
    texture(pg);
    vertex(0,0,0,0);
    vertex(0,CELL_SIZE*ATOM_SIZE,0,CELL_SIZE*ATOM_SIZE);
    vertex(CELL_SIZE*ATOM_SIZE,CELL_SIZE*ATOM_SIZE,CELL_SIZE*ATOM_SIZE,CELL_SIZE*ATOM_SIZE);
    vertex(CELL_SIZE*ATOM_SIZE,0,CELL_SIZE*ATOM_SIZE,0);
    endShape();
    /*
    image(pg,0,0);
    if (highlight) {
      fill(254,255,10,100);
      rect(0,0,CELL_SIZE*ATOM_SIZE,CELL_SIZE*ATOM_SIZE);
    }
    */
  }
}

