
Grownie element;

void setup() {
  size(500, 500);
  element = new Grownie(width);
  imageMode(CENTER);
  noSmooth();
}

void draw() {
  background(255);
  if (mousePressed) {
    for (int i = 0; i < 20; i++) {
      element.revertCell();
    }
  } else {
    PVector tend = new PVector(mouseX - width/2, mouseY - height/2);
    tend.div(width/2);
    tend.limit(1);
    tend.mult(tend.mag());
    //tend.mult(0.5);
    for (int i = 0; i < 10; i++) {
      element.addCell(tend);
    }
  }

  element.display(width/2, height/2);
  fill(100);
  text("Keep mouse pressed to revert growing", width/2, 20);
}

class Cell {
  int pos;
  int col;
  boolean alive;
  Cell parent;
  
  
  Cell(int pos) {
    this.pos = pos;
    this.col = col;
    alive = true;
  }
  Cell(int pos, Cell parent) {
    this.pos = pos;
    this.parent = parent;
    alive = true;
  }
  Cell(int pos, int col, Cell parent, boolean alive) {
    this.pos = pos;
    this.parent = parent;
    this.col = col;
    this.alive = alive;
  }
}
class Grownie {
  ArrayList<Cell> cells = new ArrayList<Cell>();
  PGraphics g;
  float red = 255;
  float green = 50;
  float blue = 50;
  int c = 0;
  int center;
  int center_x;
  int center_y;


  Grownie(int size) {
    g = createGraphics(size, size);
    g.loadPixels();

    center_x = floor(g.width/2);
    center_y = floor(g.height/2);
    center = center_x*g.width+center_y;
    addCenterCell();
  }

  void addCenterCell() {
    Cell centerCell = new Cell(center); 
    cells.add(centerCell);
    changeColors(centerCell);
  } 

  void addCell(PVector f) {
    if (cells.size() == 0) {
      addCenterCell();
    } 
    else if (cells.size() < g.pixels.length/1.5) {

      PVector force = f.get();
      PVector grow =  new PVector(1, 0);
      rotateVector(grow, random(TWO_PI));

      int pos = center;
      byte empty = checkEmpty(center);
      PVector location = new PVector();
      int count = 0;

      while ( (g.pixels[pos] >> 24 & 0xff) == 0 || empty == 0) {
        force.mult(0.9);
        grow.add(force);
        grow.normalize();
        location.add(grow);

        if ( location.mag() > center_x - 2) {
          grow =  new PVector(1, 0);
          rotateVector(grow, random(TWO_PI));
          location.mult(0);
        }
        pos = (center_y+round(location.y)) * g.width + (center_x+round(location.x));
        empty = checkEmpty(pos);
      }

      Cell parent;
      int i = cells.size();
      do {
        parent = cells.get(--i);
      } 
      while (parent.pos != pos);

      int newPos = getNewPos(parent.pos, (byte)floor(random(empty)));
      Cell newCell = new Cell(newPos, parent);
      cells.add(newCell);
      changeColors(newCell);
    }
  }

  void addRandomCell() {
    if (cells.size() == 0) {
      addCenterCell();
    }
    else if (cells.size() < g.pixels.length/1.5) {
      byte empty;
      Cell parent;

      do {
        parent = cells.get((int)floor(random(cells.size())));
        empty = checkEmpty(parent.pos);
      } 
      while (empty == 0);

      byte n = (byte)floor(random(empty));
      int pos = getNewPos(parent.pos, n);
      Cell newCell = new Cell(pos, parent);
      cells.add(newCell);
      changeColors(newCell);
    }
  }

  void revertCell() {
    if (cells.size() > 0) {
      Cell lastCell = cells.get(cells.size()-1);
      if (lastCell.alive) {
        revertColors(lastCell, 0);
      }
      cells.remove(lastCell);
    }
  }

  byte checkEmpty(int pos) {
    byte empty = 0;
    int x = pos % g.width;
    int y = floor(pos / g.width);
    for (int cy = y - 1; cy <= y + 1; cy++) {
      for (int cx = x - 1; cx <= x + 1; cx++) {
        if (cx <  0 || !(cx < g.width) || cy < 0 || !(cy < g.height)) {
          continue;
        }
        int current = cy*g.width+cx;
        if ((g.pixels[current] >> 24 & 0xff) == 0) {
          empty++;
        }
      }
    }
    return empty;
  }

  int getNewPos(int pos, byte n) {
    int x = pos % g.width;
    int y = floor(pos / g.width);
    for (int cy = y - 1; cy <= y + 1; cy++) {
      for (int cx = x - 1; cx <= x + 1; cx++) {
        if (cx <  0 || !(cx < g.width) || cy < 0 || !(cy < g.height)) {
          continue;
        }
        int current = cy*g.width+cx;
        if ((g.pixels[current] >> 24 & 0xff) == 0) {
          if (n == 0) {
            return current;
          }
          n--;
        }
      }
    }
    return -1;
  }

  void changeColors(Cell cell) {
    if (cell.parent != null) {
      g.pixels[cell.pos] = g.pixels[cell.parent.pos];
      changeColors(cell.parent);
    } 
    else {
      //g.pixels[cell.pos] = 0xff000000 | c;
      //c = (c + 10) % 0xffffff;

      g.pixels[cell.pos] = color(red, green, blue, 255);
      red = (red < 0) ? 255 : red - 0.5;
      green = (green < 0) ? 150 : green - 0.0051;
      blue = (blue < 0) ? 150 : blue - 0.005;
    }
  }

  void revertColors(Cell cell, int col) {
    if (cell.parent != null) {
      revertColors(cell.parent, g.pixels[cell.pos]);
    }
    g.pixels[cell.pos] = col;
  }

  void display(int x, int y) {
    g.updatePixels();
    image(g, x, y);
  }
  void display(int x, int y, int w, int h) {
    g.updatePixels();
    image(g, x, y, w, h);
  }
  void displayjs(int x, int y, int w, int h) {
    float pw = w/g.width;
    float ph = h/g.height;
    for (int i = 0; i < cells.size(); i++) {
      Cell cell = cells.get(i);
      float xPos = x - center_x*pw + (cell.pos % g.width)*pw;
      float yPos = y - center_y*ph + floor(cell.pos / g.width)*ph;
      noStroke();
      fill(g.pixels[cell.pos]);
      rect(xPos, yPos, pw, ph);
    }
  }
}

void rotateVector(PVector v, float a) {
  float xTemp = v.x;
  v.x = v.x*cos(a) - v.y*sin(a);
  v.y = xTemp*sin(a) + v.y*cos(a);
}


