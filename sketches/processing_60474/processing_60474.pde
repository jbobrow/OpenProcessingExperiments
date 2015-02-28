
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

int gridSize = 20;
int gridBorder = 0;
float vectorScale = 0.3f;
int DM = 0;

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
                           new Vector(340, 120),
                           new Vector(340, 60)));
  
  polygons.add(new Polygon(new Vector(160, 260),
                           new Vector(160, 420),
                           new Vector(240, 420),
                           new Vector(240, 260)));

  polygons.add(new Polygon(new Vector(420, 240),
                           new Vector(420, 470),
                           new Vector(580, 470),
                           new Vector(580, 240)));
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

void vecArrow(float x, float y, float dirX, float dirY, float sz) {
  PVector dirN = new PVector(dirX, dirY);
  dirN.normalize();
  PVector vertical = new PVector(-dirN.y, dirN.x);
  PVector dir = new PVector(dirX, dirY);
  
  beginShape();
  vertex(x + dir.x + dirN.x * sz, y + dir.y + dirN.y * sz); //spitze
  vertex(x + vertical.x * sz, y + vertical.y * sz);
  vertex(x - dirN.x * sz, y - dirN.y * sz);
  vertex(x - vertical.x * sz, y - vertical.y * sz);
  vertex(x + dir.x + dirN.x * sz, y + dir.y + dirN.y * sz);
  endShape();
}

void vecCompass(PVector pos, float[] values, float scale) {
  beginShape();
  for (int i = 0; i < values.length; i++) {
    vertex(pos.x + cos((float)i / 32f * PI * 2f + PI) * (values[i] * scale + 2),
           pos.y + sin((float)i / 32f * PI * 2f + PI) * (values[i] * scale + 2));
  }
  vertex(pos.x + cos((float)0 / 32f * PI * 2f + PI) * (values[0] * scale + 2),
         pos.y + sin((float)0 / 32f * PI * 2f + PI) * (values[0] * scale + 2));
  endShape();
}

void draw() {
  background(255);
  solver.update(grid);
  
  pushStyle();
  noStroke(); //stroke(0); strokeWeight(1);
  
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[i].length; j++) {
      fill(colorGradient((grid[i][j].value / ((float)grid[i][j].count +1) - solver.lowest) / (solver.highest - solver.lowest), colors));

      if (DM == 0) {
        vecArrow(grid[i][j].x, grid[i][j].y, grid[i][j].dir.x / ((float)grid[i][j].count +1), grid[i][j].dir.y / ((float)grid[i][j].count +1), 2);
        //vecCompass(grid[i][j], grid[i][j].vValue, 1 / ((float)grid[i][j].count +1));
      } else vecPoint(grid[i][j].x, grid[i][j].y, 0.25 * (sqrt(sq(grid[i][j].dir.x / ((float)grid[i][j].count +1)) + sq(grid[i][j].dir.y / ((float)grid[i][j].count +1))) + 4));
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
  text("press 'd' for changing display mode", 4, 16);
}


