
//Alex Lee, asl1@andrew.cmu.edu, HW9
//Copyright Alex Lee 2013 Pittsburgh

/*
A model solar system with randomized numbers of orbits, numbers of planets, and sizes. 

Press 1 to generate new solar system. 
Press 2 to generate a bird's eye view.
Press 3 to activate realistic planetary movement. 
Press 4 to change background color.

Press Q and A to rotate X-axis. 
Press W and S to rotate Y-axis.
Press E and D to rotate Z-axis.
*/



color bgColor;
color sunColor = #ED6E77;
color planetColor = #CC5781;
color asteroidColor = #8D538D;

int sunSize, planetSize;
float asteroidSize;
int orbitNum, objectNum, planetNum, totalNum;

float[] orbitRadius;

String[] type;
float[] orbit;
float[] angle;
float[] rotX;
float[] rotY;
float[] rotZ;
float[] rotDeltaX;
float[] rotDeltaY;
float[] rotDeltaZ;

float rotXSun;
float rotYSun;
float rotZSun;
float rotDeltaXSun;
float rotDeltaYSun;
float rotDeltaZSun;

float cameraEyeX;
float cameraEyeY;
float cameraEyeZ;
float cameraEyeChange = 10;

boolean cameraXIncreaseBoolean = false;
boolean cameraYIncreaseBoolean = false;
boolean cameraZIncreaseBoolean = false;
boolean cameraXDecreaseBoolean = false;
boolean cameraYDecreaseBoolean = false;
boolean cameraZDecreaseBoolean = false;

boolean whirlpoolBoolean = false;

void setup() {
  size(800, 800, P3D);  
  frameRate(30);
  restart();
}

void restart() {
  bgColor = #4E6069;//#9B2D47;//#C93759;//#9B3400;//#903700; 
  background(bgColor);
  sunSize = int(random(20, 70));//50;
  planetSize = int(random(5, 14));//10;
  asteroidSize = random(1.8, 2);//2;
  orbitNum = int(random(5, 18));//14;
  objectNum = int(random(80, 160));//120;
  planetNum = int(random(0, 4));//1;
  totalNum = orbitNum * objectNum;
  orbit = new float[totalNum]; 
  setOrbit();
  orbitRadius = new float[orbitNum];
  for(int i = 0; i < orbitRadius.length; i++) {
    orbitRadius[i] = 60 * i + 150; //50
  }
  type = new String[totalNum];
  setType();
  angle = new float[totalNum];
  rotX = new float[totalNum];
  rotY = new float[totalNum];
  rotZ = new float[totalNum];
  rotDeltaX = new float[totalNum];
  rotDeltaY = new float[totalNum];
  rotDeltaZ = new float[totalNum];
  /*
  for(int i = 0; i < rotDeltaX.length; i++) {
    setRotation(i);
  }
  */
  
  cameraEyeX = 0;
  cameraEyeY = -520;
  cameraEyeZ = 670;
  
  setValue(angle, 0, 360);
  int rotAngle = 360;
  setValue(rotX, 0, rotAngle);
  setValue(rotY, 0, rotAngle);
  setValue(rotZ, 0, rotAngle);
  int rotDeltaAngle = 5;
  setValue(rotDeltaX, 0, rotDeltaAngle);
  setValue(rotDeltaY, 0, rotDeltaAngle);
  setValue(rotDeltaZ, 0, rotDeltaAngle);
  
  rotXSun += random(2, 360);
  rotYSun += random(2, 360);
  rotZSun += random(2, 360);
  rotDeltaXSun = -.25;//-.25;//random(0, 3);
  rotDeltaYSun = -.5;//random(0, 3);
  rotDeltaZSun = -.5;//-.5;//random(0, 3);
}

void setOrbit() {
  for(int i = 0; i < totalNum; i++) {
    orbit[i] = ceil(i/objectNum) + 1;
  }
}

void setType() {
  for(int i = 0; i < totalNum; i++) {
    if((i % objectNum) <= planetNum) {
      type[i] = "Planet";
    }
    else {
      type[i] = "Asteroid";
    }
  }
  //println(type);
}

void setValue(float[] Mode, int min, int max) {
  for(int i = 0; i < Mode.length; i++) {
    Mode[i] = int(random(min, max));
  }
}

void draw() {
  moveCamera();
  drawBackground();
  //drawAxisLines();
  pushMatrix();
  rotateSun();
  drawSun();
  popMatrix();
  for(int i = 0; i < totalNum; i++) {
    pushMatrix();
    drawObject(orbit[i], angle[i], type[i], i);
    popMatrix();
  }
}

void moveCamera() {
  if(cameraXIncreaseBoolean) {
    cameraEyeX += cameraEyeChange;
  }
  if(cameraXDecreaseBoolean) {
    cameraEyeX -= cameraEyeChange;
  }
  if(cameraYIncreaseBoolean) {
    cameraEyeY += cameraEyeChange;
  }
  if(cameraYDecreaseBoolean) {
    cameraEyeY -= cameraEyeChange;
  }
  if(cameraZIncreaseBoolean) {
    cameraEyeZ += cameraEyeChange;
  }
  if(cameraZDecreaseBoolean) {
    cameraEyeZ -= cameraEyeChange;
  }
}

