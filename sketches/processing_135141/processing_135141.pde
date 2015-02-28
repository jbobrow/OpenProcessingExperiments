
int tileCountX = 100;
int tileCountY = 10;

color[] colorsRight = new color[tileCountY];
color[] colorsLeft = new color[tileCountY];
color[] colors;

void setup(){
  size(400,400);
  background(255);
  noStroke();
  colorMode(HSB,360,100,100);
  shakeColors();
  
}

void draw(){
  
  float currentTileCountX = random( map(mouseX, 0,width, tileCountX/2,tileCountX));
  float currentTileCountY = random( map(mouseY, 0,height, tileCountY/2,tileCountY));
  float tileWidth = width / (float) currentTileCountX;
  float tileHeight = height / (float) currentTileCountY;
  color interCol;
  
  // just for ase export
  colors = new color[tileCountX*tileCountY];
  int i = 0;
  
  for(int gridY=0; gridY<tileCountY; gridY++){
    color col1 = colorsLeft[gridY];
    color col2 = colorsRight[gridY];
    
    for (int gridX=0; gridX<tileCountX; gridX++) {
      float amount = map(gridX,0,tileCountX-1,0,1);
      interCol = lerpColor(col1,col2, amount); 
      
      float posX = tileWidth*gridX; 
      float posY = tileHeight*gridY; 
      fill(interCol);     
      rect(posX, posY, random(tileWidth*.2), random(tileHeight*.2)); 
      
      // just for ase export
      colors[i] = interCol;
      i++;
  }
  
}
}

void shakeColors() {
  for (int i=0; i<tileCountY; i++) {
    colorsLeft[i] = color(random(0,360), random(0,100), 100);
    colorsRight[i] = color(random(0,360),100, random(100));
  }
}


