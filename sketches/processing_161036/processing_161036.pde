
Particle[] particles;
PShape[] modules;
float tileSize;
int gridResolutionX, gridResolutionY, count;
char[][] tiles;
int[] list;
PVector axis;
PFont font;
char typedKey = 'M';
int max;

void setup() {
  colorMode(RGB,255,255,255);
  size(600,800);
  background(255);
  shapeMode(CENTER);
  rectMode(CENTER);
  strokeWeight(0.15);
  frameRate(100);
  max=170;
  count=0;

  font = createFont("FreeSansBold.ttf", 450);
  textFont(font);
  fill(0);
  textAlign(CENTER, CENTER);
  text(typedKey, width/2, height/2-70);
  list = new int[width*height];
  loadPixels();
  for(int y = 0; y<=height-1; y++){
    for(int x = 0; x<=width-1; x++){
      color pb = pixels[y*width+x];
      if(red(pb)<5){  list[y*width+x]=0;  }
      else {  list[y*width+x]=1;  }}}
  updatePixels();
  
  particles=new Particle[150];
  tileSize = 8;
  
  int j=0;  while(j< particles.length){
    axis = new PVector(int(random(100,width-100)),int(random(70,height-70)));
    if(list[int(axis.y*width+axis.x)]==0 && list[int(axis.y*width+axis.x+1)]==0 && 
     list[int(axis.y*width+axis.x-1)]==0 && list[int((axis.y+1)*width+axis.x)]==0 && 
    list[int((axis.y+1)*width+axis.x)]==0){
      particles[j] = new Particle(axis.x,axis.y);
      j++;
    }
  }
  
  gridResolutionX = round(width/tileSize)+2;
  gridResolutionY = round(height/tileSize)+2;
  tiles = new char[gridResolutionX][gridResolutionY];
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY] = '0';
    }
  }
  modules = new PShape[16]; 
  for (int i=0; i< modules.length; i++) { 
    modules[i] = loadShape(nf(i,2)+".svg");
  }  
}

void draw() {
  background(#FFFAF5);
  if(count++<max){
    for (int i = 0; i < particles.length; i++) {
      particles[i].update();
    }
  }
  drawModules();
}

void drawModules() {
  for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
    for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
      if (tiles[gridX][gridY] == '1') {
        String east = str(tiles[gridX+1][gridY]);
        String south = str(tiles[gridX][gridY+1]);
        String west = str(tiles[gridX-1][gridY]);
        String north = str(tiles[gridX][gridY-1]);
        String binaryResult = north + west + south + east;
        int decimalResult = unbinary(binaryResult);
        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;
        // decimalResult is the also the index for the shape array
        shape(modules[decimalResult],posX, posY, tileSize, tileSize);
      }
    }
  }
}

void keyReleased(){
      if (key != CODED && key != ' ' && key != TAB && key != ENTER && key != RETURN) {
      background(#FFFFFF);
      typedKey = key;
      setup();
    }
}
class Particle {
  PVector location;
  PVector velocity;

  Particle(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector(random(1),random(1));
  }

  void update() {
    location.add(velocity);
    checkEdges();
    int gridX = floor((float)location.x/tileSize) + 1;
    gridX = constrain(gridX, 1, gridResolutionX-2);
    int gridY = floor((float)location.y/tileSize) + 1;
    gridY = constrain(gridY, 1, gridResolutionY-2);
    tiles[gridX][gridY] = '1';
  }

  void display() {
    fill(0255,0,0);
    ellipse(location.x,location.y,2,2);
  }

  void checkEdges() {    
    if ((list[int(location.y)*width+int(location.x+velocity.x)]==1)   ||   (list[int(location.y)*width+int(location.x-velocity.x)]==1)) {  velocity.x *= -1;  }
    if ((list[int(location.y+velocity.y)*width+int(location.x)]==1) || (list[int(location.y-velocity.y)*width+int(location.x)]==1)) {  velocity.y *= -1;  }
  }
}


