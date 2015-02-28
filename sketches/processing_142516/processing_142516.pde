
/* @pjs preload= "menu.png"; */
/* @pjs preload= "bgA.png"; */
/* @pjs preload= "bgS.jpeg"; */
/* @pjs preload= "bgD.jpeg"; */
/* @pjs preload= "conceptQ.png"; */
/* @pjs preload= "conceptW.png"; */
/* @pjs preload= "conceptE.png"; */
/* @pjs preload= "conceptA.png"; */
/* @pjs preload= "conceptS.png"; */
/* @pjs preload= "conceptD.png"; */
/* @pjs preload= "iconQ.png"; */
/* @pjs preload= "iconW.png"; */
/* @pjs preload= "iconE.png"; */
/* @pjs preload= "iconA.png"; */
/* @pjs preload= "iconS.png"; */
/* @pjs preload= "iconD.png"; */
/* @pjs preload= "help.png"; */
/* @pjs preload= "Weu.png"; */
/* @pjs preload= "Wbg.jpeg"; */
/* @pjs preload= "W1.png"; */
/* @pjs preload= "W2.png"; */
/* @pjs preload= "W3.png"; */
/* @pjs preload= "W4.png"; */
/* @pjs preload= "W5.png"; */
/* @pjs preload= "W6.png"; */
/* @pjs preload= "W7.png"; */

//KEYBOARD COMMANDS
boolean q = false;
boolean w = false;
boolean e = false;
boolean a = false;
boolean s = false;
boolean d = false;

//GENERAL VARIABLES
int current_time = 0;
int loading_time = 1000;
PImage menu;
PImage conceptQ;
PImage conceptW;
PImage conceptE;
PImage conceptA;
PImage conceptS;
PImage conceptD;
PImage iconQ;
PImage iconW;
PImage iconE;
PImage iconA;
PImage iconS;
PImage iconD;
PImage help;
int strk = 50;

//Q VARIABLES
int new_position = 0;
int[] Qposx = new int[10000000];
int Qi = 0;
color corA = color(80, 210, 255);
color corB = color(65, 75, 150);

//W VARIABLES
PImage Weu;
PImage Wbg;
PImage W1;
PImage W2;
PImage W3;
PImage W4;
PImage W5;
PImage W6;
PImage W7;

//E VARIABLES
int strkE = 255;

//A VARIABLES
PImage fundoA;
int[] Aposx = new int[10000];
int[] Aposy = new int[10000];
float[] Acor = new float[10000];
int[] Araio = new int[10000];
int[] Avib = new int[10000];
int Ai = 0;
color azul = color(255);
color branco = color(220, 45, 80);

//S VARIABLES
PImage fundoS;
int[] S1x = new int[10];
int[] Sy = new int[10];
int[] Sw = new int[10];
int[] Sh = new int[10];
int[] S2x = new int[10];
int[] S3x = new int[10];
int[] S4x = new int[10];
color ScorA = color(25, 30, 255);
color ScorB = color(255, 40, 140);

//D VARIABLES
PImage fundoD;
int ray = 0;
float rayS1 = 20;
float rayS2 = 20;
float rayS3 = 21;
boolean S3 = true;
float comS4 = 10;
float fimS4 = 30;

void setup() {
  size(900 ,500);
  smooth();
  menu = loadImage("menu.png");
  fundoA = loadImage("bgA.png");
  fundoS = loadImage("bgS.jpg");
  fundoD = loadImage("bgD.jpg");
  conceptQ = loadImage("conceptQ.png");
  conceptW = loadImage("conceptW.png");
  conceptE = loadImage("conceptE.png");
  conceptA = loadImage("conceptA.png");
  conceptS = loadImage("conceptS.png");
  conceptD = loadImage("conceptD.png");
  iconQ = loadImage("iconQ.png");
  iconW = loadImage("iconW.png");
  iconE = loadImage("iconE.png");
  iconA = loadImage("iconA.png");
  iconS = loadImage("iconS.png");
  iconD = loadImage("iconD.png");
  help = loadImage("help.png");
  Weu = loadImage("Weu.png");
  Wbg = loadImage("Wbg.jpg");
  W1 = loadImage("W1.png");
  W2 = loadImage("W2.png");
  W3 = loadImage("W3.png");
  W4 = loadImage("W4.png");
  W5 = loadImage("W5.png");
  W6 = loadImage("W6.png");
  W7 = loadImage("W7.png");
  cursor(CROSS);
//  Qposx[0] = 2000;
  Aposx[0] = 2000;
  Aposy[0] = 2000;
  Acor[0] = color(255);
  Araio[0] = 0;
  Avib[0] = 0;
  for(int Qinitial = 0; Qinitial <= 19; Qinitial += 1) {
    Qposx[Qinitial] = width/2;
  }
}

