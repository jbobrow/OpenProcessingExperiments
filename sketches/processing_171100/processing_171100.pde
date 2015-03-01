
// compatible with toxiclibs 0020
 
import toxi.geom.*;
import toxi.processing.*;
 
ToxiclibsSupport gfx;
HexGrid grid;
 
color[] colorSelection = { #FF0022, #E3C5C5, #FC5757,  #A00303, 
#FF7E7E, #8B0606, #FFFFFF};
 
void setup() {
  size(1280, 720);
  gfx = new ToxiclibsSupport(this);
  grid = new HexGrid(30, 17, 26);
  noCursor ();
}
 
void draw() {
  background(255);
  grid.display();
}
 
void mouseMoved() {
  grid = new HexGrid(30, 17, 26);
}
 
class HexGrid {
  int rows, cols;
  float cellWidth, cellHeight;
  Polygon2D[][] polys;
  int[][] colors;
 
  HexGrid(float radius, int rows, int cols) {
    this.rows = rows;
    this.cols = cols;
    polys = new Polygon2D[rows][cols];
    colors = new color[rows][cols];
    Polygon2D hexProto = new Circle(radius).toPolygon2D(6);
    for(Vec2D v : hexProto.vertices) v.rotate(PI/6);   
    cellWidth = 2 * radius * sin(PI/3);
    cellHeight = cellWidth * sin(PI/3);
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        polys[y][x] = new Polygon2D(hexProto.vertices);
        Vec2D p = getPosForCell(x, y);
        for(Vec2D v : polys[y][x].vertices) v.addSelf(p);
        colors[y][x] = getColorForCell(x, y);
      }
    }
  }
 
  Vec2D getPosForCell(int x, int y) {
    return new Vec2D((x + (1== y % 2 ? 0.5 : 0)) * cellWidth, y * cellHeight);
  }
 
  color getColorForCell(int x, int y) {
    ArrayList <Integer> neighbourColors = getNeighbourColors(x, y);
    ArrayList <Integer> possibleColors = new ArrayList <Integer> ();
    for (int i=0; i<colorSelection.length; i++) {
      if (!neighbourColors.contains(i)) possibleColors.add(i);
    }
    if (possibleColors.size() > 0) return possibleColors.get(int(random(possibleColors.size())));
    return int(random(colorSelection.length));
  }
 
  ArrayList <Integer> getNeighbourColors(int x, int y) {
    ArrayList <Integer> neighbourColors = new ArrayList <Integer> ();
    int offset = (y % 2 == 0 ? 1 : 0);
    int tY = y-1;
    if (tY > -1) {
      int tlX = x - offset; // top-left
      if (tlX >= 0) { neighbourColors.add(colors[tY][tlX]); }
      int trX = x + 1 - offset; // top-right
      if (trX <= cols-1) { neighbourColors.add(colors[tY][trX]); }
    }
    int tlX = x - 1; // left
    if (tlX >= 0) { neighbourColors.add(colors[y][tlX]); }
    return neighbourColors;
  }
 
  void display() {
    for (int y=0; y<rows; y++) {
      for (int x=0; x<cols; x++) {
        fill(colorSelection[colors[y][x]]);
        gfx.polygon2D(polys[y][x]);
      }
    }
  }
}


