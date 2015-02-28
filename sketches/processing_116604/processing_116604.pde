
// flow clone
int gridX = 6;
int gridY = 6;
int[][] grid;
 
int gridSize = 40;
int gridPX = 100;
int gridPY = 100;
 
boolean flag = false;
 
ArrayList<Path> paths = new ArrayList<Path>();
 
 
// init
void setup() {
   
  size(440,440);
  smooth();
   
  grid = new int[gridX][gridY];
   
  for(int i = 0; i < 2; i++) {
      int stx = 1;
      int sty = 1;
      int enx = 1;
      int eny = 4;
      color c = color(#FC008B);
      if(i==1) {
        c = color(#006BFC);
        stx = 2; sty = 1;
        enx = 2; eny = 4;
      }
      if(i==2) {
        c = color(#9FFC00);
        stx = 3; sty = 3;
        enx = 4; eny = 3;
      }
      if(i==3) {
        c = color(#FCAD00);
        stx = 5; sty = 0;
        enx = 5; eny = 5;
      }
      Path p = new Path(stx,sty,enx,eny);
      p.c = c;
      paths.add(p);
  }
   
}
 
 
// update
void draw() {
   
  // bg
  background(255);
   
  // grid
  strokeWeight(1.0);
  stroke(200);
  for(int x = gridPX; x <= gridPX + gridX*gridSize; x+=gridSize) {
    line(x, gridPY, x, gridPY + gridSize*gridY);
  }
  for(int y = gridPY; y <= gridPY + gridY*gridSize; y+=gridSize) {
    line(gridPX, y, gridPX + gridX*gridSize, y);
  }
   
  // colours
  for(Path p : paths) {
    p.update();
    p.draw();
  }
   
   
}
 
 
// path
class Path {
   
  ArrayList<PVector> path = new ArrayList<PVector>();
  PVector end = new PVector();
  int ox = 0;
  int oy = 0;
  color c = color(#007CFC);
   
  boolean dragged = false;
   
  PVector chrp = new PVector();
  int chrt = 0;
   
  Path(int sx, int sy, int ex, int ey) {
    path.add(new PVector(sx,sy));
    end = new PVector(ex, ey);
    grid[ex][ey] = 2;
    chrp = new PVector(gridPX + gridSize*(sx+0.5), gridPY + gridSize*(sy+0.5));
  }
   
  void update() {
    // start dragging
    if(!flag && mousePressed) {
      int mx = floor((mouseX - gridPX)/gridSize);
      int my = floor((mouseY - gridPY)/gridSize);
      for(int i = 0; i < path.size(); i++) {
        PVector p = path.get(i);
        //if(mx != end.x || my != end.y) {
          if(int(p.x) == mx && int(p.y) == my) {
            flag = true;
            dragged = true;  
            for(int j = path.size() - 1; j > i; j--) {
              PVector q = path.get(j);
              grid[int(q.x)][int(q.y)] = 0;
              path.remove(j);
            }
            break;
          }
        //}
      }
    }
    // drag
    if(dragged) {
      int mx = floor((mouseX - gridPX)/gridSize);
      int my = floor((mouseY - gridPY)/gridSize);
      if(mx >= 0 && mx < gridX && my >= 0 && my < gridY) {
        boolean yes = false;
        if(grid[mx][my] == 1) yes = true;
        if(grid[mx][my] == 2 && !(mx==int(end.x) && my==int(end.y))) yes = true;
        for(int i = 0 ; i < path.size(); i++) {
          PVector p = path.get(i);
          if(int(p.x) == mx && int(p.y) == my) yes = true;
          grid[int(p.x)][int(p.y)] = 1;
          if(i==path.size()-1) {
            if(abs(p.x - mx) > 1 || abs(p.y - my) > 1 || (abs(p.x - mx)==1 && abs(p.y - my)==1)) yes = true;
          }
          if(i == path.size()-1 && p.x == end.x && p.y == end.y) yes = true;
        }
        if(!yes) {
          path.add(new PVector(mx,my));
        }
      }
    }
    // undrag
    if(!mousePressed) {
      flag = false;
      dragged = false;
    }
    // blocks
    for(int i = 0 ; i < path.size(); i++) {
      PVector p = path.get(i);
      grid[int(p.x)][int(p.y)] = 1;
    }
    // character
    if(chrt > path.size()-1) {
      chrt = path.size()-1;
      chrp = path.get(chrt).get();
      chrp.mult(gridSize);
      chrp.add(new PVector(gridPX, gridPY));
      chrp.add(new PVector(gridSize/2, gridSize/2));
    }
    PVector t = path.get(chrt).get();;
    t.mult(gridSize);
    t.add(new PVector(gridPX, gridPY));
    t.add(new PVector(gridSize/2, gridSize/2));
    PVector d = t.get();
    t.sub(chrp);
    t.normalize();
    t.mult(1.0);
    if(chrp.dist(d) < 1 && !dragged) chrt++;
    else chrp.add(t);
  }
   
  void draw() {
    beginShape();
    noFill();
    strokeWeight(10);
    stroke(c);
    for(PVector p : path) {
      vertex(gridPX + gridSize*(p.x+0.5), gridPY + gridSize*(p.y+0.5));
    }
    endShape();
    point(gridPX + gridSize*(end.x+0.5), gridPY + gridSize*(end.y+0.5));
    strokeWeight(20);
    point(chrp.x, chrp.y);
  }
   
}
 
 
/*
for(int i = 0; i < 10; i++) {
  Unit u = new Unit();
  units.add(u);
}
   
ArrayList<Unit> units = new ArrayList<Unit>();
 
// units
for(Unit u : units) {
  u.update();
  u.draw();
}
 
// unit object
class Unit {
   
  float r = 10.0;
  PVector p = new PVector();
   
  Unit() {
  }
   
  void update() {
  }
   
  void draw() {
    ellipse(p.x, p.y, r*2, r*2);
  }
   
};
*/
