
/* Square and triangle
Marielle Winarto - 23-08-08 */

void setup() {
  size(350,500);
  background(200);
  PFont font = loadFont("TrebuchetMS-24.vlw"); 
  textFont(font); 

  frameRate(60);
  noStroke();  
  fill(100);
  drawFigures();
  fill(200);
}

void drawFigures() {
  int j = 0, k = 49;
  for (int i = 0; i < 1225; i++) {
  rect(50 + (i/35)*4,50 + (i %35)*4, 4, 4);
  
  if (j == k) {
    j = 0;
    k--;
  }
  rect(50 + (49 - k) * 4, 250 + (49 - k) * 2 + j * 4, 4, 4);
  j++;  
  }
}

int i = 0;
int j = 0, k = 49;
boolean paused = false;


// triangular square numbers: 1, 36, 1225
// roots: 1, 6, 35
void draw() {
  if(!paused) {
    rect(50 + (i/35)*4,50 + (i %35)*4, 4, 4);
  
    if (j == k) {
      j = 0;
      k--;
    }
    rect(50 + (49 - k) * 4, 250 + (49 - k) * 2 + j * 4, 4, 4);
    j++;  
    i++;
    if (i == 1225) {
      fill(100);
     text("click to run again", 50, 200);
      fill(200); 
      paused = true;
      i = j = 0;
      k = 49;
    }
  }
}

void mouseReleased() {
  if (paused) {
    paused = false;
    background(200);  
    fill(100);
    drawFigures();
    fill(200);
  }
}

