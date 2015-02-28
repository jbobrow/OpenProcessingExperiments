
int numberBalls = 500;
float shakeRadiusX= random(10, 30);
float shakeRadiusY= random(10, 30);
float xoff[] = new float[numberBalls];
float yoff[] = new float[numberBalls];
float beginX[] = new float[numberBalls];
float beginY[] = new float[numberBalls];
float xPos[] = new float[numberBalls];
float yPos[]= new float[numberBalls];
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];
float o[] = new float[numberBalls];

int dir;
boolean PressAndDraw = true;
//int ScreenSize = 600;

void setup() {
  size(600, 600);
  smooth();
  //start the beginning point
  for (int i = 0; i<numberBalls; i++) {
    beginX[i] = random (0, 600);
    beginY[i] = random (0, 600);
    background(255);
    r[i]=0;
    g[i]=0;
    b[i]=0;
    o[i]=100;
  }
  dir = 1;
}
void draw() {
  if (PressAndDraw) {
    background(255);
  }
  if (keyPressed == true) {
    fill(255, 255, 255, 80);
    rect(0, 0, 600, 600);
  }
  //shaking gesture
  for (int i = 0; i<numberBalls; i++) {
    xoff[i] = xoff[i] + random(-.09, .01);
    yoff[i] = yoff[i] + random(-.09, .01);
    xPos[i] = (noise(xoff[i])*(shakeRadiusX)) + beginX[i];
    yPos[i] = (noise(yoff[i])*(shakeRadiusY)) + beginY[i];
    // shaking circle



    // figure out required direction
    float dirX = (mouseX - xPos[i]) * dir;
    float dirY = (mouseY - yPos[i]) * dir;
    if ((dirX <= .0001 || dirX >= .001 ) && (dirY <= .0001 || dirY >= -.0001)) { 
      // make it the unit vector
      float distance = sqrt((dirX * dirX) + (dirY * dirY));

      beginX[i] += dirX / distance;
      beginY[i] += dirY / distance;
      //
    }

    //println("X " + xPos[i] + " " + dirX + " " + distance + " " + dirX/distance);
    //println("Y " + yPos[i] + " " + dirY + " " + distance + " " + dirY/distance);

    //  

    //   noStroke();

    fill(r[i], g[i], b[i], o[i]);    
    ellipse(xPos[i], yPos[i], 1, 1);
  }
}

void mousePressed() {
  dir=-1;
  PressAndDraw = false; 
  for (int i = 0; i<255; i++) {
  r[i]=random(250,255);
  g[i]=random(0,15);
  b[i]=random(150,200); 
  o[i]=random(50,100);
  noStroke();
  }

}
void mouseReleased() {
  dir=1;  
  for (int i = 0; i<255; i++) {
  r[i]=random(250,255);
  g[i]=random(250,255);
  b[i]=random(40,255);
  o[i]=random(60,80);
  noStroke();
  }
}


