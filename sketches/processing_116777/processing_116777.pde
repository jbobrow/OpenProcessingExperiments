
boolean flag = false;
float pieceSize = 40.0;
PVector mpos;
boolean drawing = false;
int rng = 20;

float baseX = 60;
float baseY = 60;

ArrayList<Drag> pieces;
ArrayList<Target> targets;

// INIT
void setup() {
  // display
  size(640,480);
  smooth();
  // style
  rectMode(CENTER);
  // gen
  gen(90,rng);
}


// UPDATE
void draw() {
  if(drawing) {
  // bg
  background(255);
  // mousepos
  mpos = new PVector(mouseX, mouseY);
  // targets
  for(Target t : targets) {
    t.update();
    t.draw();
  }
  // pieces
  for(Drag piece : pieces) {
    piece.update();
    piece.draw();
  }
  } else {
//    // draw the path
//    background(100,150,80);
//    stroke(255,230,150);
//    strokeWeight(10);
//    noFill();
//    beginShape();
//    curveVertex(baseX,baseY+pieceSize/2);
//    float tx = 0.0;
//    float ty = 0.0;
//    for(Target t : targets) {
//      curveVertex(t.pos.x + random(-pieceSize/3, pieceSize/3), t.pos.y + random(-pieceSize/3, pieceSize/3));
//      tx = t.pos.x; ty = t.pos.y;
//    }
//    curveVertex(tx + pieceSize/2, ty);
//    endShape();
//    // 
//    for(Drag piece : pieces) {
//      int ttx = 0; int tty = 0;
//      for(Target t : targets) {
//        if(t.num == piece.num) {
//          ttx = int(t.pos.x) - int(pieceSize/2);
//          tty = int(t.pos.y) - int(pieceSize/2);
//        }
//      }
//      piece.img = createImage(int(pieceSize), int(pieceSize), RGB);
//      piece.img.loadPixels();
//      for(int x = 0; x < pieceSize; x++) {
//        for(int y = 0; y < pieceSize; y++) {
//          piece.img.pixels[int(y*pieceSize+x)] = get((x+ttx),(y+tty));       
//        }
//      }
//      pieces.add(piece);
//    }
//    println("HA");
    drawing = true;
  }
}


// MAKE LEVEL
void gen(int start, int range) {
  // targets
  targets = new ArrayList<Target>();
  // starts

  // draw a basic path
  int maxx = range - 1;
  int maxy = 5;
  int[][] grid = new int[maxx][maxy];
  int px = 0; int py = 0; int num = start;
  // first sq
  grid[px][py] = 2;
  // creat a new target
  Target st = new Target(num, new PVector(baseX+px*pieceSize, baseY+py*pieceSize));
  targets.add(st);
  //
  for(int i = 0; i < range-1; i++) {
    boolean valid = true;
    float q = random(1);
    int dx = 0;
    if(q > 0.33) dx = -1;
    if(q > 0.66) dx = 1;
    q = random(1);
    int dy = 0;
    if(q > 0.33) dy = -1;
    if(q > 0.66) dy = 1;
    do {
      valid = true;
      //
      dx = 0;
      if(q > 0.33) dx = -1;
      if(q > 0.66) dx = 1;
      q = random(1);
      dy = 0;
      if(q > 0.33) dy = -1;
      if(q > 0.66) dy = 1;
      // check valid square
      if(valid) {
        if(px+dx < 0 || px + dx > maxx-1) valid = false;
        if(py+dy < 0 || py + dy > maxy-1) valid = false;
        if(dx == 0 && dy == 0) valid = false;
        if(abs(dx) == 1 && abs(dy)==1) valid = false;
      };
      // check unfilled square
      if(valid) {
        if(grid[px+dx][py+dy] == 2) valid = false;
      }
    } while(!valid);
    // new square!
    px += dx; py += dy;
    grid[px][py] = 2;
    num++;
    // creat a new target
    Target t = new Target(num, new PVector(baseX+px*pieceSize, baseY+py*pieceSize));
    targets.add(t);
  }
  // draw the path
  background(100,150,80);
  stroke(255,230,150);
  strokeWeight(10);
  noFill();
  beginShape();
  curveVertex(baseX,baseY+pieceSize/2);
  float tx = 0.0;
  float ty = 0.0;
  for(Target t : targets) {
    curveVertex(t.pos.x + random(-pieceSize/3, pieceSize/3), t.pos.y + random(-pieceSize/3, pieceSize/3));
    tx = t.pos.x; ty = t.pos.y;
  }
  curveVertex(tx + pieceSize/2, ty);
  endShape();
  // 
  pieces = new ArrayList<Drag>();
  ArrayList<Integer> xs = new ArrayList<Integer>();
  for(int i = 0; i < range; i++) {
    Integer j = width/range * (i+1) - int(pieceSize/2);
    xs.add(j);
  }
  for(int i = 0; i < range; i++) {
    Drag piece = new Drag();
    int b = 0;
    int k = int(random(xs.size()));
    piece.pos = new PVector(xs.get(k), height - pieceSize);
    piece.num = i+start;
    int ttx = 0; int tty = 0;
    for(Target t : targets) {
      if(t.num == piece.num) {
        ttx = int(t.pos.x) - int(pieceSize/2);
        tty = int(t.pos.y) - int(pieceSize/2);
        if(i == 0 || i == range-1) {
          piece.pos = t.pos.get();
          piece.pos.add(new PVector(1,1));
        }
      }
    }
    piece.img = createImage(int(pieceSize), int(pieceSize), RGB);
    piece.img.loadPixels();
    loadPixels(); 
    for(int x = 0; x < pieceSize; x++) {
      for(int y = 0; y < pieceSize; y++) {
        piece.img.pixels[int(y*pieceSize+x)] = pixels[(tty+y)*width+(x+ttx)];       
      }
    }
    piece.img.updatePixels();
    xs.remove(k);
    pieces.add(piece);
  }
}


