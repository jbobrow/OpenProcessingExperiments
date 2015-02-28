

class Point {
  int x, y;
  
  Point(int x, int y){
    this.x = x;
    this.y = y;
  }
}

class Tile {
  int xpos;
  int ypos;
  int width;
  int height;
  int value;
  
  Tile(int x, int y, int w, int h) {
    this.xpos = x;
    this.ypos = y;
    this.width = w;
    this.height = h;
    this.value = color(random(255), random(255), random(255));
  }
  
  void display() {
    stroke(0);
    fill(this.value);
    rect(this.xpos, this.ypos, this.width, this.height);
  }
}

class TileManager {
  int width;
  int height;
  int hcount;
  int vcount;
  Tile [][] Board;
  
  TileManager(int w, int h, int hcount, int vcount) {
    this.width = w;
    this.height = h;
    this.hcount = hcount;
    this.vcount = vcount;
    
    int tile_width = w / this.hcount;
    int tile_height = h / this.vcount;
    int tile_half_width = tile_width / 2;
    int tile_half_height = tile_height / 2;
    
    this.Board = new Tile[this.hcount][this.vcount];
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        this.Board[i][j] = new Tile(tile_width * i, tile_height * j, tile_width, tile_height);
      }
    }
  }
  
  color next_color(int i, int j) {
    int ravg = 0;
    int gavg = 0;
    int bavg = 0;
    color argb;
    int di, dj;
    di = (i - 1) >= 0 ? i - 1 : this.hcount - 1;
    dj = (j - 1) >= 0 ? j - 1 : this.vcount - 1;
    argb = this.Board[di][j].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    di = (i + 1) <= this.hcount - 1 ? i + 1 : 0;
    dj = (j + 1) <= this.vcount - 1 ? j + 1 : 0;
    argb = this.Board[i][dj].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb));
    di = (i - 1) >= 0 ? i - 1 : this.hcount - 1;
    dj = (j + 1) <= this.vcount - 1 ? j + 1 : 0;
    argb = this.Board[di][j].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    dj = (j - 1) >= 0 ? j - 1 : this.vcount - 1;
    di = (i + 1) <= this.hcount - 1 ? i + 1 : 0;
    argb = this.Board[i][dj].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    bavg = ravg / 4;
    ravg = gavg / 4;
    gavg = bavg / 4;
    if (ravg == 0 && gavg == 0 && bavg == 0) {
      return color(255, 255, 255);
    } else {
    return color(ravg, gavg, bavg);
    }
  }
    
  void display() {
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        this.Board[i][j].display();
      }
    }
  }
  
  void update() {
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        this.Board[i][j].value = this.next_color(i, j);
      }
    }
  }
}
        
int WIDTH = 400;
int HEIGHT = 400;
int HCOUNT = 100;
int VCOUNT = 100;

TileManager tm = new TileManager(WIDTH, HEIGHT, HCOUNT, VCOUNT);

void setup() {
  size(WIDTH, HEIGHT);
  smooth();
  frameRate(60);
}

void draw() {
  tm.update();
  tm.display();
}


