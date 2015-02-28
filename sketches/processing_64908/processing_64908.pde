
// city sim
// randomised city streets

// tiles
int tiles_x = 20;
int tiles_y = 20;
int[][] tile = new int[tiles_x][tiles_y];
int tile_size = 10;

// paths
ArrayList nodes = new ArrayList();

// map
PImage carte = new PImage();

// cars
ArrayList cars = new ArrayList();

// init
void setup() {
  size(440,440);
  smooth();
  tile_size = width/tiles_x;
  carte = loadImage("map.png");
  for(int x = 0; x < tiles_x; x++) {
    for(int y = 0; y < tiles_y; y++) {
      tile[x][y] = 0;
//      if(random(1) < 0.5) tile[x][y] = 1;
      if(red(carte.get(x,y)) == 0) tile[x][y] = 1;
    }
  }
  make_paths();
//  node a = (node) nodes.get(15);
//  player = new car(a.pos.x,a.pos.y);
//  player.target = 15;
  for(int i = 0; i < 50; i++) {
    int j = int(random(nodes.size()));
    node a = (node) nodes.get(j);
    car b = new car(a.pos.x,a.pos.y);
    b.target = j;
    cars.add(b);
  }
}

// draw
void draw() {
  background(200);
  noStroke();
  fill(100);
  rectMode(CORNER);
  for(int x = 0; x < tiles_x; x++) {
    for(int y = 0; y < tiles_y; y++) {
      if(tile[x][y] == 1) {
        rect(x*tile_size,y*tile_size,tile_size,tile_size);
      }
    }
  }
  fill(255);
  rectMode(CENTER);
  for(int i = 0; i < nodes.size(); i++) {
    node a = (node) nodes.get(i);
    noStroke();
    rect(a.pos.x, a.pos.y, 3, 3);
//    if(i==15) println(a.children.size());
    for(int j = 0; j < a.children.size(); j++) {
      int b = (Integer) a.children.get(j);
      node c =(node) nodes.get(b);
      stroke(255);
      line(a.pos.x,a.pos.y,c.pos.x,c.pos.y);
    }
  }
  for(int i = 0; i < cars.size(); i++) {
    car a = (car) cars.get(i);
    a.update(nodes);
    a.render();
  }
}

// construct paths
void make_paths() {
  // find road tile
  int tx = 0; int ty = 0;
  for(int x = 0; x < tiles_x; x++) {
    for(int y = 0; y < tiles_y; y++) {
      if(tile[x][y] == 1) {
        // get node ids
        int[] n = new int[8];
        for(int i = 0; i < 8; i++) n[i] = -1;
        PVector p = new PVector(x*tile_size,y*tile_size);
        if(y > 0 && tile[x][y-1] == 1) {
          n[0] = node_at(nodes, new PVector(p.x+tile_size*0.25,p.y));
          n[1] = node_at(nodes, new PVector(p.x+tile_size*0.75,p.y));
          if(n[0] == -1) n[0] = make_node(p.x+tile_size*0.25,p.y);
          if(n[1] == -1) n[1] = make_node(p.x+tile_size*0.75,p.y);          
        }
        if(x < tiles_x-1 && tile[x+1][y] == 1) {
          n[2] = node_at(nodes, new PVector(p.x+tile_size,p.y+tile_size*0.25));
          n[3] = node_at(nodes, new PVector(p.x+tile_size,p.y+tile_size*0.75));
          if(n[2] == -1) n[2] = make_node(p.x+tile_size,p.y+tile_size*0.25);
          if(n[3] == -1) n[3] = make_node(p.x+tile_size,p.y+tile_size*0.75);                  
        }
        if(y < tiles_y-1 && tile[x][y+1] == 1) {
          n[4] = node_at(nodes, new PVector(p.x+tile_size*0.75,p.y+tile_size));
          n[5] = node_at(nodes, new PVector(p.x+tile_size*0.25,p.y+tile_size));
          if(n[4] == -1) n[4] = make_node(p.x+tile_size*0.75,p.y+tile_size);
          if(n[5] == -1) n[5] = make_node(p.x+tile_size*0.25,p.y+tile_size);             
        }        
        if(x > 0 && tile[x-1][y] == 1) {
          n[6] = node_at(nodes, new PVector(p.x,p.y+tile_size*0.75));
          n[7] = node_at(nodes, new PVector(p.x,p.y+tile_size*0.25));
          if(n[6] == -1) n[6] = make_node(p.x,p.y+tile_size*0.75);
          if(n[7] == -1) n[7] = make_node(p.x,p.y+tile_size*0.25);              
        }
        // connect nodes
        for(int i = 0; i <8; i+=2) {
          if(n[i] != -1) {
            node a = (node) nodes.get(n[i]);
            if(n[(i+8+3)%8] != -1) {
//              num b = new num(n[(i+8+3)%8]);
              int b = n[(i+8+3)%8];
              a.children.add(b);
            }
            if(n[(i+8+5)%8] != -1) {
//              num b = new num(n[(i+8+5)%8]);
              int b = n[(i+8+5)%8];
              a.children.add(b);              
            }
            if(n[(i+8+7)%8] != -1) {
//              num b = new num(n[(i+8+7)%8]);
              int b = n[(i+8+7)%8];
              a.children.add(b);              
            }            
          }
        }
      }
    }
  }
}

// node exist
int node_at(ArrayList n, PVector p) {
  for(int i = 0; i < n.size(); i++) {
    node a = (node) n.get(i);
    if(a.pos.x==p.x && a.pos.y==p.y) return i;
  }
  return -1;
}

// make node
int make_node(float x, float y) {
  node a = new node(x,y);
  nodes.add(a);
  return nodes.size()-1;
}

// nodes
class node {
  PVector pos = new PVector();
  ArrayList children = new ArrayList();
  
  node(float x, float y) {
    pos = new PVector(x,y);
  }
}

// car
class car {
  PVector pos = new PVector();
  int target = 0;
  
  car(float x, float y) {
    pos = new PVector(x,y);
  }
  
  // update car
  void update(ArrayList n) {
    // get target node
    node a = (node) n.get(target);
    // move toward target
    float s = 0.4;
    if(pos.x < a.pos.x) pos.x += s;
    if(pos.y < a.pos.y) pos.y += s;
    if(pos.x > a.pos.x) pos.x -= s;
    if(pos.y > a.pos.y) pos.y -= s;    
    // new target
    if(a.pos.dist(pos) < 0.6 && a.children.size() > 0) {
      int b = int(random(a.children.size()));
      if(b >= 0) {
        target = (Integer)a.children.get(b);
      }
    }
  }
  
  // draw car
  void render() {
    rectMode(CENTER);
    noStroke();
    fill(0,0,0);
    rect(pos.x,pos.y,5,5);
  }
}

