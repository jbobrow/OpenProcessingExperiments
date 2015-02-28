
int x = 400;
int y = 300;
int r = 0;
int g = 0;
int b = 0;
int colorCount = 0;
boolean changeColor = false;
PImage etchSketch;

void setup() {
  
  size(800, 600);
  etchSketch = loadImage("etch.png");
  
  etchVis();
}
 
void draw() { 
   x = constrain(x, 197, 598);
   y = constrain(y, 153, 440);
  
   //x = constrain(x, 604, 404);
  // y = constrain(y, 604, 404);
 
  if (keyPressed) {
   if (key == CODED) { 
     if (changeColor) {
      colorCount += 1;
      changeColor = false;
     } 
        
      if (keyCode == UP) { 
        y = y - 1;
      } 
      else if (keyCode == DOWN) { 
        y = y + 1;
      }
  
      else if (keyCode == RIGHT) { 
        x = x + 1;
      } 
      else if (keyCode == LEFT) { 
        x = x - 1;
      }
     }
     
     
     }
     
     else if (key == 'c') {
       switch(colorCount % 4) {
        case 0:
          r = 255;
          g = 0;
          b = 0;
          break;
        case 1:
          r = 0;
          g = 255;
          b = 0;
          break;
        case 2:
          r = 0;
          g = 0;
          b = 255;
          break;
          case 3:
          r = 10;
          g = 10;
          b = 10;
       }
       
       changeColor = true;
     }
  
 //image(etchSketch, 0, 0);
 
  noStroke();
  smooth();
  fill(r, g, b);
  rect(x, y, 1, 1);
 
  
  if (mousePressed) {
    etchVis();
    x = 700;
    y = 500;
  }
}
 
void mouseReleased() {
}

void etchVis(){
   image(etchSketch, 0, 0);
}
