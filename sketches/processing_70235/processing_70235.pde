
/*
Dan Olson, 2012
Procedural version, codename: "84 Visualizer"
*/

float col,col1,col2;
int udlrswitch;
float randMillis;
int timer;
float randMillis2;
int timer2;
float randstroke;
float wdth, hght;

//Create the initial array values on startup
int num = int(random(1,11)); //number of elements in the array
//Initalize the arrays
float[] x = new float[num];
float[] y = new float[num];
float[] x2 = new float[num];
float[] y2 = new float[num];
float[] speedX = new float[num];
float[] speedY = new float[num];


//import processing.pdf.*;

int boolRect,boolGrid, boolEllipse, boolLine, boolDoubleLine, boolPoint;

int boolGravity, boolMoveXY, boolUDLR, boolRandomSpeed;

void setup() {
//Change the initial array values on setup-Mouseclick
num = int(random(1,11));
x = new float[num];
y = new float[num];
x2 = new float[num];
y2 = new float[num];
speedX = new float[num];
speedY = new float[num];

//size(window.innerWidth,windows.innerHeight);
size(500,500);
background(0);
//beginRecord(PDF, "filename.pdf");

wdth = random(10,70); //Randomizes the size of squares and circles
hght = wdth;

boolRect = int(random(2));
boolEllipse = int(random(2));
boolLine = int(random(2));
boolDoubleLine = int(random(2));
boolPoint = int(random(2));

    
boolGravity = int(random(2));
boolMoveXY = int(random(2));
boolUDLR = int(random(2));
boolRandomSpeed = int(random(2));

//Setup-Array
for (int i = 0; i < num; i++) {
  x[i] = random(width);
  y[i] = random(height);
  x2[i] = random(width);
  y2[i] = random(height);
 
}
}
void draw(){
   
 drawObject();
 drawMovement();
 randomcoolColors();
 speedControl();
 resetScreen();
 
 
 
 //Print Functions
 /*
 for (int i = 0; i < num; i++) {
 println("speedX " + speedX[i]);
 println("speedY " + speedY[i]);
 println("Gravity " + boolGravity);
 println("UDLR " + boolUDLR);
 println("moveXY " + boolMoveXY);
 println("randomSpeed " + boolRandomSpeed);
 println("resetScreen " + randMillis2);
 }
 */
}


void drawObject(){
for (int i = 0; i < num; i++) { 
  fill(0);

  if (boolRect == 1) {
    rect(x[i],y[i],wdth,hght);
    boolEllipse = 0;
  }
  if (boolLine == 1) {
    line(x[i],y[i],x2[i],y2[i]);
  }
  if (boolEllipse == 1) {
    ellipse(x[i],y[i],wdth,hght);
    boolRect = 0;
  }
  if (boolDoubleLine == 1) {
    line(0, y[i], width, x[i]);
    line(y[i], 0, x[i], width);
  }
  if (boolPoint == 1) { 
    point(x[i],y[i]);
  }
  if (boolRect == 0 && boolLine == 0 && boolEllipse == 0 && boolDoubleLine == 0 && boolPoint == 0) {
  boolPoint = 1;
}
  }
}

void drawMovement() {

  if ( boolRandomSpeed == 1) {
    randomSpeed();
  }
  if ( boolGravity == 1) {
  gravity();
  }
  if ( boolMoveXY == 1) {
  moveXY();
  }
  if ( boolUDLR == 1) {
  udlrMove();
  }
  if ( boolMoveXY == 0 && boolUDLR == 0) { //Runs the default mode
  boolMoveXY = 1;
  }
  bounceReflection();
  
  
  randomTimeLoop();//Always on
  constrainScreen();

}
void randomSpeed(){
  for (int i = 0; i < num; i++) {
speedX[i] += random(-1.5,1.5);
speedY[i] += random(-1.5,1.5);
  }
}
void speedControl(){
  for (int i = 0; i < num; i++) {
  if (speedX[i] >= 10 || speedX[i] == 0.0){
    speedX[i] = random(1,1.5);
  }
  if (speedY[i] >= 10 || speedY[i] == 0.0){
    speedY[i] = random(1,1.5);
  }
  }
}
void moveXY(){
  for (int i = 0; i < num; i++) {
  x[i] += speedX[i];
  y[i] += speedY[i];
  }
}
void randomTimeLoop() {
if(millis() - timer >= randMillis) {
randMillis = random(200,8000);
udlrswitch = int(random(0,4)); //udlr, direction
randstroke = int(random(0,8)); //randomcoolcolors
timer = millis();
}
}
void resetScreen() {
if(millis() - timer2 >= randMillis2) {
randMillis2 = random(8000,20000);
timer2 = millis();
setup();
}
}

void udlrMove() {
  for (int i = 0; i < num; i++) {
randMillis = random(100,500);
int sRate = 5;
if (udlrswitch == 0) {
x[i]+=sRate;
//x[i] += speedX[i];
}
if (udlrswitch == 1) {
x[i]-=sRate;
//x[i]-=speedX[i];
}
if (udlrswitch == 2) {
y[i]+=sRate;
//x[i]+=speedY[i];
}
if (udlrswitch == 3) {
y[i]-=sRate;
//y[i]-=speedY[i];
}
  }
}
void bounceReflection() {
  for (int i = 0; i < num; i++) {
  if ( x[i] > width) { //Right-side
    speedX[i] = speedX[i] * -1;
    if (boolGravity == 0) {
    speedX[i] = random(-2,-8);
    }
  }
  if ( x[i] < 0) { //Left-side
    speedX[i] = speedX[i] * -1;
     if (boolGravity == 0) {
    speedX[i] = random(2,8);
     }
  }
  if ( y[i] > height) { //Bottom
    speedY[i] = speedY[i] * -1;
     if (boolGravity == 0) {
    speedY[i] = random(-2,-8);
     }
  }
  if ( y[i] < 0) { //Top
    speedY[i] = speedY[i] * -1;
     if (boolGravity == 0) {
    speedY[i] = random(2,8);
     }
  }
  }
}

void gravity() {
  for (int i = 0; i < num; i++) {
  float grav = random(.5);
  speedY[i] += grav;
  if (grav <= .005) { 
  negativeGravity();
  }
  }
}
void negativeGravity(){
  for (int i = 0; i < num; i++) {
  float grav = 1;
  speedY[i] -= grav;
}
}
void constrainScreen(){
  for (int i = 0; i < num; i++) {
x[i] = constrain(x[i],0,width);
y[i] = constrain(y[i],0,height);
}
}

void randomcoolColors(){
if (randstroke == 0){
stroke(76,random(220,255),50);//Green
}
if (randstroke == 1){
stroke(10,random(10,150),random(200,255));//Dark Blue
}
if (randstroke == 2){
stroke(255,random(150,255),40);//Gold/Yellow
}
if (randstroke == 3){
stroke(random(25),217,random(255));//Blue-Green
}
if (randstroke == 4){
stroke(255,random(90),random(233)); //hot pink
}
if (randstroke == 5){
stroke(255,random(200),2);//red-orange
}
if (randstroke == 6){
stroke(50,random(150,255),255);//Aqua-Blue
}
if (randstroke == 7){
stroke(random(20,250),10,random(230,255));//Purple
}

}
void mousePressed(){ //resets the background on mouse click
if (mouseButton == RIGHT) {
noLoop();
//endRecord();
} else {
  //loop();
  setup();
}
}
void mouseReleased() {
  loop();
}

