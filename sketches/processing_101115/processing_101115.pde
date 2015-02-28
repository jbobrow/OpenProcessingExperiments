
Board board;
Tile[] tiles;
static final int nx = 8, ny = 5;
static final int W = 100;

void setup() {
  size(800, 500);
  smooth();
  board = new Board(0, 0, nx, ny, W);
  String message = "Happy Father's Day! Love, Leo";
  String[] text = split(message, ' ');
  int[] offset = {1, 0, 2, 0, 3};
  tiles = new Tile[message.length() - text.length + 1];
  int n = 0;
  for(int i = 0; i < text.length; i++) {
    for(int j = 0; j < text[i].length(); j++) {
      tiles[n] = new Tile(board, board.cells[j + offset[i]][i], text[i].charAt(j));
      tiles[n++].setConstraints(0, 0, width, height);
    }
  }
}

void draw() {
  background(0);
  for(Tile t: tiles) {
    t.draw();
  }
}

void mousePressed() {
  for(Tile t: tiles) {
    t.mousePressed();
  }
}

void mouseReleased() {
  for(Tile t: tiles) {
    t.mouseReleased();
  }
}

void keyPressed() {
  goHome();
}

void shuffle() {
  ArrayList<Cell> open = new ArrayList<Cell>(nx * ny);
  for(Cell[] row: board.cells) {
    for(Cell c: row) {
      open.add(c);
      c.setTile(null);
    }
  }
  for(Tile t: tiles) {
    Cell c = open.remove(int(random(open.size())));
    c.setTile(t);
    t.cell = c;
    t.glideTo(c.x, c.y);
  }
}

void goHome() {
  for(int i = 0; i < board.cells.length; i++) {
    for(int j = 0; j < board.cells[i].length; j++) {
      board.cells[i][j].setTile(null);
    }
  }
  for(Tile t: tiles) {
    t.goHome();
    Cell c = board.closest(t.homeX, t.homeY);
    t.cell = c;
    t.cell.setTile(t);
  }
}
class Board {
  
  int x, y;
  int cellWidth;
  Cell[][] cells;
  
  Board(int x, int y, int nx, int ny, int cellWidth) {
    this.x = x;
    this.y = y;
    cells = new Cell[nx][ny];
    for(int i = 0; i < cells.length; i++) {
      for(int j = 0; j < cells[i].length; j++) {
        cells[i][j] = new Cell(this, x + (i + .5) * cellWidth, y + (j + .5) * cellWidth);
      }
    }
    this.cellWidth = cellWidth;
  }
  
  void update(Tile a) {
    Cell cellA = a.cell;
    Cell cellB = closest(a);
    if(!cellA.equals(cellB)) {
      Tile b = cellB.contents;
      cellA.setTile(b);
      cellB.setTile(a);
      a.cell = cellB;
      if(b != null) {
        b.cell = cellA;
        b.glideTo(cellA.x, cellA.y);
      }
    }
  }
  
  void controlRelease(Tile a) {
    Cell cellA = a.cell;
    Cell cellB = closest(a);
    if(cellA.equals(cellB)) {
      a.glideTo(cellA.x, cellA.y);
    } else {
      Tile b = cellB.contents;
      cellA.setTile(b);
      cellB.setTile(a);
      a.cell = cellB;
      a.glideTo(cellB.x, cellB.y);
      if(b != null) {
        b.cell = cellB;
        b.glideTo(cellA.x, cellA.y);
      }
    }
  }
  
  Cell closest(Tile t) {
    return cells[round(t.x / cellWidth - .5)][round(t.y / cellWidth - .5)];
  }
  
  Cell closest(float x, float y) {
    return cells[round(x / cellWidth - .5)][round(y / cellWidth - .5)];
  }
}
class Cell {
  
  Board parent;
  Tile contents;
  float x, y;
  
  Cell(Board parent, float x, float y) {
    this.parent = parent;
    this.x = x;
    this.y = y;
  }
  
  void test() {
    if(contents != null) {
      if(contents.isSelected) {
        fill(255, 0, 0);
        ellipse(x, y, 10, 10);
      }
    }
  }
  
  void setTile(Tile contents) {
    this.contents = contents;
  }
  
  boolean hasTile() {
    return contents != null;
  }
  
  String toString() {
    return hasTile() ? str(contents.letter): "0";
  } 
}
abstract class DragDrop {
  
  float x, y;

  boolean isSelected;

