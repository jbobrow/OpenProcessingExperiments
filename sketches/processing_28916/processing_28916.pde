
import processing.pdf.*;
boolean savePDF = false;

float anzahlX = 5;
float anzahlY = 5;
float tileWidth, tileHeight;




            float x1 = tileWidth/2;
      float y1 = tileHeight/2;
      float x2 = 0;
      float y2 = 0;


int circleCount;
float endSize, endOffset;

int actRandomSeed = 0;





int drawMode = 1;

void setup() { 
  size(500, 500);
  tileWidth = width / anzahlX;
  tileHeight = height / anzahlY;
} 


void draw() { 
  

  smooth();

  background(20,30,10,300);
  randomSeed(actRandomSeed);

  translate((width/anzahlX)/2, (height/anzahlY)/2);

  circleCount = mouseX/30 + 1;
  endSize = map(mouseX, 0,width, tileWidth/2.0,0);
  endOffset = map(mouseY, 0,height, 0,(tileWidth-endSize)/2);

  for (int gridY=0; gridY<=anzahlY; gridY++) {
    for (int gridX=0; gridX<=anzahlX; gridX++) {  
      pushMatrix();
      translate(tileWidth*gridX, tileHeight*gridY);
      scale(1, tileHeight*0.8/tileWidth*2);



      
      // draw module
      for(int i=0; i<circleCount; i++) {
        float diameter = map(i, 0,circleCount+1, tileWidth,endSize);
        float offset = map(i, 0,circleCount+3, 0,endOffset);
        ellipse(offset, 0, diameter,diameter);
        fill(205,0,0,127);



      }
      popMatrix();
    }
  }
  
  
 

  
} 


void mousePressed() {
  actRandomSeed = (int) random(100000);
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}











