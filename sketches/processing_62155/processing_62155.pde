
int xPos = 250;
int yPos = 250;

int ellipseSizeX = 50; 
int ellipseSizeY = 50;

void setup (){
  size(500,500);
  smooth();
  colorMode(RGB,500,500,500);
}

void draw (){
  background(0);
  ellipse(xPos,yPos,ellipseSizeX,ellipseSizeY);
}

void mousePressed(){
  ellipseSizeX = ellipseSizeX + 10;
  ellipseSizeY = ellipseSizeY + 10;
  fill (mouseX,mouseY,mouseX);
} 

void keyPressed(){
  ellipseSizeX =  10;
  ellipseSizeY =  10;

} 

