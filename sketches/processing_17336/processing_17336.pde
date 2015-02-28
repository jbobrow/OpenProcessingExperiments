
Vector blocks = new Vector();
boolean gridTouchedThisClick;

void renderBlocks() {
////////////////////////////////////
  stroke(128);
  fill(96);
  for (int b = 0; b < blocks.size(); b++) {
    ((Block)blocks.get(b)).render();
  }
}

void touchGrid(float px, float py) {
////////////////////////////////////
  if (!gridTouchedThisClick) {
    
    boolean blockRemoved = false;
    
    // find the XY position on the grid
    int x = int(px / TILE_SIZE) * TILE_SIZE;
    int y = int(py / TILE_SIZE) * TILE_SIZE;
    
    // if there is a block here, remove it
    for (int i = 0; i < blocks.size(); i++) {
      PVector v = ((Block)blocks.get(i)).corner1;
      if ((int)v.x == x && (int)v.y == y) {
        blocks.remove(i);
        blockRemoved = true;
      }
    }
    if (!blockRemoved) {
      blocks.add(new Block(x / TILE_SIZE, y / TILE_SIZE));
    }
    gridTouchedThisClick = true;
  }
}

Vector getBlockLines() {
////////////////////////////////////
  Vector lines = new Vector();
  for (int b = 0; b < blocks.size(); b++) {
    lines.addAll(((Block)blocks.get(b)).lines);
  }
  return lines;
}

class Block {
////////////////////////////////////
  int x, y;
  Vector lines = new Vector();
  PVector corner1, corner2, corner3, corner4;
  
  Block(int px, int py) {
    x = px * TILE_SIZE;
    y = py * TILE_SIZE;
    corner1 = new PVector(x, y); // upper left
    corner2 = new PVector(x + TILE_SIZE, y); // upper right
    corner3 = new PVector(x + TILE_SIZE, y + TILE_SIZE); // bottom right
    corner4 = new PVector(x, y + TILE_SIZE); // bottom left
    lines.add(new Line(corner1, corner2));
    lines.add(new Line(corner2, corner3));
    lines.add(new Line(corner3, corner4));
    lines.add(new Line(corner4, corner1));
  }
  
  void render() {
    rect(corner1.x, corner1.y, TILE_SIZE, TILE_SIZE);
  }
  
}


