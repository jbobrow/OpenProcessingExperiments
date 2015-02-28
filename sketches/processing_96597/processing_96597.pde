
/*RobotHead myRobotHead;

void setup(){
size(500,500);
myRobotHead= new RobotHead ();
}

void draw(){
myRobotHead.display();
myRobotHead.move();
}*/


//Making a robot
// L- left,r-right,w-width,x-X axis,Y-Yaxis
//robot head
int hY=105;
int hX=278;
int hW=45;
int hL=45;
int hsX=323;
int hsY=150;
int hsX2=329;
int hsY2=94;
int hsX3=326;
int htX=279;
int htY=104;
int htX2=286;
int htY2=94;
int htX3=329;
int htX4=324;
// rbot neck
int nX=295;
int nY=150;
int nL=20;
int nW=10;
//robot body
int bX=258;
int bY=165;
int bW=85;
int bL=80;
int blX=258;
int blY=244;
int blX2=251;
int blY2=245;
int blY3=155;
int blX3=248;
int brX=344;
int brY=245;
int brX2=350;
int brY2=238;
int brX3=349;
int brY3=155;
int blsX=258;
int blsY=166;
int blsX2=253;
int blsY2=154;
int blsX3=296;
int blsY3=185;
int brsX=304;
int brsY=166;
int brsX2=304;
int brsY2=154;
int brsX3=346;
int brsX4=343;
int brsY3=165;
//robot right shoulder using arc
float rsX=345;
float rsY=180;
float rsW=30;
float rsH=30;
float rsStart=0;
float rsStop=6.283185307;
float rsMode=OPEN;
//robot left shoulder
float lsX=255;
float lsY=180;
float lsW=30;
float lsH=30;
//int 

//robot right arms
int raX=357;
int raY=179;
int raX2=360;
int raY2=180;
int raX3=368;
int raY3=182;
int raX4=376;
int raY4=184;
int raX5=379;
int raY5=198;
int raX6=379;
int raY6=219;
int raX7=361;
int raY7=198;
int raW=30;
int raL=40;
//robot left arm
int laX=258;
int laY=198;
int laW=30;
int laL=40;
int laX2=258;
int laX3=232;
int laX4=225;
int laX5=220;
int laX6=205;
// robot right leg
int rX=269;
int rY=264;
int rX2=15;
int rY2=70;

//robot left leg
int lX=313;
int lY=264;
// robot left feet
int flX=268;
int flY=333;
int flY2=344;
int flX2=284;
int flX3=257;
//robot right feet
int frX=313;
int frX2=328;
int frX3=339;
// robot mouth
int mL=10;
int mW=40;
int mX=280;
int mY=135;
// robot  eyes
int reL=10;
int reW=10;
int reX=313;
int reY=120;
int leX=287;
// robot anteena
int anteenaX=306;
int anteenaY=103;
int anteenaX2=306;
int anteenaY2=71;
//robot hip
float hipX=275;
float hipY=246;
float hipX2=326;
float hipY2=246;
float hipX3=344;
float hipY3=265;
float hipX4=256;
float hipY4=265;
int hipX5=277;
int hipY5=265;
int hipW=30;
int hipL=30;
int hipX6=320;
int hipY6=265;
//robot finger
int fingerX=207;
int fingerY=238;
int fingerX2=207;
int fingerY2=252;
int fingerX3=201;
int fingerW=10;
int fingerL=10;
// second finger
int sfingerX=222;
int sfingerX2=222;
int sfingerX3=216;
//third finger
int tfingerX=235;
int tfingerX2=235;
int tfingerX3=231;
//fouth finger
int fFingerX=362;
int fFingerX2=362;
int fFingerX3=362;
// fifth finger
int fiFingerX=376;
int fiFingerX2=376;
int fiFingerX3=376;
// six finger
int sifingerX=391;
int sifingerX2=391;
int sifingerX3=391;
int i=0;
float r,g,b;
RobotHead myRobotHead;


boolean robotmove=false;
int speed=1;
PImage img;
void setup() {
  size(500,500);
myRobotHead= new RobotHead ();
}



  
  

