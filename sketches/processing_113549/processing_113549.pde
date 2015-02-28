
///Eunsil Choi 10/03/2013
/////// white
int circleX = 0;
int circleY = 0;
int circleW = 20;
int speedX = 0;
int speedY = 2;
/////// grey
int circleA = 0;
int circleB = 0;
int circleC = 30;
int speedA = 0;
int speedB = 3;
////// red
int circleS = 150;
int circleD = 0;
int circleF = 10;
int speedS = 0;
int speedD = 4;
////// orange
int circleG = 300;
int circleH = 0;
int circleJ = 14;
int speedG = 3;
int speedH = 2;
////// Green
int circleE = 530;
int circleR = 0;
int circleT = 10;
int speedE = 1;
int speedR = 1;

void setup() {
  size(650,350);
  smooth();
  noStroke();
}

void draw() {
  background(220,100,130);  
  ////middle line
  fill(80,130,200);
  rect(250,0,50,650);
  /////////black ball on the background
  fill(30);
  circleX = circleX+3;
  circleY = circleY+3;
  fill(220);
  ellipse(circleX, circleY,circleW, circleW);
  if(circleX>width) {
    circleX = 0;}
  if(circleY>height) {
    circleY = 0;}
  /////////the first and third lines
  fill(90,70,170);
  rect(100,0,50,650); 
  rect(480,0,50,650);
  
  ////
  fill(0,130, 130);
  circleA = circleA+speedA -3;
  circleB = circleB+speedB;
  ellipse(circleA, circleB,circleC, circleC);
  if(circleA<0){
    circleA=circleA+3;
    circleB=circleB+3;
    speedA = speedA + 5;}
  if(circleB<0) {
    speedB = -speedB;}
  if(circleA>90) {
    speedA = -1 * speedA;}
  if(circleB>height) {
    speedB = -1 * speedB;}
 
 //////
  fill(210,30,90);
  circleS = circleS+speedS -3;
  circleD = circleD+speedD;
  ellipse(circleS, circleD,2*circleF,2*circleF);
  if(circleS<150){
    circleS=circleS+3;
    circleD=circleD+3;
    speedS = speedS + 4;}
  if(circleD<0) {
    speedD = -speedD;}
  if(circleS>250) {
    speedS = -1 * speedS;}
  if(circleD>height) {
    speedD = -1 * speedD;}
///////
   fill(225,130,0);
  circleG = circleG+speedG;
  circleH = circleH+speedH;
  ellipse(circleG, circleH,circleJ,circleJ);
  if(circleG<300){
    circleG=circleG;
    circleH=circleH+2;
    speedG = speedG +1;}
  if(circleH<0) {
    speedH = -speedH;}
  if(circleG>480) {
    circleG=circleG;
    circleH=circleH+2;
    speedG = -speedG;}
  if(circleH>height) {
    speedH = - speedH;}
////////
  fill(200,200,150);
  circleE = circleE+speedE;
  circleR = circleR+speedR;
  ellipse(circleE, circleR,circleT,circleT);
  if(circleE<530){
    circleE=circleE+5;
    circleR=circleR+5;
    speedE = speedE +2;}
  if(circleR<0) {
    speedR = -speedR;}
  if(circleE>width) {
    circleE=circleE-5;
    circleR=circleR-5;
    speedE= -speedE;}
  if(circleR>height) {
    speedR = -speedR;}


}