  int grabX, grabY;
  boolean isDragging;
  
  float goalX, goalY;
  boolean isGliding;
  float glideEasing;
  float  tempEasing;
  
  float homeX, homeY;
  
  boolean doConstrain;
  float minX, minY, maxX, maxY;
  
  DragDrop() {
    setup(0, 0, .2);
  }
  
  DragDrop(float x, float y) {
    setup(x, y, .2);
  }
  
  DragDrop(float x, float y, float glideEasing) {
    setup(x, y, glideEasing);
  }
  
  void setup(float x, float y, float glideEasing) {
    this.x = x;
    this.y = y;
    setHome(x, y);
    this.glideEasing = glideEasing;
    tempEasing = glideEasing;
  }
  
  void draw() {
    update();
    display();
  }
  
  void update() {
    drag();
    glide();
    if(doConstrain) {
      constrainPosition();
    }
  }
  
  void drag() {
    if(isDragging) {
      x += (mouseX - grabX);
      grabX = mouseX;
      y += (mouseY - grabY);
      grabY = mouseY;
    }
  }    
  
  void glide() {
    if(isGliding) {
      if(sq(goalX - x) + sq(goalY - y) > 1) {
        x += (goalX - x) * glideEasing;
        y += (goalY - y) * glideEasing;
      } else {
        isGliding = false;
        glideEasing = tempEasing;
        x = goalX;
        y = goalY;
      }
    }
  }
  
  void glideTo(float goalX, float goalY) {
    this.goalX = goalX;
    this.goalY = goalY;
    isGliding = true;
  }
  
  void glideTo(float goalX, float goalY, float glideEasing) {
    tempEasing = this.glideEasing;
    this.glideEasing = glideEasing;
    glideTo(goalX, goalY);
  }
  
  void setHome(float homeX, float homeY) {
    this.homeX = homeX;
    this.homeY = homeY;
  }
  
  void goHome() {
    glideTo(homeX, homeY);
  }
  
  abstract void constrainPosition();
  
  void setConstraints(float minX, float minY, float maxX, float maxY) {
    this.minX = minX;
    this.minY = minY;
    this.maxX = maxX;
    this.maxY = maxY;
    doConstrain = true;
  }
    
  void removeConstraints() {
    doConstrain = false;
  }
  
  abstract void display();
  
  abstract boolean mouseOver();
  
  void mousePressed() {
    if(mouseOver() && !isGliding) {
      if(mouseButton == LEFT) {
        grabX = mouseX;
        grabY = mouseY;
        isDragging = true;
        isSelected = true;
      }
    } else {
      isSelected = false;
    }
  }
  
  void mouseReleased() {
    if(isDragging) {
      isDragging = false;
    }
  }
}
class Tile extends DragDrop {
  
  Board parent;
  Cell cell;
  
  int w, w2;
  
  int rotation;
  char letter;
  
  Tile(Board parent, Cell cell, char letter) {
    super(cell.x, cell.y);
    this.parent = parent;
    this.cell = cell;
    cell.setTile(this);
    w = parent.cellWidth - 1;
    w2 = w / 2;
    this.letter = letter;
  }
  
  Tile(Board parent, float x, float y, char letter) {
    super(x, y);
    this.parent = parent;
    cell = parent.closest(this);
    cell.setTile(this);
    w = parent.cellWidth - 1;
    w2 = w / 2;
    this.letter = letter;
  }
  
  void update() {
    super.update();
    if(isSelected) {
      board.update(this);
    }
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(HALF_PI * rotation);
    rectMode(CENTER);
    fill(isSelected ? 250 : 150, 150);
    /*strokeWeight(2);
    stroke(200);*/
    noStroke();
    rect(0, 0, w, w, 5);
    textAlign(CENTER);
    textSize(20);
    text(letter, 0, 5);
    popMatrix();
  }
  
  void constrainPosition() {
    if(doConstrain) {
      x = constrain(x, minX + w2, maxX - w2);
      y = constrain(y, minY + w2, maxY - w2);
    }
  }
  
  boolean mouseOver() {
    return mouseX > x - w/2 && mouseX < x + w/2
        && mouseY > y - w/2 && mouseY < y + w/2;
  }
  
  void mousePressed() {
    super.mousePressed();
  }
  
  void mouseReleased() {
    super.mouseReleased();
    if(isSelected) {
      board.controlRelease(this);
    }
  }
}