void draw() {
  float farD = dist(mouseX, mouseY, width/2, height/2);
  println(q,w,e,a,s,d);
  
  /////////////////////////////////////////////////////////////////////////////////////////MAIN MENU
  if (q == false && w == false && e == false && a == false && s == false && d == false) {
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 450; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    for(int x = 312; x <= 512; x += 100) {
      for(int y = 162; y <= 262; y += 100) {
        strokeWeight(9);
        stroke(strk);
        rect(x, y, 76, 76);
      }
    }
    image(menu, 221, 76);
    //CONCEPT
    if(keyPressed && key == 'x'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(help, 0, 0);
      strk = 255;
    } else {
      strk = 50;
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////Q
  if (q == true) {
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 250; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    line(0, 425, 900, 425);
    line(100, 350, -1, 406);
    line(200, 350, -1, 495);
    line(300, 350, 165, 501);
    line(400, 350, 353, 501);
    line(500, 350, 546, 501);
    line(600, 350, 735, 501);
    line(700, 350, 901, 495);
    line(800, 350, 901, 406);
    pushStyle();
    if(millis() <= new_position + 300) {
      Qposx[Qi + 20] = mouseX;
      Qi = Qi + 1;
      new_position = millis();
    }
    for(int Qk = 0; Qk <= 19; Qk += 1) {
      rectMode(CENTER);
      noStroke();
      fill(lerpColor(corA, corB, map(Qk, 0, 19, 1, 0)));
      rect(Qposx[Qk + Qi], 235 + 8 * Qk, 220, 120);
    }
    strokeWeight(9);
    stroke(60);
    noFill();
    rect(width/2, height/2, 842, 442);
    strokeWeight(3);
    line(28, 100, 100, 28);
    line(800, 472, 872, 400);
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(width/2, height/2, 900, 500);
      image(conceptQ, 0, 0);
    }
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(corA);
      image(iconQ, 0, 0);
    }
    popStyle();
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////W
  if (w == true) {
    pushStyle();
    image(Wbg, -50 + map(mouseX, 0, width, -50, 50), 25);
    image(W1, 25 + map(mouseX, 0, width, -30, 30), 25);
    image(W2, 25 + map(mouseX, 0, width, -15, 15), 25);
    image(W3, 25 + map(mouseX, 0, width, -5, 5), 25);
    image(Weu, 25, 25);
    image(W4, 25 + map(mouseX, 0, width, 5, -5), 25);
    image(W5, 25 + map(mouseX, 0, width, 20, -20), 25);
    image(W6, 25 + map(mouseX, 0, width, 50, -50), 25);
    image(W7, 25 + map(mouseX, 0, width, 90, -90), 25);
    fill(255); noStroke();
    rect(0, 0, 25, 500); rect(0, 0, 900, 25); rect(0, 475, 900, 25); rect(875, 0, 25, 500);
    noFill(); stroke(100); strokeWeight(1); strokeCap(SQUARE);
    rect(0, 0, 899, 499);
    for(int i = 100; i <= 800; i += 100) {
      line(i, 0, i, 25);
      line(i, 475, i, 500);
      line(0, i - 50, 25, i - 50);
      line(875, i - 50, 900, i- 50);
    }
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(conceptW, 0, 0);
    }
    popStyle();
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(50);
      image(iconW, 0, 0);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////E
  if (e == true) {
    pushStyle();
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 450; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    fill(30); noStroke();
    rect(25,25,850,450);
    stroke(strkE); strokeWeight(11); noFill(); strokeCap(SQUARE);
    rect(54, 54, 792, 392);
    line(54, 185, 846, 185);
    line(54, 316, 846, 316);
    line(600, 54, 600, 185);
    line(150, 185, 150, 316);
    line(450, 185, 450, 446);
    line(795, 316, 795, 446);
    strokeCap(ROUND);
    rigid(round(map(mouseX, 0, width, 119, 535)), 119, 3, color(255));
    rigidInverted(round(map(mouseX, 0, width, 781, 665)), 119, 3, color(255));
    rigidY(round(map(mouseY, 0, height, 215, 385)), 250, 3, color(255)); 
    rigid(round(map(mouseX, 0, width, 515, 781)), 250, 3, color(255)); 
    rigidInverted(round(map(mouseX, 0, width, 385, 119)), 381, 3, color(255)); 
    rigidY(round(map(mouseY, 0, height, 515, 730)), 381, 3, color(255)); 
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(conceptE, 0, 0);
      strkE = 30;
    } else {
      strkE = 255;
    }
    popStyle();
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(255);
      image(iconE, 0, 0);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////A
  if (a == true) {
    pushStyle();
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 450; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    fill(118,105,215); noStroke();
    rect(25, 25, 850, 450);
    image(fundoA, 25, 25);
    for(int Ak = 0; Ak <= Ai; Ak += 1) {
      fill(lerpColor(branco, azul, Acor[Ak]));
      ellipse(Aposx[Ak] + random(-Avib[Ak], Avib[Ak]), Aposy[Ak] + random(-Avib[Ak], Avib[Ak]), Araio[Ak], Araio[Ak]);
      Aposx[Ak] = round(Aposx[Ak] + (450 - Aposx[Ak]) * 0.015);
      Aposy[Ak] = round(Aposy[Ak] + (250 - Aposy[Ak]) * 0.015);
      Acor[Ak] = Acor[Ak] - (Acor[Ak] - 1) * 0.025;
      Araio[Ak] = round(Araio[Ak] - (Araio[Ak] - 10) * 0.015);
      Avib[Ak] = round(Avib[Ak] * 0.82);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(conceptA, 0, 0);
    }
    popStyle();
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(118,105,215);
      image(iconA, 0, 0);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////S
  if (s == true) {
    pushStyle();
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 450; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    image(fundoS, 25, 25);
    fill(0, random(0, 60)); noStroke();
    rect(25, 25, 850, 450);
    S1x[0] = 100; 
    Sy[0] = 75; 
    Sw[0] = 150;
    Sh[0] = 350;
    S2x[0] = 283;
    S3x[0] = 466;
    S4x[0] = 648;
    
    if(mousePressed) {
      colorMode(HSB);
      ScorA = color(random(255), 230, 220);
      ScorB = color(random(255), 230, 220);
      colorMode(RGB);
    }
    
    //DELAY
    stroke(ScorB); noFill(); strokeWeight(2);
    rect(S1x[0] + map(pmouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S2x[0] + map(pmouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S3x[0] + map(pmouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S4x[0] + map(pmouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorB, ScorA, i * 0.1));
      S1x[i] = S1x[i - 1] + 35;
      Sy[i] = Sy[i - 1] + 14;
      Sw[i] = Sw[i - 1] - 12;
      Sh[i] = Sh[i - 1] - 28;
      rect(S1x[i] + round(map(pmouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorB, ScorA, i * 0.1));
      S2x[i] = S2x[i - 1] + 20;
      rect(S2x[i] + round(map(pmouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorB, ScorA, i * 0.1));
      S3x[i] = S3x[i - 1] + 5;
      rect(S3x[i] + round(map(pmouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorB, ScorA, i * 0.1));
      S4x[i] = S4x[i - 1] - 10;
      rect(S4x[i] + round(map(pmouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    
    //PRINCIPAL
    stroke(ScorA); noFill(); strokeWeight(2);
    rect(S1x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S2x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S3x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S4x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1));
      S1x[i] = S1x[i - 1] + 35;
      Sy[i] = Sy[i - 1] + 14;
      Sw[i] = Sw[i - 1] - 12;
      Sh[i] = Sh[i - 1] - 28;
      rect(S1x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1));
      S2x[i] = S2x[i - 1] + 20;
      rect(S2x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1));
      S3x[i] = S3x[i - 1] + 5;
      rect(S3x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1));
      S4x[i] = S4x[i - 1] - 10;
      rect(S4x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    
    //BLUR 1
    stroke(ScorA, 50); noFill(); strokeWeight(6);
    rect(S1x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S2x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S3x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S4x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S1x[i] = S1x[i - 1] + 35;
      Sy[i] = Sy[i - 1] + 14;
      Sw[i] = Sw[i - 1] - 12;
      Sh[i] = Sh[i - 1] - 28;
      rect(S1x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S2x[i] = S2x[i - 1] + 20;
      rect(S2x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S3x[i] = S3x[i - 1] + 5;
      rect(S3x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S4x[i] = S4x[i - 1] - 10;
      rect(S4x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    
    //BLUR 2
    stroke(ScorA, 50); noFill(); strokeWeight(10);
    rect(S1x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S2x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S3x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    rect(S4x[0] + map(mouseX, 0, 900, 50, - 50), Sy[0], Sw[0], Sh[0]);
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S1x[i] = S1x[i - 1] + 35;
      Sy[i] = Sy[i - 1] + 14;
      Sw[i] = Sw[i - 1] - 12;
      Sh[i] = Sh[i - 1] - 28;
      rect(S1x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S2x[i] = S2x[i - 1] + 20;
      rect(S2x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S3x[i] = S3x[i - 1] + 5;
      rect(S3x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    for(int i = 1; i <= 9; i += 1) {
      stroke(lerpColor(ScorA, ScorB, i * 0.1), 50);
      S4x[i] = S4x[i - 1] - 10;
      rect(S4x[i] + round(map(mouseX, 0, 900, 50, - 50 - 15 * i)), Sy[i], Sw[i], Sh[i]);
    }
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(conceptS, 0, 0);
    }
    popStyle();
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(25, 30, 255);
      image(iconS, 0, 0);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
  }
  
  /////////////////////////////////////////////////////////////////////////////////////////D
  if (d == true) {
    pushStyle();
    background(255);
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    for(int x = 0; x <= 800; x += 100) {
      for(int y = -50; y <= 450; y += 100) {
        rect(x, y, 100, 100);
      }
    }
    int rot = round(map(farD, 0, 512, 0, 10));
    image(fundoD, 25, 25);
    pushMatrix();
    translate(449, 253);
    noFill(); strokeWeight(9); stroke(38, 38, 38);
    ellipse(0, 0, 90, 90);
    ellipse(0, 0, 174, 174);
    ellipse(0, 0, 254, 254);
    rotate(radians(ray));
    line(0, -125, 0, -50);
    line(-85, 0, -50, 0);
    line(63, 63, 87, 87);
    ray = ray + rot;
    popMatrix();
    pushMatrix();
    translate(159, 352);
    if(rayS1 <= 140) {
      stroke(250); strokeWeight(9);
      ellipse(0, 0, rayS1, rayS1);
      rayS1 = rayS1 + map(farD, 0, 512, 0, 2);
    } else {
      rayS1 = 20;
    }
    if(rayS1 >= 80 || rayS2 >= 70 && rayS2 <= 140) {
      stroke(250);
      ellipse(0, 0, rayS2, rayS2);
      rayS2 = rayS2 + map(farD, 0, 512, 0, 2);
    } else {
      rayS2 = 20;
    }
    popMatrix();
    pushMatrix();
    strokeWeight(9);
    translate(701, 136);
    ellipse(0, 0, rayS3, rayS3);
    if(rayS3 <= 90 && S3 == true) {
      rayS3 = rayS3 + map(farD, 0, 512, 0, 4);
    } else if(rayS3 >= 90) {
      S3 = false;
    }
    if(rayS3 > 19 && S3 == false) {
      rayS3 = rayS3 - map(farD, 0, 512, 0, 4);
    } else if(rayS3 <= 20) {
      S3 = true;
    }
    popMatrix();
    pushMatrix();
    strokeWeight(9);
    translate(284, 119);
    rotate(radians(45));
    strokeCap(SQUARE);
    line(0, -comS4, 0, - fimS4);
    line(comS4, 0, fimS4, 0);
    line(0, comS4, 0, fimS4);
    line(-comS4, 0, -fimS4, 0);
    rotate(radians(-45));
    line(0, -comS4, 0, - fimS4);
    line(comS4, 0, fimS4, 0);
    line(0, comS4, 0, fimS4);
    line(-comS4, 0, -fimS4, 0);
    if(comS4 < 40) {
      comS4 = comS4 + map(farD, 0, 512, 0, 1);
    } else if (comS4 <= 41) {
      comS4 = 10;
    }
    if(fimS4 < 60) {
      fimS4 = fimS4 + map(farD, 0, 512, 0, 1);
    } else if (fimS4 <= 61) {
      fimS4 = 30;
    }
    popMatrix();
    //CONCEPT
    if(keyPressed && key == 'x' || keyPressed && key == 'X'){
      noStroke();
      fill(255, 230, 220, 200);
      rect(0,0,900,500);
      image(conceptD, 0, 0);
    }
    //LOADINGSCREEN
    if (millis() < current_time + loading_time) {
      background(255, 217, 128);
      image(iconD, 0, 0);
    }
    noFill();
    stroke(100);
    strokeWeight(1);
    rect(0, 0, 899, 499);
    popStyle();
  }
  
}

void rigid(int rigidX, int rigidY, int strk, color strkColor) {
  int Xpoint = round(map(mouseX, 0, width, rigidX - 5, rigidX - 45));
  stroke(strkColor);
  strokeWeight(strk);
  rect(rigidX - 45, rigidY - 45, 90, 90);
  rect(Xpoint, rigidY - 25, 50, 50);
  line(rigidX - 45, rigidY - 45, Xpoint, rigidY - 25);
  line(rigidX - 45, rigidY + 45, Xpoint, rigidY + 25);
  line(rigidX + 45, rigidY - 45, Xpoint + 50, rigidY - 25);
  line(rigidX + 45, rigidY + 45, Xpoint + 50, rigidY + 25);
}

void rigidY(int rigidX, int rigidY, int strk, color strkColor) {
  int Xpoint = round(map(mouseY, 0, height, rigidX - 5, rigidX - 45));
  stroke(strkColor);
  strokeWeight(strk);
  rect(rigidX - 45, rigidY - 45, 90, 90);
  rect(Xpoint, rigidY - 25, 50, 50);
  line(rigidX - 45, rigidY - 45, Xpoint, rigidY - 25);
  line(rigidX - 45, rigidY + 45, Xpoint, rigidY + 25);
  line(rigidX + 45, rigidY - 45, Xpoint + 50, rigidY - 25);
  line(rigidX + 45, rigidY + 45, Xpoint + 50, rigidY + 25); 
}

void rigidInverted(int rigidX, int rigidY, int strk, color strkColor) {
  int Xpoint = round(map(mouseX, 0, width, rigidX - 45, rigidX - 5));
  stroke(strkColor);
  strokeWeight(strk);
  rect(rigidX - 45, rigidY - 45, 90, 90);
  rect(Xpoint, rigidY - 25, 50, 50);
  line(rigidX - 45, rigidY - 45, Xpoint, rigidY - 25);
  line(rigidX - 45, rigidY + 45, Xpoint, rigidY + 25);
  line(rigidX + 45, rigidY - 45, Xpoint + 50, rigidY - 25);
  line(rigidX + 45, rigidY + 45, Xpoint + 50, rigidY + 25);
}
    
void keyPressed() {
  if(key == 'q' || key == 'Q') {
    current_time = millis();
    new_position = millis();
    q = !q; w = false; e = false; a = false; s = false; d = false;
    background(50);
  }
  if(key == 'w' || key == 'W') {
    current_time = millis();
    w = !w; q = false; e = false; a = false; s = false; d = false;
    background(50);
  }
  if(key == 'e' || key == 'E') {
    current_time = millis();
    e = !e; q = false; w = false; a = false; s = false; d = false;
  }
  if(key == 'a' || key == 'A') {
    current_time = millis();
    a = !a; q = false; w = false; e = false; s = false; d = false;
    background(50);
  }
  if(key == 's' || key == 'S') {
    current_time = millis();
    s = !s; q = false; w = false; e = false; a = false; d = false;
    background(50);
  }
  if(key == 'd' || key == 'D') {
    current_time = millis();
    d = !d; q = false; w = false; e = false; a = false; s = false;
    background(50);
  }
}

void mousePressed() {
  Ai = Ai + 1;
  float far = dist(mouseX, mouseY, width/2, height/2);
  Aposx[Ai] = mouseX;
  Aposy[Ai] = mouseY;
  Acor[Ai] = 0;
  Araio[Ai] = 250;
  Avib[Ai] = 10;
}


