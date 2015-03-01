
float x;
float y;

float redx=50;
float redy=550;
float redSize=50;

float yellowx=200;
float yellowy=550;
float yellowSize=50;

float bluex =350;
float bluey =550;
float blueSize=50;

float eraserx=500;
float erasery=550;
float eraserSize=50;

float roundx=700;
float roundy=70;
float roundSize=50;

float squarex=700;
float squarey=150;
float squareSize=50;

float bplusX=725;
float bplusY=300;
float bplusSize=50;

float bminusX=725;
float bminusY=400;
float bminusSize=50;

float resetX=725;
float resetY=550;
float resetSize=50;

boolean red = false;
boolean yellow = false;
boolean blue = false;
boolean eraser=false;
boolean roundbrush=false;
boolean squarebrush=false;
boolean changebsize=false;

float ibsize=10;
float bsize;

void setup(){
  size(800,600);
  background(255,255,204);
}
void draw(){
  //frame//
  noStroke();
  rectMode(CORNER);
  fill(20,20,20);
  rect(700,0,100,height);
  rect(0,500,width,100);
  
  //color buttons//
 
  fill(255,0,0);
  rect(redx,redy, redSize*2, redSize);
  fill(255,255,0);
  rect(yellowx,yellowy,yellowSize*2, yellowSize);
  fill(0,0,255);
  rect(bluex, bluey, blueSize*2,blueSize);
  fill(255);
  rect(eraserx,erasery,eraserSize*2,eraserSize);

  
  
  //brush buttons//
  fill(0,191,243);
  rect(roundx,roundy,roundSize*2, roundSize);
  fill(251,174,92);
  rect(squarex,squarey,squareSize*2,squareSize);
  fill(191,191,191);
  rect(bplusX,bplusY,bplusSize,bplusSize);
  rect(bminusX,bminusY,bminusSize,bminusSize);
  fill(255,117,11);
  rect(resetX,resetY,resetSize, resetSize);
  
  //button names//
  pushMatrix();
  PFont font;
  font = loadFont("Lato-Light-48.vlw");
  textFont(font,20);
  textAlign(CENTER,CENTER);
  fill(0);
  text("ROUND",750,100);
  text("SQUARE",750,180);
  text("SELECT A COLOR AND A BRUSH TO DRAW",200,20);
  textSize(60);
  text("+",750,325);
  text("-",750,420);
  fill(255);
  textSize(20);
  text ("RED",100,525); 
  text("YELLOW",250, 525);
  text("BLUE",400,525);
  text("BRUSHES",750,40);
  text("ERASER", 550,525);
  text("BURSH\nSIZE", 750,270);
  text("RESET", 750, 530);
  popMatrix();
  
  x=mouseX;
  y=mouseY;
  noFill();
  
  if (roundbrush==true){
  brushCircle();
  }
  else if(squarebrush==true){
  brushSquare();
  }
   
  if (keyPressed) {
    if (key == 's') {
      saveFrame("screen-#####.jpg");
    }
 
  }
  //println("bsize is ",bsize) ;
}
void mousePressed(){
  //color buttons//
  if (mouseX > redx && mouseX < redx + (redSize*2) &&
    mouseY > redy && mouseY < redy + redSize) {
      red=true;
      yellow=false;
      blue=false;
      eraser=false;
    }
   else if (mouseX > yellowx && mouseX < yellowx + (yellowSize*2) &&
    mouseY > yellowy && mouseY < yellowy + yellowSize) {
      red=false;
      yellow=true;
      blue=false;
      eraser=false;
    }
    else if (mouseX > bluex && mouseX < bluex + (blueSize*2) &&
    mouseY > bluey && mouseY < bluey + blueSize) {
      red=false;
      yellow=false;
      blue=true;
      eraser=false;
    }
    else if (mouseX > eraserx && mouseX < eraserx + (eraserSize*2) &&
    mouseY > erasery && mouseY < erasery + eraserSize) {
      red=false;
      yellow=false;
      blue=false;
      eraser=true;
    }
    
    //brush button//
    else if (mouseX > roundx && mouseX < roundx + (roundSize*2) &&
    mouseY > roundy && mouseY < roundy + roundSize) {
    roundbrush=true;
    squarebrush=false;
    }
    else if (mouseX > squarex && mouseX < squarex + (squareSize*2) &&
    mouseY > squarey && mouseY < squarey + squareSize) {
    roundbrush=false;
    squarebrush=true;
    }
    else if (mouseX > bplusX && mouseX < bplusX + bplusSize &&
    mouseY > bplusY && mouseY < bplusY + bplusSize) {
      changebsize=true;
      bsize=bsize+10;
    }
    else if(mouseX > bminusX && mouseX < bminusX + bminusSize &&
    mouseY > bminusY && mouseY < bminusY + bminusSize) {
      changebsize=true;
      bsize=bsize-10;
    }
    else if (mouseX > resetX && mouseX < resetX + resetSize &&
    mouseY > resetY && mouseY < resetY + resetSize) {
        red = false;
        yellow = false;
        blue = false;
        eraser=false;
        roundbrush=false;
        squarebrush=false;
        changebsize=false;
        background(255,255,204);
    }
    else{
    }
}
void brushCircle(){
  if(red==true){
   fill(255,0,0,150);
  }
  if(yellow==true){
   fill(255,255,0,150);
  }
  if(blue==true){
   fill(0,0,255,150);
  }
  if(eraser==true){
   fill(255,255,204,150);
  }
  else{
  }
  noStroke();
  if(changebsize==true){
  ellipse(x,y,bsize,bsize);
  }
  if(changebsize==false){
  bsize=ibsize;
  ellipse(x,y,bsize,bsize);
  }
}

void brushSquare(){
  if(red==true){
   fill(255,0,0,150);
  }
  if(yellow==true){
   fill(255,255,0,150);
  }
  if(blue==true){
   fill(0,0,255,150);
  }
  if(eraser==true){
   fill(255,255,204,150);
  }
  else{
  }
  noStroke();
  if(changebsize==true){
  rectMode(CENTER);
  rect(x,y,bsize,bsize);
  }
  if(changebsize==false){
  bsize=ibsize;
  rectMode(CENTER);
  rect(x,y, bsize,bsize);
  }
}