// TARGET CLASS
class Target {
  PVector pos;
  int num;
  boolean full = false;
  
  // init
  Target(int n, PVector p) {
    pos = p.get();
    num = n;
  }
  
  // update
  void update() {
    full = false;
    for(Drag piece : pieces) {
      if(piece.pos.dist(pos) < 1.0) full = true;
    }
  }
  
  // display
  void draw() {
    noFill();
    stroke(0);
    strokeWeight(1.0);
    rect(pos.x, pos.y, pieceSize, pieceSize);
    // 
    textAlign(CENTER,CENTER);
    fill(0); stroke(0);
//    text(str(num),pos.x,pos.y);
  }
  
};


// DRAG CLASS
class Drag {
  PVector pos, offset;
  int num;
  boolean dragged;
  boolean fixed = false;
  PImage img;
  
  // init
  Drag() {
  }
  
  // update
  void update() {
    // pick up
    if(!dragged && !flag && mousePressed && !fixed) {
    PVector d = PVector.sub(mpos, pos);
      if(abs(d.x) < pieceSize/2 && abs(d.y) < pieceSize/2) {
        dragged = true;
        flag = true;
        offset = PVector.sub(pos, mpos);
      }
    }
    // drop
    if(!mousePressed) {
      dragged = false;
      flag = false;
    }
    // snap to nearest target
    if(!dragged) {
      float mind = 9999;
      Target closest = null;
      for(Target t : targets) {
        if(pos.dist(t.pos) < mind) {
          mind = pos.dist(t.pos);
          closest = t;
        }
      }
      if(closest != null) {
        if(!closest.full) {
          PVector d = PVector.sub(closest.pos, pos);
          if(abs(d.x) < pieceSize && abs(d.y) < pieceSize) {
            pos = closest.pos.get();
            if(closest.num == num) fixed = true;
          }
        }
      }
    }
    // move around
    if(dragged) {
      pos = PVector.add(mpos,offset);
    }
  }
  
  // display
  void draw() {
    // piece
    /*
    fill(0,100);
    if(fixed) fill(0,255,0,100);
    stroke(0);
    strokeWeight(0);
    rect(pos.x, pos.y, pieceSize, pieceSize);
    */
    tint(255,255,255);
    if(!fixed) tint(255,255,255,100);
    image(img, pos.x-img.width/2, pos.y - img.height/2);
    // 
    textAlign(CENTER,CENTER);
    fill(0); stroke(0);
//    text(str(num),pos.x+ pieceSize/3,pos.y-pieceSize/3);
  }
  
  
};