void drawBackground() {
  camera(cameraEyeX, cameraEyeY, cameraEyeZ, 0, 0, 0, 0, 1, 0);
  background(bgColor);
  drawGradient();
  //orange
  pointLight(255, 243, 5, 0, 0, 0);
  //light yellow
  pointLight(255, 244, 142, 0, -200, 0);
  pointLight(255, 244, 142, 0, 200, 0);
  
  pointLight(103, 0, 33, 0, 0, 1500);
  pointLight(103, 0, 33, 0, 0, -1500);
  pointLight(103, 0, 33, 1500, 0, 0);
  pointLight(103, 0, 33, -1500, 0, 0);
  //lights();//add more lights
}

void drawGradient() {
}

void drawAxisLines() {
  stroke(#FFFFFF);
  strokeWeight(3);
  stroke( 200, 200, 0 );
  line( 0, 0, 2000, 0, 0, -2000 );  // Z axis line
  stroke( 0, 2000, 2000 );
  line( 0, 2000, 0, 0, -2000, 0 );  // Y axis line
  stroke( 02000, 0, 2000 );
  line( 2000, 0, 0, -2000, 0, 0 );  // X axis line
}

void rotateSun() {
  rotXSun += rotDeltaXSun;
  rotYSun += rotDeltaYSun;
  rotZSun += rotDeltaZSun;
  rotateX(radians(rotXSun));
  rotateY(radians(rotYSun));
  rotateZ(radians(rotZSun));
}

void drawSun() {
  noStroke();
  fill(sunColor);
  box(sunSize, sunSize, sunSize);
}

void rotateObject(int Num) {
  rotX[Num] += rotDeltaX[Num];
  rotY[Num] += rotDeltaY[Num];
  rotZ[Num] += rotDeltaZ[Num];
  rotateX(radians(rotX[Num]));
  rotateY(radians(rotY[Num]));
  rotateZ(radians(rotZ[Num]));
}

void drawObject(float Orbit, float Angle, String Type, int Num) {
  //stroke(255);
  //strokeWeight(.2);
  noStroke();
  float whirlpool = (Orbit/3);
  if(whirlpoolBoolean) {
    angle[Num] += .6/whirlpool;
  }
  else {
    angle[Num] += .2;
  }
  translate(orbitRadius[int(Orbit-1)] * cos(radians(Angle)), 0, orbitRadius[int(Orbit-1)] * sin(radians(Angle)));
  rotateObject(Num);
  if(Type == "Planet") {
    fill(planetColor);
    box(planetSize, planetSize, planetSize);
  }
  else if(Type == "Asteroid") {
    fill(asteroidColor);
    box(asteroidSize, asteroidSize, asteroidSize);
  }
}

void keyPressed() {
  if(key== 'Q' || key == 'q') {
    cameraXIncreaseBoolean = true;
  }
  if(key== 'A' || key == 'a') {
    cameraXDecreaseBoolean = true;
  }
  if(key== 'W' || key == 'w') {
    cameraYIncreaseBoolean = true;
  }
  if(key== 'S' || key == 's') {
    cameraYDecreaseBoolean = true;
  }
  if(key== 'E' || key == 'e') {
    cameraZIncreaseBoolean = true;
  }
  if(key== 'D' || key == 'd') {
    cameraZDecreaseBoolean = true;
  }
  if(key == '1') {
    restart();
  }
  if(key == '2') {
    restart();
    cameraEyeX = 1;
    cameraEyeY = -900;
    cameraEyeZ = 0;
  }
  if(key == '3') {
    if(whirlpoolBoolean) {
      whirlpoolBoolean = false;
    }
    else {
      whirlpoolBoolean = true;
    }
  }
  if(key == '4') {
    bgColor = #2C7CA2;
  }
  if(key == '5') {
    restart();
    cameraEyeX = 1;
    cameraEyeY = -900;
    cameraEyeZ = 0;
    whirlpoolBoolean = true;
    sunSize = 50;
    planetSize = 10;
    orbitNum = 18;
    objectNum = 160;
    bgColor = #C4CfC5;
  }
  if(key == '6') {
    bgColor = color(random(255), random(255), random(255));
  }
}

void keyReleased() {
  if(key== 'Q' || key == 'q') {
    cameraXIncreaseBoolean = false;
  }
  if(key== 'A' || key == 'a') {
    cameraXDecreaseBoolean = false;
  }
  if(key== 'W' || key == 'w') {
    cameraYIncreaseBoolean = false;
  }
  if(key== 'S' || key == 's') {
    cameraYDecreaseBoolean = false;
  }
  if(key== 'E' || key == 'e') {
    cameraZIncreaseBoolean = false;
  }
  if(key== 'D' || key == 'd') {
    cameraZDecreaseBoolean = false;
  }
}
  


