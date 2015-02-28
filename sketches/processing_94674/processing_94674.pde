
int DownLeftx = 200;
int DownLefty = 600;
//--------------------
int DownRightx = 600;
int DownRighty = 600;
//--------------------
int UpLeftx = 200;
int UpLefty = 200;
//--------------------
int UpRightx = 600;
int UpRighty = 200;

int speed = 1;
int speed2 = 1;
int speed3 = 1;
int speed4 = 1;




void setup() {
  size(800, 800);
  //background(0);
}
void draw () { 
  frameRate(20);

  background(0);
  pushMatrix();
  translate(DownLeftx, DownLefty);
  rotate(QUARTER_PI);
  machDasDreieck(0, 0, 70, 170, 170, 170);
  LeftDown();
  popMatrix();
  //----------------------------------

  pushMatrix();
  translate(DownRightx, DownRighty);
  rotate((PI+PI)-QUARTER_PI);
  machDasDreieck(0, 0, 70, 170, 170, 170);
  RightDown();

  popMatrix();
  //----------------------------------

  pushMatrix();
  translate(UpLeftx, UpLefty);
  rotate(HALF_PI+(QUARTER_PI));
  machDasDreieck(0, 0, 70, 170, 170, 170);
  LeftUp();

  //angle += 0.1;
  popMatrix();
  //----------------------------------
  pushMatrix();
  translate(UpRightx, UpRighty);
  rotate(PI+(QUARTER_PI));
  machDasDreieck(0, 0, 70, 170, 170, 170);
  RightUp();

  //angle += 0.1;
  popMatrix();


 // println("mouse x = " +mouseX);
  //println("mouse y = " +mouseY);
}



void machDasDreieck(int P1X, int P1Y, int triangleSize, 
int R, int G, int B) {
int change = 36;
  fill(R, G, B);
  int P2X = (P1X+change)+triangleSize;
  float P2Y = P1Y+(triangleSize*1.5);
  int P3X = (P1X-change)-triangleSize;
  float P3Y = P1Y+(triangleSize*1.5);

    triangle(
  P1X, P1Y, //P1
  P2X, P2Y, //P2
  P3X, P3Y ); //P3 
  noFill();


  fill(255);
  rectMode(CENTER);
  rect(P2X, P2Y, 35, 35);
  rect(P3X, P3Y, 35, 35);
  //rect(P1X+triangleSize, P1Y+(triangleSize*1.5), 35, 35);
  //rect(P1X-triangleSize, P1Y+(triangleSize*1.5), 35, 35);
  noFill();
  fill(100);

  rect(P1X, P1Y, 80, 80);
  noFill();


  noStroke();
  noFill();
}

void LeftDown(){
  //println("      LeftDown x = "+ DownLeftx);
  //println("      LeftDown y = "+ DownLefty);
  //println("speed4 y = "+ speed4);
  //x=200
  //y=600
  if ( DownLeftx >=200 && DownLeftx <(width/2)){
  DownLeftx += speed4;}
  
  if ( DownLefty >=(height/2) && DownLefty <601){

  DownLefty -= speed4;
  }
  
  if (DownLeftx >= (width/2)) {
    DownLeftx =(200);
  }
 if (DownLefty <= (width/2)) {
    DownLefty =600;
  }
}
  
void LeftUp(){
  //x=200
  //y=600
  //println("(Leftup x = "+ UpLeftx);
  //println("Leftup y = "+ UpLefty);
  if ( UpLeftx >=200){
  UpLeftx += speed;}
  if ( UpLefty >=200){

  UpLefty += speed;
  }
  if (UpLeftx == (width/2)) {
    UpLeftx =200;
  }
  if (UpLefty >= width/2) {
    UpLefty =200;
  }
  }
void RightDown(){
  //println("RightDown x = "+ DownRightx);
  //println("RightDown y = "+ DownRighty);
  //x=600
  //y=600
  if ( DownRightx >400 && DownRightx <=600){
  DownRightx -= speed3;}
  
  if ( DownRighty >(height/2) && DownRighty <601){

  DownRighty -= speed3;
  }
  
 if (DownRightx <= (width/2)) {
    DownRightx =(600);
  }
  if (DownRighty <= (width/2)) {
    DownRighty =600;
  }
}
void RightUp(){
  //x=600
  //y=200
  if ( UpRightx <=600){
  UpRightx -= speed2;}
  if ( UpRighty >=200){

  UpRighty += speed2;
  }
  if (UpRightx <= width/2) {
    UpRightx =600;
  }
  if (UpRighty >= width/2) {
    UpRighty =200;
  }
  }


