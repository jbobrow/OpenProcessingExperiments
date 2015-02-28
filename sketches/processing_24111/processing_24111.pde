
Shard test;
Shard[] allShapes = new Shard[40];
int startX;
int slantY;


void setup(){
  size(640, 480);
  smooth();
  startX = 100;
  slantY = 40;
  for(int i = 0; i < 10; i++){
    allShapes[i] = new Shard(startX, 1, 30, 450);
    startX +=10;
  }
  for(int i = 10; i < 29; i++){
    allShapes[i] = new Shard(startX, slantY, 30, 200);
    startX +=10;
    slantY +=10;
  }
  for(int i =29; i < 40; i++){
    allShapes[i] = new Shard(startX, 1, 30, 450);
    startX +=10;
  }
  noStroke();
  colorMode(HSB);
}

void draw(){
  background(255);
  for(int i = 0; i < allShapes.length; i++){
     allShapes[i].update();
   }
}

class Shard{
  PShape geometry;
  int x;
  float y;
  float yEnd;
  float yStart;
  float shade;
  float shapeWidth;
  float shapeHeight;
    Shard(int xIn, int yEndIn, int widthIn, int heightIn){
      x = xIn;
      yEnd = yEndIn;
      yStart = random(-500, height+500);
      y = yStart;
      shade = random(30, 200);

      geometry = loadShape("Shard.svg");
      geometry.disableStyle();
      shapeWidth = widthIn;
      shapeHeight = heightIn;
      
    }
    void update(){
      y = map(mouseX, 0, width, yStart, yEnd);
      fill(shade);
      shape(geometry, x, y, shapeWidth, shapeHeight);
    }
    
}

