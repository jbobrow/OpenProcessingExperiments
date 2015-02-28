
int C=40;
float D;
float E;
boolean lose=false;
boolean rules=false;

float [] A=new float [C];
float [] B=new float [C];
PImage F;

void setup() {
  noCursor();
  D=(250);
  E=(480);
  smooth();
  size(500,500);
  for (int i = 0; i < C; i = i+1) {
    A[i]=random(500);
    B[i]=random(465);
  }
  frameRate(50);
}

void draw() {
  F=loadImage("haha.jpg");
  background(0);
  fill(255);
  PFont poulice;
  poulice=loadFont("poulice.vlw");
  textFont(poulice,30);
  text("Tu es le petit triangle",10,50);
  text("noir.",10,100);
  text("Tu dois traverser le nuage ",10,150);
  text("de cochons pour atteindre",10,200);
 text("la rive opposée.",10,250);
text("Tape entrée pour commencer, ",10,300);
text("et espace pour REcommencer.",10,350);
  if (rules) {
    if(lose) {
      
      background(222,34,56);
      fill(165,33,49);
      PFont Police;
      Police = loadFont("police.vlw");
      textFont(Police,70);
      text ("YOU L0SER !", 50,240);
    } 
    else {

      background(255);
      strokeWeight(30);
      stroke(250,202,212);
      line(250,30,250,470);
      line(250,30,150,100);
      line(250,30,350,100);
      for (int i = 0; i < C; i = i+1) {
        A[i]+=random(-6,6);
        B[i]+=random(-6,6);
        noStroke();
        fill(160,97,156,200);
        ellipse(A[i]-8,B[i]-7,8,8);
        ellipse(A[i]+8,B[i]-7,8,8);
        fill(247,122,235);
        ellipse(A[i],B[i],20,20);
        fill(255);
        ellipse(A[i]-5,B[i],7,7);
        ellipse(A[i]+5,B[i],5,5);
        fill(0,200);
        ellipse(A[i]-5,B[i],2,2);  
        ellipse(A[i]+5,B[i],2,2);
        fill(160,97,156,200);
        ellipse(A[i],B[i]+5,7,7);
        fill(255,200);
        ellipse(A[i]-2,B[i]+5,2,2);
        ellipse(A[i]+2,B[i]+5,2,2);
        if(A[i]<0) {
          A[i]=0;
        }
        if(A[i]>500) {
          A[i]=500;
        }
        if(B[i]<0) {
          B[i]=0;
        }
        if(B[i]>465) {
          B[i]=465;
        }
        noStroke();
        fill(0);
        triangle(D,E,D-10,E+20,D+10,E+20);
        if(E>495){
            E=495;
          }
          if(D<0){
            D=500;
          }
          if(D>500){
            D=0;
          }
          if(E<10){
            background(66,219,67);
            image(F,50,100,400,300);
            
          }
        if((A[i]-10<D&&D<A[i]+10)&&(B[i]-10<E&&E<B[i]+10)) {
          lose=true;
           
        }
      }
    }
  }
}






void keyPressed () {

  if(keyCode==UP) {
    E=E-10;
  }
  if(keyCode==DOWN) {
    E=E+10;
  }
  if(keyCode==RIGHT) {
    D=D+10;
  }
  if(keyCode==LEFT) {
    D=D-10;
  }
  if(key==' ') {
    lose=false;
    D=250;
    E=480;
  }
  if(keyCode==ENTER) {
    rules=true;
  }
}

