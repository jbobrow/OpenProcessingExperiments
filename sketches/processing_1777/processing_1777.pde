
color black = color(0); 
color white = color(255); 
color Red = color(255,0,0); 
color Yellow = color(255,255,0); 
color Blue = color(0,0,255); 
int linesLimit = 20; 
int rectangleCount = 2; 
float horizontalLines; 
float verticalLines; 
float removals = 10; 
 
void setup() 
{ 
  size(768,512); 
  drawPainting(); 
} 
 
void drawPainting() 
{ 
  background(255); 
  stroke(black); 
  drawHorizontalLines(); 
  drawVerticalLines(); 
  drawFrame();
  deleteLines(); 
  fillRectangles(); 
  drawFrame();
} 
 
void draw() { 
} 
 
void mousePressed() 
{ 
  drawPainting(); 
} 
 
void drawHorizontalLines() 
{ 
    stroke(black); 
  horizontalLines = random(3,linesLimit); 
  for(int i=0; i<horizontalLines; i++) 
  { 
    float yPos=random(height); 
    strokeWeight(4); 
    line(0,yPos,width,yPos); 
  }  
} 
 
void drawVerticalLines() 
{ 
    stroke(black); 
  verticalLines = random(linesLimit); 
  for(int i=0; i<verticalLines; i++) 
  { 
    float xPos=random(width); 
    strokeWeight(4); 
    line(xPos,0,xPos,height); 
  }  
} 
 
void drawFrame() 
{ 
  stroke(black); 
  strokeWeight(10); 
  line(0,0,width,0); 
  line(0,0,0,height); 
  line(0,height,width,height); 
  line(width,0,width,height); 
} 
 
void deleteLines() 
{ 
  int counter = 0; 
  while(counter<removals) 
  { 
    int xPosition = (int)random(width); 
    int yPosition = (int)random(height); 
    if(get(xPosition,yPosition)==white) 
    { 
      counter++; 
      removeLineLeftOfRectangle(xPosition,yPosition); 
    } 
  } 
} 
void fillRectangles() 
{ 
  float rectangles = random(rectangleCount-1,rectangleCount); 
 
  int counter = 0; 
  while(counter<rectangles) 
  { 
    int xPosition = (int)random(width); 
    int yPosition = (int)random(height); 
    if(get(xPosition,yPosition)==white) 
    { 
      counter++; 
      fillSingleRectangle(xPosition,yPosition,Blue); 
    } 
  } 
  counter = 0; 
  while(counter<rectangles) 
  { 
    int xPosition = (int)random(width); 
    int yPosition = (int)random(height); 
    if(get(xPosition,yPosition)==white) 
    { 
      counter++; 
      fillSingleRectangle(xPosition,yPosition,Red); 
    } 
  }   
  counter = 0; 
  while(counter<rectangles) 
  { 
    int xPosition = (int)random(width); 
    int yPosition = (int)random(height); 
    if(get(xPosition,yPosition)==white) 
    { 
      counter++; 
      fillSingleRectangle(xPosition,yPosition,Yellow); 
    } 
  }   
} 
 
void fillSingleRectangle(int x, int y,color c) 
{ 
  int p=0; 
  while(get(x,y-p)==white) p++; 
  int q=0; 
  while(get(x-q,y)==white) q++; 
  int i=0; 
  while(get(x,y+i)==white) i++; 
  int j=0; 
  while(get(x+j,y)==white) j++; 
  noStroke(); 
  fill(c); 
  rectMode(CORNERS); 
  rect(x-q,y-p,x+j,y+i); 
} 
 
void removeLineLeftOfRectangle(int x, int y) 
{ 
  int p=0; 
  while(get(x,y-p)==white) p++; 
  int i=0; 
  while(get(x,y+i)==white) i++; 
  int j=0; 
  while(get(x+j,y)==white) j++;   
  stroke(white); 
  strokeCap(SQUARE); 
  line(x+j+3,y-p+1,x+j+3,y+i); 
} 
 
 
 

