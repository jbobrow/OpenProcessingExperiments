
int WIDTH = 300;
int HEIGHT = 300;
int HCOUNT = 100;
int VCOUNT = 100;

TileManager tm = new TileManager(WIDTH, HEIGHT, HCOUNT, VCOUNT);

void setup() {
  size(WIDTH, HEIGHT);
  frameRate(60);
}

void draw() {
  tm.update();
  tm.display();
}

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
  int on;
  
  Tile(int x, int y, int w, int h, color value) {
    this.xpos = x;
    this.ypos = y;
    this.width = w;
    this.height = h;
    this.value = value;
    this.on = 1;
  }
  
  void display() {
    stroke(this.value);
    fill(this.value);
    rect(this.xpos, this.ypos, this.width, this.height);
  }
}

class TileManager {
  int width, height;
  int hcount, vcount;
  int tile_width, tile_height;
  
  Tile [][] OldBoard;
  Tile [][] NewBoard;
  Tile [][] DrawBoard;
  
  TileManager(int w, int h, int hcount, int vcount) {
    this.width = w;
    this.height = h;
    this.hcount = hcount;
    this.vcount = vcount;
    
    this.tile_width = w / this.hcount;
    this.tile_height = h / this.vcount;
    int tile_half_width = tile_width / 2;
    int tile_half_height = tile_height / 2;
    
    this.OldBoard = new Tile[this.hcount][this.vcount];
    this.NewBoard = new Tile[this.hcount][this.vcount];
    this.DrawBoard = new Tile[this.hcount][this.vcount];
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        this.OldBoard[i][j] = new Tile(tile_width * i, tile_height * j, tile_width, tile_height, color(23, 0, 23));
        this.NewBoard[i][j] = new Tile(tile_width * i, tile_height * j, tile_width, tile_height, color(0, 0, 0));
        this.DrawBoard[i][j] = new Tile(tile_width * i, tile_height * j, tile_width, tile_height, color(0, 0, 0));
      }
    }
  }
  
  color next_color(int i, int j) {
    int ravg = 0;
    int gavg = 0;
    int bavg = 0;
    color argb;
    int mi = (i - 1) >= 0 ? i - 1 : this.hcount - 1;
    int mj = (j - 1) >= 0 ? j - 1 : this.vcount - 1;
    int ai = (i + 1) <= this.hcount - 1 ? i + 1 : 0;
    int aj = (j + 1) <= this.vcount - 1 ? j + 1 : 0;
    argb = this.OldBoard[mi][j].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    argb = this.OldBoard[ai][j].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb));
    argb = this.OldBoard[i][mj].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    argb = this.OldBoard[i][aj].value;
    ravg += (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
    gavg += (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
    bavg += argb & 0xFF;          // Faster way of getting blue(argb)
    ravg = ravg / 4;
    gavg = gavg / 4;
    bavg = bavg / 4;
    int grayness = (abs(ravg - gavg) + abs(ravg - bavg) + abs(gavg - bavg)) / 3;
    if (grayness <= 20 || ((ravg + gavg + bavg)/3) <= 32) {
      this.NewBoard[i][j].on = 0;
      return color(random(255), random(255), random(255));
    } else {
      this.NewBoard[i][j].on = 1;
      return color(ravg, gavg, bavg);
    }
  } 
    
  void display() {
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        if (this.OldBoard[i][j].on == 1) {
          this.OldBoard[i][j].display();
        }
      }
    }
  }
  
  void update() {
    for (int j=0; j<this.hcount; j++) {
      for (int i=0; i<this.vcount; i++) {
        if (this.DrawBoard[i][j].value != color(0, 0, 0)){
          //this.OldBoard[i][j].value = this.DrawBoard[i][j].value;
        }
      }
    }
    for (int i=0; i<this.hcount; i++) {
      for (int j=0; j<this.vcount; j++) {
        this.NewBoard[j][i].value = this.next_color(j, i);
      }
    }
    this.OldBoard = this.NewBoard;
  }
}

