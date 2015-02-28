
//This program draws on screen a moving ellipse with fade effect, and bounce the ellipse
//if it touches the output frame borders.

float winWidth = 400;
float winHeight = 400;
//Ellipses' initial positions
  float ellipseCoorX = (0.75)*winWidth;  //(3/4)th piece's of screen width's point coordinate
  float ellipseCoorY = (0.66)*winHeight; //(2/3)th piece's of screen height's coordinate
//To determine the size of Ellipse
  float ellipseWidth = 100;
  float ellipseHeight = 100;
//Ellipses' movement Speed
  float speedX = -5;
  float speedY = -3;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  drawEllipse(); 
  fadeEffect();
  movetoNextCoordinate();
  bounceEllipseIfTouchesScreen();
}

//Draws ellipses on the given coordinates.
void drawEllipse() {
 //fill(150); //if we want another effect with using fill function, we can try out this line.
 noFill();
 stroke(255,255,0);
 ellipse(ellipseCoorX, ellipseCoorY, ellipseWidth, ellipseHeight);
}

//FadeEffect Function works with using a special 
//usage of fill() function as fill(Gray, Alpha)
//And draws a rectangle, filled with that special color
//in each frame, so that in next frames we will see the 
//rectangles places on one another, and this creates a visual
//illusion of fade effect.
void fadeEffect() {
   noStroke();
   fill(5,10);
   rect(0, 0, winWidth, winHeight);  
}

//Changes the coordinates with speed Factors, written at variables section
void movetoNextCoordinate() {
  ellipseCoorX = ellipseCoorX + speedX;
  ellipseCoorY = ellipseCoorY + speedY;  
}

//Checks the coordinate of Ellipse and in case of a touch, reverses related speed's direction
//So with this way we guarantee the ellipses will always remain in output window frame.
void bounceEllipseIfTouchesScreen() {
  if (ellipseCoorX > ( winWidth - (ellipseWidth/2) ) || ellipseCoorX < (ellipseWidth/2) ){
    speedX = -speedX;
  }
  if (ellipseCoorY > ( winHeight - (ellipseHeight/2) ) || ellipseCoorY < (ellipseHeight/2) ){
    speedY = -speedY;
  } 
}





