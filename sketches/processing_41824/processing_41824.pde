
PImage img;
PImage img2;
int prevSec;
int millisRolloverTime;

void setup () {
  
  size (500,700);
  img = loadImage("chanl.png");
  img2 = loadImage("candl.png");
  smooth ();
  millisRolloverTime = 0;
  
  
}

void draw (){
  background (100);
  
  // Fetch the current time
  int H = hour();
  int M = minute();
  int S = second();
  
  if (prevSec != S){
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;
  
  
  
  //Draw Chandelier & Candles
  image (img,0,0);
  for (int i = 5; i<480; i+=41){
  image (img2,i,580);
  }


//Draw Candle lights  
  if (H==1){
    drawLight ( 25, 580);
  }
  if (H==2){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
  }
  if (H==3){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
  }
  if (H==4){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
  }
  if (H==5){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
  }
  if (H==6){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
  }
  if (H==7){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
  }
  if (H==8){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
    drawLight ( 312, 580);
  }
  if (H==9){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
    drawLight ( 312, 580);
    drawLight ( 353, 580);
  }
  if (H==10){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
    drawLight ( 312, 580);
    drawLight ( 353, 580);
    drawLight ( 394, 580);
  }
  if (H==11){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
    drawLight ( 312, 580);
    drawLight ( 353, 580);
    drawLight ( 394, 580);
    drawLight ( 435, 580);
  }  
  if (H==12){
    drawLight ( 25, 580);
    drawLight ( 66, 580);
    drawLight ( 107, 580);
    drawLight ( 148, 580);
    drawLight ( 189, 580);
    drawLight ( 230, 580);
    drawLight ( 271, 580);
    drawLight ( 312, 580);
    drawLight ( 353, 580);
    drawLight ( 394, 580);
    drawLight ( 435, 580);
    drawLight ( 476, 580);
  }


//Draw chandelier lighhts
  if (M>=5 & M< 10) {
  drawLight ( 299, 170);
  }  
  if (M>=10 && M< 15) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  }
  if (M>=15 && M<20) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  }
  if (M>=20 && M<25) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  }
  if (M>=25 && M< 30) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  }
  if (M>=30 && M<35) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  }
  if (M>=35 && M<40) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  drawLight ( 118, 320);
  }
  if (M>=40 && M<45) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  drawLight ( 118, 320);
  drawLight ( 75, 240);
  }
  if (M>=45 && M< 50) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  drawLight ( 118, 320);
  drawLight ( 75, 240);
  drawLight ( 176, 227);
  }
  if (M>=50 && M<55) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  drawLight ( 118, 320);
  drawLight ( 75, 240);
  drawLight ( 176, 227);
  drawLight ( 146, 174);
  }
  if (M>=55 && M< 59) {
  drawLight ( 299, 170);
  drawLight ( 354, 177);
  drawLight ( 317, 230);
  drawLight ( 435, 245);
  drawLight ( 377, 320);
  drawLight ( 247, 465);
  drawLight ( 118, 320);
  drawLight ( 75, 240);
  drawLight ( 176, 227);
  drawLight ( 146, 174);
  drawLight ( 198, 172); 
  }
  
}

void drawLight (int X, int Y){
  noStroke ();
  fill (#fcf13c);
  ellipse (X,Y,10,10);
}

