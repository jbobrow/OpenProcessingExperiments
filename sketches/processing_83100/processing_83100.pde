
// Written by Felix Faire

import ddf.minim.*;
import ddf.minim.signals.*;
//audio stuff
Minim minim;

AudioSample C;
AudioSample Cs;
AudioSample D;
AudioSample Ds;
AudioSample E;
AudioSample F;
AudioSample Fs;
AudioSample G;
AudioSample Gs;
AudioSample A;
AudioSample Bb;
AudioSample B;


PFont f;
float[][] Notes = { 
  {
    261.626, 255, 0, 0
  }
  , 
  {
    277.183, 255, 127, 0
  }
  , 
  {
    293.665, 255, 255, 0
  }
  , 
  {
    311.127, 127, 255, 0
  }
  , 
  {
    329.628, 0, 255, 0
  }
  , 
  {
    349.228, 0, 255, 127
  }
  , 
  {
    369.994, 0, 255, 255
  }
  , 
  {
    391.995, 0, 127, 255
  }
  , 
  {
    415.305, 0, 0, 255
  }
  , 
  {
    440, 127, 0, 255
  }
  , 
  {
    466.164, 255, 0, 255
  }
  , 
  {
    493.883, 255, 0, 127
  }
};

String[] Names = {
  "C", "C#", "D", "Eb", "E", "F", "F#", "G", "G#", "A", "Bb", "B"
};

float xPos;
float yPos;

float textHeight = 80;
float col = 0;

int current = 0;

Boolean clicked = false;
Boolean ctrl = false;
Boolean circlePress = false;

//Top bar displacement
float i = 8;
//bottom bar displacement
float j = 8;

//circle blur expansion
float k = 0;
//arrow movement
float m = 0;
float n = 1;

// bar height
float h = 45;
float barspeed = 4;

Boolean showtext = true;
Boolean Bar = false;
Boolean showWheel = false;
Boolean showKeyboard = false;

AudioSample[] piano;

void setup() {
  //visual
  size(500, 500);
  colorMode(RGB);
  smooth();
  f = loadFont("HelveticaWorld-Regular-200.vlw");
  textFont(f, textHeight);
  textAlign(CENTER);
  //details for minim, line out with oscillator, speed set to portamento and added
  minim = new Minim(this);

  piano = new AudioSample[12];
  piano[0] = minim.loadSample("C.mp3", 1024);
  piano[1] = minim.loadSample("C#.mp3", 1024);
  piano[2] = minim.loadSample("D.mp3", 1024);
  piano[3] = minim.loadSample("D#.mp3", 1024);
  piano[4] = minim.loadSample("E.mp3", 1024);
  piano[5] = minim.loadSample("F.mp3", 1024);
  piano[6] = minim.loadSample("F#.mp3", 1024);
  piano[7] = minim.loadSample("G.mp3", 1024);
  piano[8] = minim.loadSample("G#.mp3", 1024);
  piano[9] = minim.loadSample("A.mp3", 1024);
  piano[10] = minim.loadSample("Bb.mp3", 1024);
  piano[11] = minim.loadSample("B.mp3", 1024);


  textHeight = 200;
}

void draw () {

  xPos = mouseX;
  yPos = mouseY;

  background (Notes[current%12][1], Notes[current%12][2], Notes[current%12][3]);
  if (keyPressed) {
    if (key == 'k') {
      showKeyboard = true;
      showWheel = false;
    }
    else if (key == 'w') {
      showWheel = true;
      showKeyboard = false;
    }
    else{showWheel = false;
    showKeyboard = false;
    }
  }
  if (showKeyboard == true){
    Pianokeys(60,90);
  }
  if (showWheel == true) {
    ColourWheel(200);
  }

  if (clicked == true && dist(xPos, yPos, width/2, height/2)<80) {
    piano[current].trigger();
    circlePress = true;
    k = 1;
    n = 1;
    m = 0;
    clicked = false;
  }

  if (showtext == true && circlePress == true) {
    bounce();
  }

  if (showtext == false && circlePress == false) {
    fill(0);
    noStroke();
    ellipse(width/2, height/2, 80, 80);
  }
  if (showtext == false && circlePress == true ) {
    bounce();
    soundCircle();
  }

  //Top bar button
  if (yPos<h) {   
    if (i<h) {
      i = i + barspeed;
    }
  }
  else {
    if (i>8) {
      i = i - barspeed;
    }
  }
  fill(0);

  //rect(0, 0, width, i);
  clickBar(0, 0, width, 0, i);


  if (clicked == true && yPos < h ) {
    showtext = !showtext;
    clicked = false;
  }

  if (showtext == false) {
    fill(Notes[current][1], Notes[current][2], Notes[current][3]);
    textFont(f, 20);
    text("Show Key", width/2, 30);
  }
  else {
    fill(Notes[current][1], Notes[current][2], Notes[current][3]);
    textFont(f, 20);
    text("Hide Key", width/2, 30);
  }

  //Bottom bar button
  if (yPos>height - h) {   
    if (j<h) {
      j = j + barspeed;
    }
  }
  else {
    if (j>8) {
      j = j - barspeed;
    }
  }
  fill(0);

  //rect(0, height - j, width, height );
  clickBar(0, height, width, height, height-j);


  if (clicked == true && yPos > height - h ) {
    current = int(random(12));
    clicked = false;
  }

  fill(Notes[current][1], Notes[current][2], Notes[current][3]);
  textFont(f, 20);
  text("Random", width/2, height - 15);



  if (clicked == true && xPos<(width/2-140) && xPos>(width/2-160) && yPos<height/2+10 && yPos>height/2-10) {
    current = current-1;
    if (current<0) {
      current = 11;
    }
    clicked = false;
    col = 50;
  }
  else {
    col = 0;
  }

  if (xPos<(width/2-140) && xPos>(width/2-160) && yPos<height/2+10 && yPos>height/2-10) {
    col = 255;
  }
  else {
    col = 0;
  }
  stroke(0);
  pushMatrix();
  translate(width/2-140 - 20*n*sin(m), height/2);
  fill(col);
  triangle(0, -10, 0, 10, -20, 0);
  popMatrix();

  if (clicked == true && xPos>(width/2+140) && xPos<(width/2+160) && yPos<height/2+10 && yPos>height/2-10) {
    current = (current+1)%12;
    clicked = false;
    col = 50;
  } 
  else {
    col = 0;
  } 

  if (xPos>(width/2+140) && xPos<(width/2+160) && yPos<height/2+10 && yPos>height/2-10) {
    col = 255;
  }
  else {
    col = 0;
  }

  stroke(0);
  pushMatrix();
  translate(width/2+140 + 20*n*sin(m), height/2);
  fill(col);
  triangle(0, -10, 0, 10, 20, 0);
  popMatrix();




  fill(0);
  textFont(f, textHeight);
  if (showtext == true) {
    text (Names[current], width/2, height/2+textHeight/2.5);
  }
}

