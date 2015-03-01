
Tiles tiles;

void setup() {
  size(640, 480);
  background(0);
  tiles = new Tiles(7, 5, 96, 96, new Spritesheet("spritesheet.png", 10, 10, 24, 24));
  tiles.fill(2);
  for(int i = 0; i < 10; i++){
    tiles.set((int)random(7), (int)random(5), WallType.DIRTSTONE); 
  }
  noSmooth();
}

void draw() {
  tiles.draw();
}

void keyPressed(){
  tiles.clear();
  tiles.fill(2);
  for(int i = 0; i < 10; i++){
    tiles.set((int)random(7), (int)random(5), WallType.DIRTSTONE); 
  }
}

class Tiles{
    Spritesheet sprites;
    Tile[] tiles;
    int width, height, tileWidth, tileHeight;
    
    Tiles(int w, int h, int tw, int th, Spritesheet s){
        width = w;
        height = h;
        tileWidth = tw;
        tileHeight = th;
        sprites = s;
        tiles = new Tile[width * height];
        clear();
    }
    
    void clear(){
     for(int y = 0; y < height; y++){
         for(int x = 0; x < width; x++){
          int i = x + y * width;
            if(tiles[i] == null)
              tiles[i] = new Tile(-1,WallType.NONE,x,y,tileWidth,tileHeight,sprites);
            else{
               tiles[i].floorIndex = -1;
               tiles[i].wall = WallType.NONE; 
            }
         } 
        }
    }
    
    void fill(int val){
      for(int i = 0; i < tiles.length; i++){
         tiles[i].floorIndex = val;
     }
    }
    
    void set(int x, int y, int floor){
      tiles[x + y * width].floorIndex = floor; 
    }
  
  void set(int x, int y, WallType w){
      tiles[x + y * width].wall = w; 
    }
    
    void draw(){
      for(int i = 0; i < tiles.length; i++){
        tiles[i].draw();
      }
    }
}

class Tile{
  int floorIndex;
  WallType wall;
  Spritesheet ss;
  int x, y, tw, th;
  
  Tile(int fi, WallType w, int x, int y, int tw, int th, Spritesheet ss){
   floorIndex = fi;
   wall = w; 
   this.x = x;
   this.y = y;
   this.tw = tw;
   this.th = th;
   this.ss = ss;
  }
  
  void drawFloor(){
    if(floorIndex >= 0)
      image(ss.get(floorIndex), x * tw, y * th, tw, th);
  }
  
  void drawWall(){
    if(wall == WallType.DIRTSTONE){
        image(ss.get(1), x * tw, y * th, tw, th);
        image(ss.get(0), x * tw, y * th - 3 * th / 4, tw, th);
    }
  }
  
  void draw(){
    drawFloor();
    drawWall();
  }
}

class Spritesheet{
    PImage source;
    PImage[] sprites;
    int width, height, tileWidth, tileHeight;
    
    Spritesheet(String s, int w, int h, int tw, int th){
        source = loadImage(s);
        width = w;
        height = h;
        tileWidth = tw;
        tileHeight = th;
        cutSprites();
    }
    
    void cutSprites(){
      sprites = new PImage[width * height];
       for(int y = 0; y < height; y++){
          for(int x = 0; x < width; x++){
            sprites[x + y * width] = source.get(x * tileWidth, y * tileHeight, tileWidth, tileHeight);
          }
       } 
    }
    
    PImage get(int index){
      return sprites[index]; 
    }
}


