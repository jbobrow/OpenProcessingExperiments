
/**
 * draw a module made of lines in a grid
 *   
 * MOUSE
 * position x          : number of tiles horizontally
 * position y          : number of tiles vertically
 * 
 * KEYS
 * 1-3                 : draw mode + color change
 * s                   : save png
 * p                   : save pdf
 */


import processing.pdf.*;
boolean savePDF = false;

float tileCountX = 5;
float tileCountY = 5;

int count = 10;
int colorStep = 20;

int lineWeight = 0;
int strokeColor = 0;

color backgroundColor = 0;

int drawMode = 1;

void setup() { 
  size(600, 600);
} 

void draw() { 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(RGB, 255, 255, 255); 
  smooth();
  strokeWeight(0.5);
  strokeCap(ROUND);

  tileCountX = mouseX/30+1;
  tileCountY = mouseY/30+1;

  background(backgroundColor);

  for (int gridY=0; gridY<= tileCountY; gridY++) {
    for (int gridX=0; gridX<= tileCountX; gridX++) {  

      float tileWidth = width/tileCountX;
      float tileHeight = height/tileCountY;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      float x1 = tileWidth*2;
      float y1 = tileHeight*2;
      float x2 = 1;
      float y2 = 1;

      pushMatrix();
      translate(posX, posY);

      for(int side = 0; side < 4; side++) {
        for(int i=0; i< count; i++) {

           // move end point around the four sides of the tile
          if(side == 0){     
            x2 += tileWidth/count;
            y2 = 0;
          }
          if(side == 1){     
            x2 = tileWidth;
            y2 += tileHeight/count;
          }
          if(side == 2){     
            x2 -= tileWidth/count;
            y2 = tileHeight;
          }
          if(side == 3){     
            x2 = 0;
            y2 -= tileHeight/count;
          }

          // adjust weight and color of the line
          if(i < count/2){
            lineWeight += 1;
            strokeColor += 60;
          } 
          else {
            lineWeight -= 1;
            strokeColor -= 60;
          }

          // set colors depending on draw mode
          switch(drawMode){
          case 1:
            backgroundColor = 0;
            stroke(140);
            break;
          case 2:
            backgroundColor = 360;
            stroke(255,255,0);
            strokeWeight(lineWeight);
            break;
          case 3:
            backgroundColor = 0;
            stroke(255,255,0);
            strokeWeight(mouseX/300);
            break;
          }

          // draw the line
          line(x1, y1, x2, y2);
        }
      }

      popMatrix();
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
} 


void keyPressed() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
