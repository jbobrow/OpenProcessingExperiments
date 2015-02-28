
import processing.opengl.*; 
import peasy.*; 

PVector left = new PVector(-1, 0, 0);
PVector forward = new PVector(0, 1, 0);
PVector right = new PVector(1, 0, 0);
PVector back = new PVector(0, -1, 0);
PVector up = new PVector(0, 0, -1);
PVector down = new PVector(0, 0, 1);

PeasyCam cam;

PVector EXTENTS = new PVector(60, 60, 60);
PVector COUNTS = new PVector(12, 12, 12);
CellManager cm = new CellManager(EXTENTS, COUNTS);

Cell deadcell = new Cell(cm, new PVector(0, 0, 0), new PVector(0, 0, 0), 0);
Cell alivecell = new Cell(cm, new PVector(0, 0, 0), new PVector(0, 0, 0), 1);

int [] rules = new int [128];

int frameCounter = 0;
int frameDelay = 30;

void new_rules() {
  for (int i=0; i<128; i++) {
    if (1 >= random(4)){
      rules[i] = 1;
    } else {
      rules[i] = 0;
    }
  }
}  

PVector copy(PVector old) {
  return new PVector(old.x, old.y, old.z);
}

void setup() {
  size(400, 400, OPENGL);

  PVector focus = new PVector(EXTENTS.x / 2, EXTENTS.y / 2, EXTENTS.z / 2);
  cam = new PeasyCam(this, focus.x, focus.y, focus.z, 150);
  cam.setMinimumDistance(60);
  cam.setMaximumDistance(500);

  smooth();
  background(0);
  
  lights();
  frameRate(60);
  
  new_rules();
}

void draw() {
  frameCounter++;
  if (frameCounter >= frameDelay){
    cm.update();
    frameCounter = 0;
  }
  directionalLight(255, 200, 200, 1.5f, 1.5f, 0.5f);
  directionalLight(200, 255, 200, 0.5f, 1.5f, 1.5f);
  directionalLight(200, 200, 255, 1.5f, 0.5f, 1.5f);
  directionalLight(255, 200, 200, -1.5f, -1.5f, 0.5f);
  directionalLight(200, 255, 200, 0.5f, -1.5f, -1.5f);
  directionalLight(200, 200, 255, -1.5f, 0.5f, -1.5f);
  background(0);
  noStroke();
  pushMatrix();
  translate(0, 0, 0);
  cm.display();
  popMatrix();

}    

void keyPressed() {
  if (keyCode == UP) {
    min(60, frameDelay++);
  } else if (keyCode == DOWN) {
    max(0, frameDelay--);
  } else if (keyCode == ENTER) {
    new_rules();
  }
}

class Cell {
  CellManager cm;
  PVector position;
  PVector size;
  int visible;
  
  Cell(CellManager cm, PVector pos, PVector size, int visible) {
    this.cm = cm;
    this.position = pos;
    this.size = size;
    this.visible = visible;
  }
  
  void display() {
    if (this.visible == 1) {
      stroke(color(255, 0, 0));
      fill(128);
      pushMatrix();
      translate(this.position.x * this.size.x, this.position.y * this.size.y, this.position.z * this.size.z);
      box(this.size.x, this.size.y, this.size.z);
      popMatrix();
    }
  }
}

 

class CellManager {
  PVector extents;
  PVector counts;
  PVector cell_sizes;
  
  Cell [][][] RenderBoard;
  Cell [][][] WorkingBoard;
  
  CellManager(PVector extent, PVector counts) {
    this.extents = extent;
    this.counts = counts;
    this.cell_sizes = new PVector(
      extent.x / counts.x,
      extent.y / counts.y,
      extent.z / counts.z
    );
    
    this.RenderBoard = new Cell[(int)counts.x][(int)counts.y][(int)counts.z];
    this.WorkingBoard = new Cell[(int)counts.x][(int)counts.y][(int)counts.z];
    
    for (int i=0; i<counts.x; i++) {
      for (int j=0; j<counts.y; j++) {
        for (int k=0; k<counts.z; k++) {
          PVector tmp = new PVector(0, 0, 0);
          int visible = (int)random(2);
          tmp.x = (float)i; tmp.y = (float)j; tmp.z = (float)k;
          this.RenderBoard[i][j][k] = new Cell(this, tmp, this.cell_sizes, visible);
          this.WorkingBoard[i][j][k] = new Cell(this, copy(tmp), this.cell_sizes, visible);
        }
      }
    }
  }
  
  Cell GetNeighbor(PVector position, PVector offset, int bounded) {
    position.add(offset);
    PVector newpos = copy(position);
    if (bounded !=0 ){
      newpos.x = (newpos.x >= 0) ? newpos.x : this.counts.x - 1;
      newpos.x = (newpos.x < this.counts.x) ? newpos.x : 0;
      newpos.y = (newpos.y >= 0) ? newpos.y : this.counts.y - 1;
      newpos.y = (newpos.y < this.counts.y) ? newpos.y : 0;
      newpos.z = (newpos.z >= 0) ? newpos.z : this.counts.z - 1;
      newpos.z = (newpos.z < this.counts.z) ? newpos.z : 0;
      return this.RenderBoard[(int)newpos.x][(int)newpos.y][(int)newpos.z];
    } else {
      return deadcell;
    }
  }
  

  
  int GetLookupKey(Cell cell, int bounded) {
    Cell tc;
    PVector pos = copy(cell.position);
    int key = 0;
    if (cell.visible == 1){ key += 1; }
    tc = this.GetNeighbor(cell.position, left, bounded);
    if (tc.visible == 1){key += 2; }
    tc = this.GetNeighbor(cell.position, forward, bounded);
    if (tc.visible == 1){key += 4; }
    tc = this.GetNeighbor(cell.position, right, bounded);
    if (tc.visible == 1){key += 8; }
    tc = this.GetNeighbor(cell.position, back, bounded);
    if (tc.visible == 1){key += 16; }
    tc = this.GetNeighbor(cell.position, up, bounded);
    if (tc.visible == 1){key += 32; }
    tc = this.GetNeighbor(cell.position, down, bounded);
    if (tc.visible == 1){key += 64; }
    return key;
  }  
  
  void display() {
    for (int i=0; i<counts.x; i++) {
      for (int j=0; j<counts.y; j++) {
        for (int k=0; k<counts.z; k++) {
          //println(this.RenderBoard[i][j][k].position);
          this.RenderBoard[i][j][k].display();
        }
      }
    }
  }
    
  void update() {
    int rule;
    for (int i=0; i<counts.x; i++) {
      for (int j=0; j<counts.y; j++) {
        for (int k=0; k<counts.z; k++) {
          rule = this.GetLookupKey(RenderBoard[i][j][k], 1);
          this.RenderBoard[i][j][k].visible = rules[rule];
        }
      }
    }
  }
}


