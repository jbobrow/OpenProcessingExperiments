
color lazerRed = color(235, 15, 38);

float leftX;
float leftY;
float distanceLeft;
int sizeLeft;

float rightX;
float rightY;
float distanceRight;
int sizeRight;


void setup() {
 size(640,480); 
}

void draw() {
  background(25);
  fill(0);
  noStroke();
  rect(91, 171, 208, 37);  //left
  rect(341, 171, 208, 37);  //right
  
  //LEFT EYE
  leftX = map(mouseX, 0, width, 91, 208+91);
  leftY = map(mouseY, 0, height, 171, 171+37);
  distanceLeft = dist(mouseX, mouseY, leftX, leftY);
  sizeLeft = round(map(distanceLeft, 0, 300, 300, 100));
  radialGradient(leftX, leftY, lazerRed, sizeLeft);  
  
  //RIGHT EYE
  rightX = map(mouseX, 0, width, 341, 208+341);
  rightY = map(mouseY, 0, height, 171, 171+37);
  distanceRight = dist(mouseX, mouseY, rightX, rightY);
  sizeRight = round(map(distanceRight, 0, 300, 300, 100));
  radialGradient(rightX, rightY, color(235, 15, 38), sizeRight);
  
  //LAZERS
  if (distanceRight < 275 && distanceLeft < 275) {
    stroke(lazerRed);
    strokeCap(SQUARE);
    strokeWeight(map(distanceRight, 0, 300, 20, 1));
    line(rightX, rightY, mouseX, mouseY);
    strokeWeight(map(distanceLeft, 0, 300, 20, 1));
    line(leftX, leftY, mouseX, mouseY);
  }
  
}

//function found here: http://redrowstudio.com/index.php/2011/04/26/radial-transparent-gradients-in-processing-org/
void radialGradient(float x, float y, int c, int size) {
  PGraphics pg = createGraphics(size, size, JAVA2D);
  pg.beginDraw();
  pg.background(30, 0);
  int halfsize = size / 2;
 
    for (int i = 0; i <= size; i += 1) {
    for (int j = 0; j <= size; j += 1) {
      // calculate distance to center
      //float distance = (float) Math.hypot(i - size / 2, j - size / 2) / (size / 2);
      //float distance = (float) sqrt(sq(i-size/2) + sq(j-size/2)) / (size/2);
      float xDist = i - halfsize;
                float yDist =  j - halfsize;
                float distance = (float) Math.sqrt(xDist*xDist + yDist*yDist) / halfsize;
      float scale = 1 - distance;
      if (scale < 0 ) {
        scale = 0;
      }
      float transparency = 255 * (scale * scale);
      int thisColour = color(c, int(transparency));
      pg.set(i, j, thisColour);
    }
  }
 
  pg.endDraw();
  imageMode(CENTER);
  image(pg, x, y);
}

