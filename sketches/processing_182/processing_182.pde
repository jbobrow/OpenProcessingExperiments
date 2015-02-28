
int storedCoord = 0; // place holder for coord in latest sketch
int maxPoints = 50; // maximum number of points; should eventually just caused the drawing tool to stop
int tempX, tempY; //takes current MouseX and converts it into tempX for constraining
boolean overMaxPoints = false;
int[] storedXs = new int[maxPoints]; //array to store X values in sketch
int[] storedYs = new int[maxPoints]; //array to store Y values in sketch
ArrayList squigglesList;

void setup() {
  size(900,450);
  smooth();
  squigglesList = new ArrayList();
}

void draw() {
  background(0);

  if (overMaxPoints == false) { // will only draw new if under max points
    tempX = constrain(mouseX, 0, width); // constrains mouseX by screen
    tempY = constrain(mouseY, 0, height);// constrains mouseY by screen
  }

  for (int i = 0; i < squigglesList.size(); i++) {
    Squiggle s = (Squiggle) squigglesList.get(i);
    s.display(); 
  }

}

void mouseDragged(){
  if (overMaxPoints == false) drawSketch(); // will only draw new if under max points
  recallSketch();
}

void mouseReleased(){ 
  if (storedCoord > 0){
    Squiggle squiggle = new Squiggle(storedXs,storedYs,storedCoord);
    squigglesList.add(squiggle);
  }

  resetSketch();
}


void drawSketch() {
  stroke(255);
  strokeWeight(1);
  line (mouseX, mouseY, pmouseX, pmouseY); // connect points to form line, using previous points // 
  storedXs[storedCoord] = tempX;
  storedYs[storedCoord] = tempY;
  storedCoord++; // increment place-holder as each point is drawn, to fill array
  if (storedCoord == maxPoints) overMaxPoints = true; // once available points max out, reset place-holder to 0
}

void recallSketch() {
  float lineXstart;
  float lineYstart;
  float lineXend;
  float lineYend;

  for (int i = 1; i < storedCoord; i++ ) // count through the coords
  {
    lineXstart = storedXs[i];
    lineYstart = storedYs[i];
    lineXend = storedXs[i-1];
    lineYend = storedYs[i-1];
    line(lineXstart, lineYstart, lineXend, lineYend); // random makes the drawing jagged
  }
}

void resetSketch() { // clears out temporary scketch array
  storedCoord = 0;
  overMaxPoints = false;

  for (int i = 0; i < maxPoints; i++ ){ // cycle through arrays and fill with 0
    storedXs[i] = 0;
    storedYs[i] = 0;
  }
}

class Squiggle {
  int[] x, y, dirX, dirY;
  float lineXstart, lineYstart, lineXend, lineYend;
  float[] moveX, moveY;

  Squiggle(int[] storedx, int[] storedy, int len) {
    x = new int[len];
    y = new int[len];
    moveX = new float[len];
    moveY = new float[len];
    dirX = new int[len];
    dirY = new int[len];

    for (int k =0; k < len; k++) {
      x[k] = storedx[k];
      y[k] = storedy[k];
      moveX[k] = 0;
      moveY[k] = 0;
      dirX[k] = 1;
      dirY[k] = 1;
    } 
  } 

  void display() {

    float speed = ((maxPoints-x.length)/10.0)+1;
    int gradient = x.length * 4;
    stroke(255-gradient, 255-gradient, 255-gradient,150);
    strokeWeight((x.length/5)+1);

    for (int j = 0; j < x.length; j++ ){
      if ( moveX[j]+x[j] > width) dirX[j] = -1;
      else if ( moveX[j]+x[j] < 0) dirX[j] = 1;
      if ( moveY[j]+y[j] > height) dirY[j] = -1;
      else if ( moveY[j]+y[j] < 0) dirY[j] = 1;
      moveX[j] = moveX[j] + dirX[j] * speed;
      moveY[j] = moveY[j] + dirY[j] * speed;
    }

    for (int i = 1; i < x.length; i++ ) // count through the coords
    {
      lineXstart = x[i] + moveX[i];
      lineYstart = y[i] + moveY[i];
      lineXend = x[i-1] + moveX[i-1];
      lineYend = y[i-1] + moveY[i-1];
      line(lineXstart, lineYstart, lineXend, lineYend); 
    }
  }
}

