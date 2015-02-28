
import processing.pdf.*;
boolean savePDF = false;
 
float tileCountX = 1;
float tileCountY = 1;
float tileWidth, tileHeight;
 
int count = 0;
int colorStep = 20;
int circleCount;
float endSize, endOffset;
 
float tileCount = 20;
color moduleColor = color(0);
int moduleAlpha = 180;
int max_distance = 500;
 
 PImage screenshot;
 
int actRandomSeed = 0;
PImage img;
 
void setup() {
  size(800, 800);
  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
  //img = loadImage(selectInput("select an image"));
  img = loadImage("tea.jpg");
  background(255);
  
  smooth();
  noFill();
  strokeWeight(1);
  stroke(#ffffff);
}
 
void draw() {
  image(img,0,0);
  
  int j1 = (int) random(0,width);
  int k1 = (int) random(0,height);
 
  int j2 = round(j1 + random(-10, 10));
  int k2 = round(k1 + random(-10, 10));
 
  int l = 150;
  int m = 50;
 
  copy(j1,k1, l,m, j2,k2, l,m);
  
  img = get();
   
  translate((width/tileCountX)/2, (height/tileCountY)/2);
  circleCount = mouseX/300 + 1;
  endSize = map(mouseX, 0,width, tileWidth/2.0,0);
  endOffset = map(mouseY, 0,height, 0,(tileWidth-endSize)/2);
 
  for (int gridY=0; gridY<=tileCountY; gridY++) {
    for (int gridX=0; gridX<=tileCountX; gridX++) { 
      pushMatrix();
       
       
      translate(tileWidth*gridX, tileHeight*gridY);
      scale(1, tileHeight/tileWidth);
 
      int toggle = (int) random(0,4);
      if (toggle == 0) rotate(-HALF_PI); 
      if (toggle == 1) rotate(0); 
      if (toggle == 2) rotate(HALF_PI); 
      if (toggle == 3) rotate(PI); 
       
      // draw module
      for(int p=0; p<circleCount; p++) {
        float diameter = map(p, 0,circleCount-1, tileWidth,endSize);
        float offset = map(p, 0,circleCount-1, 0,endOffset);
        ellipse(offset, 0, diameter,diameter);
       }
      popMatrix();
    }
  }
 
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
   
}
 
void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    background(255);
    image(img,0,0);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}
 
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