void mouseClicked() {
  if (clicked == false) {
    clicked = true;
  }
  else {
    clicked = false;
  }
}

void clickBar(float startX, float startY, float endX, float endY, float disp) {
  beginShape();
  curveVertex(-20, startY);
  curveVertex(startX, startY);
  curveVertex(width/2, disp);
  curveVertex(endX, endY);
  curveVertex(width+20, endY);
  endShape();
}

void bounce() {
  m += 0.3;
  if (n>0) {
    n -= 0.02;
  }
  if (n<0.03) {
    circlePress = false;
  }
}

void soundCircle() {
  if (k>0) {
    k -= 0.02;
  }
  noStroke();
  fill(0);
  ellipse(width/2, height/2, 80, 80);
  fill(Notes[current][1], Notes[current][2], Notes[current][3], k*255);
  ellipse(width/2, height/2, 80, 80);
  fill(0, k*255-120);
  ellipse(width/2, height/2, 360-280*k, 360-280*k);
  if (k<0.03) {
    circlePress = false;
  }
}


void stop () {
  //out.close();
  piano[current].close();
  minim.stop();

  super.stop();
}

void Pianokeys(float H, float Hp) {
  noStroke();
  rectMode(CORNERS);
  fill(Notes[0][1], Notes[0][2], Notes[0][3]);
  rect(0, H, width/7, H + Hp);

  fill(Notes[2][1], Notes[2][2], Notes[2][3]);
  rect(width/7, H, 2*width/7, H + Hp);

  fill(Notes[4][1], Notes[4][2], Notes[4][3]);
  rect(2*width/7, H, 3*width/7, H + Hp);

  fill(Notes[5][1], Notes[5][2], Notes[5][3]);
  rect(3*width/7, H, 4*width/7, H + Hp);

  fill(Notes[7][1], Notes[7][2], Notes[7][3]);
  rect(4*width/7, H, 5*width/7, H + Hp);

  fill(Notes[9][1], Notes[9][2], Notes[9][3]);
  rect(5*width/7, H, 6*width/7, H + Hp);

  fill(Notes[11][1], Notes[11][2], Notes[11][3]);
  rect(6*width/7, H, width, H + Hp);


  fill(Notes[1][1], Notes[1][2], Notes[1][3]);
  rect(2*width/21, H, 4*width/21, H + Hp/2);

  fill(Notes[3][1], Notes[3][2], Notes[3][3]);
  rect(5*width/21, H, 7*width/21, H + Hp/2);

  fill(Notes[6][1], Notes[6][2], Notes[6][3]);
  rect(11*width/21, H, 13*width/21, H + Hp/2);

  fill(Notes[8][1], Notes[8][2], Notes[8][3]);
  rect(14*width/21, H, 16*width/21, H + Hp/2);

  fill(Notes[10][1], Notes[10][2], Notes[10][3]);
  rect(17*width/21, H, 19*width/21, H + Hp/2);
}

void ColourWheel(float r_) {
  rectMode(CENTER);
  noStroke();
  for (int i=0;i<12;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(i*(2*PI)/12);
    fill(Notes[i][1], Notes[i][2], Notes[i][3]);
    ellipse(0, -r_, 30, 30);
    popMatrix();
  }
}



