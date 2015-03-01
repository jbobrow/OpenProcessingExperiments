
int xPos=0;
int yPos=0;

int xOffset=0;
int yOffset=0;

float zoom=1;

int size=60;

void setup() {
  size(600, 600);
  xPos=width/2;
  yPos=height/2;
  stroke(0);
  strokeWeight(0.5);
}

void draw() {
  background(255);

  translate(xPos, yPos);
  scale(zoom);


   //draw a grid of rectangles
  for (int rows=0; rows<40; rows++) {
    for (int cols=0; cols<40; cols++) {
      fill(0, 255, 0, 100);      
      
      float rectX = rows*size;
      float rectY = cols*size;

      rect(rectX, rectY, size-4, size-4);
      fill(255);      
      text("[" +rows+ "," +cols+ "]", rows*size+2, cols*size+20);
    }
  }
}

// map arrow keys ot move xPos and yPos
// map z and x to zoom
void keyPressed() {

  if ( keyCode == 90) {
    zoom-=0.1;
  }
  if ( keyCode == 88) {
    zoom+=0.1;
  }
    int m=25;
  if (keyCode == 38) {
    yPos+=m;
  }
  if (keyCode == 37) {
    xPos+=m;
  }
  if (keyCode == 39) {
    xPos-=m;
  }
  if (keyCode == 40) {
    yPos-=m;
  }
}
void mousePressed() {
  xOffset = mouseX-xPos;
  yOffset = mouseY-yPos;
}

void mouseDragged() {
  xPos = mouseX-xOffset;
  yPos = mouseY-yOffset;
}