void draw() {
  myRobotHead.display();
myRobotHead.move();
img= loadImage("DanceFloor.jpg");
  image(img, 0, 150);
background(50);
  robot(430,500,bX,bX);
  move();
  int x=height/2;
  int y=width/2;
  int w=0;
  int l=0;
  
  ellipse(reX,reY,reW,reL);
  ellipse(leX,reY,reW,reL);
  if(bX<width/2||x>width){
    //speed=speed*-1;
    //bX=bX+speed;
  }
  if(robotmove){
    bX=bX;
    
  }
    else{
      bX=bX+speed;}


if(bX<0|| bX>width){
  speed=speed*-1;
}
}











void move() {
  //bX=bX+1;
  
 fingerY2=fingerY2+speed;
 
 //if(fingerX<height){
  //fingerY2=speed*-1;
 } //}} }

void robot(int x, int y, int size, int fill) {
  
  //ellipse(x,y,size,fill);
//size(x,y);
  fill(255);
  line(fingerX, fingerY, fingerX2, fingerY2);
  rect(fingerX3, fingerY2, fingerW, fingerL);
  line(sfingerX, fingerY, sfingerX2, fingerY2);
  rect(sfingerX3, fingerY2, fingerW, fingerL);
  line(tfingerX, fingerY, tfingerX2, fingerY2);
  rect(tfingerX3, fingerY2, fingerW, fingerL);
  line(fFingerX, fingerY, fFingerX2, fingerY2);
  ellipse(fFingerX, fingerY2, fingerW, fingerL);
  line(fiFingerX, fingerY, fiFingerX, fingerY2);
  ellipse(fiFingerX, fingerY2, fingerW, fingerL);
  line(sifingerX, fingerY, sifingerX, fingerY2);
  ellipse(sifingerX, fingerY2, fingerW, fingerL);
  beginShape();
  vertex(blX, blY);
  vertex(blX2, blY2);
  vertex(blX2, blY3);
  vertex(blX, blY3);
  endShape();
  beginShape();
  vertex(hsX, hsY);   
  vertex(hsX2, hsY);
  vertex(hsX2, hsY2);
  vertex(hsX3, hsY2);
  endShape();
  //noFill();
  beginShape();
  vertex(brX, brY);
  vertex(brX2, brY2);
  vertex(brX3, brY3);
  vertex(brX, brY3);
  endShape();
  beginShape();
  vertex(blsX, blsY);
  vertex(blsX2, blsY2);
  vertex(blsX3, blsY2);
  vertex(blsX3, brsY3);
  endShape();
  beginShape();
  vertex(brsX, brsY);
  vertex(brsX2, brsY2);
  vertex(brsX3, brsY2);
  vertex(brsX4, brsY3);
  endShape();
  rect(hX, hY, hW, hL);
  rect(nX, nY, nW, nL);
  rect(laX6, raY7, laW, laL);
  rect(raX7, raY7, raW, raL);
  // fill(255);
  beginShape();
  noFill();
  curveVertex(raX, raY);
  curveVertex(raX2, raY2);
  curveVertex(raX3, raY3);
  curveVertex(raX4, raY4);
  curveVertex(raX5, raY5);
  curveVertex(raX6, raY6);
  endShape();
  beginShape();
  curveVertex(laX, raY);
  curveVertex(laX2, raY2);
  curveVertex(laX3, raY3);
  curveVertex(laX4, raY4);
  curveVertex(laX5, raY5);
  curveVertex(laX6, raY6);
  endShape();
  fill(255);
 //arc(lsX, lsY, lsW, lsH, rsStart, rsStop, rsMode);
 //arc(rsX, rsY, rsW, rsH, rsStart, rsStop, rsMode);
  rect(bX, bY, bW, bL);
  rect(rX, rY, rX2, rY2);
  rect(lX, lY, rX2, rY2);
 //arc(hipX5, hipY5, hipW, hipL, 0, PI, OPEN);
 //arc(hipX6, hipY6, hipW, hipL, 0, PI, OPEN);
  ellipse(reX, reY, reW, reL);
  ellipse(leX, reY, reW, reL);
  rect(mX, mY, mW, mL);
  line(anteenaX, anteenaY, anteenaX2, anteenaY2);
  //ellipse(anteenaX2, anteenaY2, 20, 20);
  quad(hipX, hipY, hipX2, hipY2, hipX3, hipY3, hipX4, hipY4);
  beginShape();
  vertex(flX, flY);
  vertex(flX2, flY);
  vertex(flX2, flY2);
  vertex(flX3, flY2);
  vertex(flX, flY);
  endShape();
  beginShape();
  vertex(frX, flY);
  vertex(frX2, flY);
  vertex(frX3, flY2);
  vertex(frX, flY2);
  vertex(frX, flY);
  endShape();
  beginShape();
  vertex(htX, htY);
  vertex(htX2, htY2);
  vertex(htX3, htY2);
  vertex(htX4, htY);
  endShape();
  stroke(0);
 // randomSeed(10);
  fill(r,g,b);
  ellipse(anteenaX2, anteenaY2, 20, 20);
  //line(0, height/2, width, height/2);
  //line(width/2, 0, width/2, height);
  println(mouseX);
  println(mouseY);
  r=random (255);
  b=random(0);
  g=random(0);
}
void mousePressed(){
  if(mouseX>bX&&mouseX<bX+bW&& mouseY>bY&&mouseY<bY+bL){
  robotmove=!robotmove;
  }}
  class RobotHead {
  int hY;
  int hX;
  int hW;
  int hL;
  int hsX;
  int hsY;
  int hsX2;
  int hsY2;
  int hsX3;
  int htX;
  int htY;
  int htX2;
  int htY2;
  int htX3;
  int htX4;
  int speed;
  RobotHead() {
    hY=105;
    hX=278;
    hW=45;
    hL=45;
    hsX=323;
    hsY=150;
    hsX2=329;
    hsY2=94;
    hsX3=326;
    htX=279;
    htY=104;
    htX2=286;
    htY2=94;
    htX3=329;
    htX4=324;
  }

  void move() {
    hY=hY+speed;
    hX=hX+speed;
    hW=hW+speed;
    hL= hL+speed;
    hsX=hsX+speed;
    hsY= hsY+speed;
    hsX2=hsX2+speed;
    hsY2=hsX2+speed;
    hsX3= hsX3+speed;
    htX=htX+speed;
    htY=htY+speed;
    htX2=htX2+speed;
    htY2=htY2+speed;
    htX3=htX3+speed;
    htX4= htX4+speed;
  }

  void display() {
    beginShape();
    vertex(htX, htY);
    vertex(htX2, htY2);
    vertex(htX3, htY2);
    vertex(htX4, htY);
    endShape();
    rect(hX, hY, hW, hL);
    beginShape();
    vertex(hsX, hsY);   
    vertex(hsX2, hsY);
    vertex(hsX2, hsY2);
    vertex(hsX3, hsY2);
    endShape();
  }
}

