
// July 2013, Haley Cope
// Light and black holes


//Globals
float[] lightXPos;
float[] lightYPos;
float[] lightXVel;
float[] lightYVel;
float[] orbitingPos;
float[] orbitingVel;
color[] colorValue;
float GRAVITY_FORCE = 2000;
final String[] LIGHT = {"l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t",  "l", "i", "g", "h", "t", "l", "i", "g", "h", "t",
"l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t",
"l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t", "l", "i", "g", "h", "t"};
final int LENGTHLIGHT = LIGHT.length;
final int WIDTH = 800;
final int BOX_WIDTH = 30;

void setup(){
  size(800, 800);
  background(25, 25, 25);
  fill(0, 0, 0);
  ellipse(WIDTH / 2, WIDTH / 2, 100, 100);
  lightXPos = new float[LENGTHLIGHT];
  lightYPos = new float[LENGTHLIGHT];
  lightXVel = new float[LENGTHLIGHT];
  lightYVel = new float[LENGTHLIGHT];
  colorValue = new color[LENGTHLIGHT];
  for (int i = 0; i < LENGTHLIGHT; i++){
    lightXPos[i] = random(0, WIDTH);
    lightYPos[i] = random(0, WIDTH);
    lightXVel[i] = random(-10, 10);
    lightYVel[i] = random(-10, 10);
    colorValue[i] = color(225, 225, 0);
  }
}


void draw(){
  background(0, 0, 0);
  textSize(12);
  fill(255);
 // text("Super Massive Black Hole", WIDTH / 2 - 40, WIDTH / 2 - 15, 100, 100);
  update_light();
  for (int i = 0; i < LENGTHLIGHT; i++){
    fill(colorValue[i]);
    text(LIGHT[i], lightXPos[i], lightYPos[i]);
  }
}

void update_light(){
  for(int i = 0; i < LENGTHLIGHT; i++){
    lightXPos[i] += lightXVel[i];
    if (lightXPos[i] > WIDTH){
      lightXPos[i] = 0;}
    if (lightXPos[i] < 0){
      lightXPos[i] = WIDTH;}
    lightYPos[i] += lightYVel[i];
    if (lightYPos[i] > WIDTH){
      lightYPos[i] = 0;}
    if (lightYPos[i] < 0){
      lightYPos[i] = WIDTH;}}
  for(int i = 0; i < LENGTHLIGHT; i++){
    float gravitationalForce = GRAVITY_FORCE / pow(dist(lightXPos[i], lightYPos[i], WIDTH/2, WIDTH/2), 3);
    lightXVel[i] -= gravitationalForce * (lightXPos[i] - WIDTH/2);
    lightYVel[i] -= gravitationalForce * (lightYPos[i] - WIDTH/2);}
  for (int i = 0; i < LENGTHLIGHT; i++){
    if(lightXPos[i] < (WIDTH / 2 + BOX_WIDTH) && lightXPos[i] > (WIDTH / 2 - BOX_WIDTH)){
      if(lightYPos[i] < (WIDTH / 2 + BOX_WIDTH) && lightYPos[i] > (WIDTH / 2 - BOX_WIDTH)){
        colorValue[i] = color(0, 0, 0);
        GRAVITY_FORCE += 5;
     }}}}
