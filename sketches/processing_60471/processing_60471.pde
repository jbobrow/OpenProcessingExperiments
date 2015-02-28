
/**
  * Nils Seifert & Michael Muehlhaus
  *
  * www.muehlseife.de
  *
  * you can select & move the Vectors and Polygons
  * for drawing a new polygon, hold 'n'
**/

ArrayList<Polygon> polygons;
ArrayList<Object> selected;

Vector[][] grid;

int gridSize = 8;
int gridBorder = 0;

Polygon newPolygon;
boolean beginNewPolygon = false;
Solver solver;

int[] colors = {color(0, 0, 255), color(255, 0, 255), color(255, 0, 0), color(255, 255, 0), color(0, 255, 0)};

void setup() {
  size(800, 600, JAVA2D); smooth();
  solver = new Solver();
  
  grid = new Vector[(int)(width / gridSize) - 2 * gridBorder / gridSize + 1]
                   [(int)(height / gridSize) - 2 * gridBorder / gridSize + 1];
  
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      grid[i][j] = new Vector(i * gridSize + gridBorder, j * gridSize + gridBorder);
    }
  }
  
  polygons = new ArrayList<Polygon>();
  selected = new ArrayList<Object>();
  
  polygons.add(new Polygon(new Vector(160, 60),
                           new Vector(160, 120),
                           new Vector(240, 120),
                           new Vector(240, 60)));
  
  polygons.add(new Polygon(new Vector(160, 260),
                           new Vector(160, 420),
                           new Vector(240, 420),
                           new Vector(240, 260)));

  polygons.add(new Polygon(new Vector(420, 140),
                           new Vector(420, 370),
                           new Vector(550, 370),
                           new Vector(550, 140)));
                           
}

void vecPoint(float x, float y, float sz) {
  beginShape();
  vertex(x - sz / 2, y - sz / 2);
  vertex(x - sz / 2, y + sz / 2);
  vertex(x + sz / 2, y + sz / 2);
  vertex(x + sz / 2, y - sz / 2);
  vertex(x - sz / 2, y - sz / 2);
  endShape();
}

void draw() {
  background(255);
  solver.update(grid);
  
  pushStyle();
  noStroke();
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      fill(colorGradient((grid[i][j].value / ((float)grid[i][j].count + 1)) / solver.highest, colors));
      vecPoint(grid[i][j].x, grid[i][j].y, gridSize);
    }
  }
  popStyle();
  
  for (Polygon poly : polygons) {poly.display();}
  
  if (!keyPressed || (keyPressed && key != 'n')) {
    if (beginNewPolygon = true) {
      if (newPolygon != null) if (newPolygon.vertices.size() > 2) {polygons.add(newPolygon); solver.reset(grid);}
    }
    beginNewPolygon = false; newPolygon = null;
  }
  
  textAlign(LEFT, TOP);
  if (beginNewPolygon) {
    fill(0); text("draw polygon by clicking left mouse button", 4, 4);
    
    if (newPolygon != null) if (newPolygon.vertices.size() > 0) {
      strokeWeight(1.5);
      noFill(); stroke(0, 125);
      beginShape();
      for (Vector vec : newPolygon.vertices) vertex(vec.x, vec.y);
      vertex(mouseX, mouseY);
      vertex(newPolygon.vertices.get(0).x, newPolygon.vertices.get(0).y);
      endShape();
    }
  } else {fill(0); text("hold 'n' for drawing new polygon", 4, 4);}
}


