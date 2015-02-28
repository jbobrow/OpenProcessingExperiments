
//camera fields
PVector camPosition;
PVector camFocus;
float focusAngle = - PI / 2; 

//time elapsed since last call to draw()
int lastTime = 0;
int timeElapsed = 0;

//side-effect fonction : given focusAngle, set the new camFocus.
void computeCamFocus() {
  
  camFocus.x = camPosition.x; 
  camFocus.y = camPosition.y - 50;

  /*Math here !
   If you rotate point (px, py) around point (ox, oy) by angle theta you'll get:
   
   p'x = cos(heta) * (px-ox) - sin(theta) * (py-oy) + ox
   p'y = sin(theta) * (px-ox) + cos(theta) * (py-oy) + oy
   */
   
  float diffX = camFocus.x - camPosition.x; 
  float diffY = camFocus.y - camPosition.y;
  float sinAngle = sin(focusAngle); //Little optimisation: do not recompute twice the cos and sin value.
  float cosAngle = cos(focusAngle); //Little optimisation: do not recompute twice the cos and sin value.

  camFocus.x = cosAngle * diffX  - sinAngle * diffY + camPosition.x;
  camFocus.y = sinAngle * diffX  + cosAngle * diffY + camPosition.y;
}

void setup() {

  size(800, 600);
  frameRate(30);

  smooth();
  
  camPosition = new PVector(167, 120);
  camFocus = new PVector();
}

void keyPressed() {

  float camShift = timeElapsed / 10.0;

  if (keyCode == UP) {
    camPosition.y -=camShift;
  } 
  if (keyCode == DOWN) {
    camPosition.y +=camShift;
  }
  if (keyCode == LEFT) {
    camPosition.x -=camShift;
  } 
  if (keyCode == RIGHT) {
    camPosition.x +=camShift;
  }
}

void mouseDragged() {
  int diffX = pmouseX - mouseX;
  int diffY = pmouseY - mouseY;

  focusAngle -= (diffX * PI / 40f) ;
}

void draw() {

  background(125);
  timeElapsed = millis() - lastTime;
  lastTime+=timeElapsed;

  computeCamFocus();

  fill(255, 122, 122);  
  ellipse(camPosition.x, camPosition.y, 7, 7);

  fill(122, 122, 255);
  line(camPosition.x, camPosition.y, camFocus.x, camFocus.y);
}


