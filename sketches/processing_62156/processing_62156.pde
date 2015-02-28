
int xPos = 0;
int yPos = 500;

int ellipseSizeX = 50; 
int ellipseSizeY = 50;


void setup (){
  size(500,500);
  smooth();
}

void draw (){
  background(0);
  xPos = xPos + 1;
  yPos = yPos - 1;
  ellipse(xPos,yPos,ellipseSizeX,ellipseSizeY);
}

void mousePressed(){
  xPos = 0;
} 

void keyPressed(){
  ellipseSizeX = ellipseSizeX + 10;
  ellipseSizeY = ellipseSizeY + 10;
} 


