
PImage img;
boolean gravity=false;
float gra=0.5;
float brushSize= 20;
float opacity=100;
color C= color(0, 174, 239);
color M= color(255, 0, 144);
color Y= color(255, 255, 0);
color G= color(29, 178, 75);
color K= color(0);
color W= color(255);
color currentColor;

float [] brushX = new float[0]; 
float [] brushY = new float[0];
float [] circleOpacity = new float[0];
color [] brushColor = new color [0];
float [] circleSize = new float [0];
float [] speedBall = new float [0];


//BottonSize position
float xPosA=50;
float yPosA=561;
float xPosB=81;
float yPosB=559;
float xPosC=129;
float yPosC=559;
float xPosD=186;
float yPosD=559;


//BottonOpacity position
float OpaAX=53;
float OpaAY=612;
float OpaBX=97;
float OpaBY=612;
float OpaCX=143;
float OpaCY=612;
float OpaDX=189;
float OpaDY=612;

//BottonColor position
float ColMX=305;
float ColMY=561;
float ColCX=306;
float ColCY=617;
float ColYX=365;
float ColYY=615;
float ColGX=366;
float ColGY=559;
float ColKX=426;
float ColKY=560;
float ColWX=427;
float ColWY=614;

//GravityBotton
float GraX=588;
float GraY=593;

import ddf.minim.*;
Minim minim;
AudioPlayer player;


void setup() {
  size(700, 700);
  img = loadImage("Code.png");
  minim = new Minim(this);
  player = minim.loadFile("crash.wav"); 
}

void draw() {
  background(255);

  smooth();
  img.resize(700, 240);
  image(img, 0, 470);
  //println(mouseX +", "+ mouseY);
  println(currentColor);


  if (gravity==true) {

    for (int i=0; i<brushX.length; i++) {
      brushY[i]= brushY[i]+speedBall[i]; 
      speedBall[i]=speedBall[i]+gra;
      if (brushY[i]>462-circleSize[i]/2){
        speedBall[i]= speedBall[i]* (-.8);
      }
      fill(brushColor[i], circleOpacity[i]);
      ellipse(brushX[i], brushY[i], circleSize[i], circleSize[i]);
      }
  }



  if (mousePressed && mouseY < 462) {
    fill(currentColor, opacity);
    noStroke();
    brushX= (float[]) append(brushX, mouseX);
    brushY= (float[]) append(brushY, mouseY);
    circleSize= (float[]) append(circleSize, brushSize);
    brushColor= (color[]) append(brushColor, color(currentColor));
    circleOpacity = (float[]) append(circleOpacity, opacity);
    speedBall = (float[]) append(speedBall, 0);
  }

  for (int i=0; i<brushX.length; i++) {

    fill(brushColor[i], circleOpacity[i]);
    ellipse(brushX[i], brushY[i], circleSize[i], circleSize[i]);
  }
}

void keyPressed(){
  println("keypress");
  int num = brushX.length;
  gravity=false;
  
  for (int i=0; i < num; i++){
    brushX=shorten(brushX);
    brushY=shorten(brushY);
    circleSize=shorten(circleSize);
    brushColor=shorten(brushColor);
    circleOpacity=shorten(circleOpacity);
    speedBall=shorten(speedBall);
  }
}




void mouseClicked() {
  //Opacity
  if (dist(mouseX, mouseY, GraX, GraY)<50) {
    player.play();
    gravity=true;
    
    
  }

  //Opacity
  if (dist(mouseX, mouseY, OpaAX, OpaAY)<20) {
    opacity=100;
  }
  if (dist(mouseX, mouseY, OpaBX, OpaBY)<20) {
    opacity=70;
  }
  if (dist(mouseX, mouseY, OpaCX, OpaCY)<20) {
    opacity=40;
  }
  if (dist(mouseX, mouseY, OpaDX, OpaDY)<20) {
    opacity=10;
  }


  //Size
  if (dist(mouseX, mouseY, xPosA, yPosA)<20) {
    brushSize=10;
  }

  if (dist(mouseX, mouseY, xPosB, yPosB)<20) {
    brushSize=20;
  }

  if (dist(mouseX, mouseY, xPosC, yPosC)<35) {
    brushSize=40;
  }

  if (dist(mouseX, mouseY, xPosD, yPosD)<50) {
    brushSize=80;
  }

  // Colors
  //Magenta
  if (dist(mouseX, mouseY, ColMX, ColMY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=M;
  }

  //Chano
  if (dist(mouseX, mouseY, ColCX, ColCY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=C;
  }
  //Yellow
  if (dist(mouseX, mouseY, ColYX, ColYY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=Y;
  }
  //Green
  if (dist(mouseX, mouseY, ColGX, ColGY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=G;
  }

  //Black
  if (dist(mouseX, mouseY, ColKX, ColKY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=K;
  }
  //White
  if (dist(mouseX, mouseY, ColWX, ColWY)<45) {
    // C=get(mouseX, mouseY);
    //fill(C);
    currentColor=W;
  }
}