/*class RobotHead {
  int hY;
  int hX;
  int hW;
  int hL;
  int hsX;
  int hsY;
  int hsX2;
  int hsY2;
  int hsX3;
  int htX;
  int htY;
  int htX2;
  int htY2;
  int htX3;
  int htX4;
  int speed;
  RobotHead() {
    hY=105;
    hX=278;
    hW=45;
    hL=45;
    hsX=323;
    hsY=150;
    hsX2=329;
    hsY2=94;
    hsX3=326;
    htX=279;
    htY=104;
    htX2=286;
    htY2=94;
    htX3=329;
    htX4=324;
  }

  void move() {
    hY=hY+speed;
    hX=hX+speed;
    hW=hW+speed;
    hL= hL+speed;
    hsX=hsX+speed;
    hsY= hsY+speed;
    hsX2=hsX2+speed;
    hsY2=hsX2+speed;
    hsX3= hsX3+speed;
    htX=htX+speed;
    htY=htY+speed;
    htX2=htX2+speed;
    htY2=htY2+speed;
    htX3=htX3+speed;
    htX4= htX4+speed;
  }

  void display() {
    beginShape();
    vertex(htX, htY);
    vertex(htX2, htY2);
    vertex(htX3, htY2);
    vertex(htX4, htY);
    endShape();
    rect(hX, hY, hW, hL);
    beginShape();
    vertex(hsX, hsY);   
    vertex(hsX2, hsY);
    vertex(hsX2, hsY2);
    vertex(hsX3, hsY2);
    endShape();
  }
}*/




