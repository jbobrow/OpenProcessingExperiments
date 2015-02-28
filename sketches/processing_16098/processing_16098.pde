
float A;
float B;
PImage C;

void setup () {
  A = 100;
  B=100;
  background(255);
  smooth ();
  noCursor ();
  size (500,500);

}

void draw () {
  background (255);
  C=loadImage("fgbg.JPG");

  noStroke ();
  fill(71,232,9,175);
  ellipse (A,B,50,50);
  fill(51,155,11,200);
  ellipse(A-15,B+3,12,12);
  ellipse(A+15,B+3,12,12);
  fill(255,150);
  ellipse(A-13,B+1,2,2);
  ellipse(A+17,B+1,2,2);
  fill(242,95,228,200);
  ellipse(A-14,B+12.5,11,5);
  ellipse(A+14,B+12.5,11,5);
  stroke(51,155,11,200);
  strokeWeight (2.5);
  noFill();
  arc(A,B+10,11,11,0,PI);
  image(C,360,330,90,120);
  if((A>370 && A<440)&&(B>330 && B<360)){
    background(162,220,225);
fill(0, 102, 153);
PFont Font1;
Font1 = loadFont("Font1.vlw");
textFont(Font1,60);
text ("Bien joué :D", 15,200);
textFont(Font1,25);
text("(tape sur la touche",100,225);
textFont(Font1,25);
text(" espace pour recommencer)",130,250);

  }
  if( A<0){
  A=500;
  }
 if( A>500){
  A=0;
  }
  if( B<0){
  B=500;
  }
  if( B>500){
  B=0;
  }
  if(A>350&&B>330 && B<450&&A<370){
    A=350;
  }
  if(A>440&&B>330 && B<450&&A<460){
    A=460;
  }if(A>360&&B>440&&B<460&&A<450){
    B=460;
  }
}

void keyPressed() {
    if((A<375 || A>435)||(B<345 || B>435)){
  if (keyCode==UP) {
    B=B-10;
  }
  if (keyCode==DOWN) {
    B=B+10;
  }
  if (keyCode==RIGHT) {
    A=A+10;
  }
  if (keyCode==LEFT) {
    A=A-10;
  }
    }
    else {
    }
    if(keyCode==' '){
      A=100;
      B=100;
      
    }
      
   }


