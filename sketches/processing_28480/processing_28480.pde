
//Initialize libraries
PFont txt;
PFont txt1;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
//Initialize colour variables
int colours[][]=new int[10][3];  
int position[][]=new int[10][2];
int a;
int b;
int c;
//Initialize pencil thickness
int d=1;

void setup() {
  size(800, 480);
  colorMode(RGB);
  smooth();
  background(200);
  frameRate(60);
  //Load font
  txt=loadFont("AgencyFB-Reg-48.vlw");
  txt1=loadFont("Calibri-12.vlw");
  //Setup background
  noFill();
  stroke(0);
  strokeWeight(3);
  rect(0, 0, 799, 479);
  fill(0);
  textFont(txt, 48);
  text("Press spacebar to clear the canvas", 200, 200);
  textFont(txt, 32);
  text("Use the number pad to control line thickness", 240, 250);
  textFont(txt,40);
  text("Use left click to draw, and right click to erase",190,300);
  //Load music
  minim = new Minim(this);
  player = minim.loadFile("Chickens.wav", 2048);
  player.play();
  player.loop();
  //Add colour palete position values in array
  for (int i=0;i<10;i++) {
    if (i%2==0) {
      position[i][0]=50;
    }
    else {
      position[i][0]=110;
    }
  }
  position[0][1]=160;
  position[1][1]=160;
  position[2][1]=210;
  position[3][1]=210;
  position[4][1]=260;
  position[5][1]=260;
  position[6][1]=310;
  position[7][1]=310;
  position[8][1]=360;
  position[9][1]=360;
  //Add colour values in array
  //Black
  colours[0][0]=0;
  colours[0][1]=0;
  colours[0][2]=0;
  //Grey
  colours[1][0]=130;
  colours[1][1]=130;
  colours[1][2]=130;
  //White
  colours[2][0]=255;
  colours[2][1]=255;
  colours[2][2]=255;
  //Red
  colours[3][0]=255;
  colours[3][1]=0;
  colours[3][2]=0;
  //Orange
  colours[4][0]=255;
  colours[4][1]=165;
  colours[4][2]=0;
  //Yellow
  colours[5][0]=255;
  colours[5][1]=255;
  colours[5][2]=0;
  //Green
  colours[6][0]=0;
  colours[6][1]=255;
  colours[6][2]=0;
  //Blue
  colours[7][0]=0;
  colours[7][1]=0;
  colours[7][2]=255;
  //Indigo
  colours[8][0]=75;
  colours[8][1]=0;
  colours[8][2]=130;
  //Violet
  colours[9][0]=238;
  colours[9][1]=130;
  colours[9][2]=238;
}
void draw() {
  toolbox();
  colourChooser();
  thickness();

  //Drawing tool
  if (mousePressed && (mouseButton == LEFT)) line(pmouseX, pmouseY, mouseX, mouseY);
  if(mousePressed && (mouseButton == RIGHT)){
    fill(200);
    stroke(200);
    strokeWeight(7);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  //Draw current line thickness
  fill(0);
  stroke(0);
  line(25, 436, 135, 436);
  //Reset line thickness
  strokeWeight(3);
  //Clear background
  if (keyPressed && key ==' ')clearBG();
}

//Reset Canvas
void clearBG() {
  //Repaint background
  fill(200);
  stroke(0);
  rect(0, 0, 799, 479);
  //Reset colour chosen
  stroke(a, b, c);
  fill(a, b, c);
}

//Adjust pencil thickness
void thickness() {
  if (keyPressed && key =='1') d=1;
  if (keyPressed && key =='2') d=3;
  if (keyPressed && key =='3') d=5;
  if (keyPressed && key =='4') d=7;
  if (keyPressed && key =='5') d=9;
  strokeWeight(d);
}

//Draw toolbox
void toolbox() {
  fill(60);
  stroke(0);
  rect(0, 0, 160, 479);
  //Labels
  fill(255);
  textFont(txt, 32);
  text("Toolbox", 10, 35);
  textFont(txt, 16);
  text("Current Colour", 10, 65);
  text("Colours", 10, 132);
  text("Current line thickness", 10, 410);
  textFont(txt1, 12);
  text("© Crwire 2011", 75, 475);
  //Lines/Borders
  fill(0);
  rect(9, 69, 142, 32);
  line(0, 43, 160, 43);
  line(0, 110, 160, 110);
  line(0, 390, 160, 390);
  noFill();
  rect(9, 420, 142, 32);
  //Colour palete
  for (int i=0;i<10;i++) {
    fill(colours[i][0], colours[i][1], colours[i][2]);
    ellipse(position[i][0], position[i][1], 40, 40);
  }
  //Reset fill colour
  fill(a, b, c);
  //Current colour box
  stroke(0);
  rect(10, 70, 140, 30);
  //Reset stroke colour
  stroke(a, b, c);
}

//Choose drawing colour
void colourChooser() {
  if (keyPressed && key =='a' || key =='A') {
    a=colours[0][0];
    b=colours[0][1];
    c=colours[0][2];
  }
  if (keyPressed && key =='s' || key =='S') {
    a=colours[1][0];
    b=colours[1][1];
    c=colours[1][2];
  }
  if (keyPressed && key =='d' || key =='D') {
    a=colours[2][0];
    b=colours[2][1];
    c=colours[2][2];
  }
  if (keyPressed && key =='q' || key =='Q') {
    a=colours[3][0];
    b=colours[3][1];
    c=colours[3][2];
  }
  if (keyPressed && key =='w' || key =='W') {
    a=colours[4][0];
    b=colours[4][1];
    c=colours[4][2];
  }
  if (keyPressed && key =='e' || key =='E') {
    a=colours[5][0];
    b=colours[5][1];
    c=colours[5][2];
  }
  if (keyPressed && key =='r' || key =='R') {
    a=colours[6][0];
    b=colours[6][1];
    c=colours[6][2];
  }
  if (keyPressed && key =='t' || key =='T') {
    a=colours[7][0];
    b=colours[7][1];
    c=colours[7][2];
  }
  if (keyPressed && key =='y' || key =='Y') {
    a=colours[8][0];
    b=colours[8][1];
    c=colours[8][2];
  }  
  if (keyPressed && key =='u' || key =='U') {
    a=colours[9][0];
    b=colours[9][1];
    c=colours[9][2];
  }
}

