

int number;      //use to create background
int attempts = 0;

int digit1,digit2,digit3,digit4;
int digitCount = 1;
int greenLight = 0;
int yellowLight = 0;

int code1;
int code2;
int code3;
int code4;

import fullscreen.*; 
import ddf.minim.*;

/*FullScreen fs; 
Minim minim;
AudioSample beep;
AudioSample dial;
AudioSample explosion;
AudioSample powerDown;*/
Button button1,button2,button3,button4,button5,button6,button7,button8,button9,button0,DelButton,EntButton; 

PFont font1;
PFont font2;
PFont font3;

//light colors
color ball1,ball2,ball3,ball4;

boolean defuse = false;
boolean endSound = false;

void setup() {
  frameRate(10);
  size(725,400);
  smooth();
  font1 = loadFont("DialogInput-15.vlw");
  font2 = loadFont("AdobeFanHeitiStd-Bold-10.vlw");
  font3 = loadFont("OratorStd-Slanted-75.vlw");
  
  //define color of the light
  ball1 = color(0);
  ball2 = color(0);
  ball3 = color(0);
  ball4 = color(0);
  
  //create buttons
  button1 = new Button(278, 170, 1);
  button2 = new Button(338, 170, 2);
  button3 = new Button(398, 170, 3);
  button4 = new Button(278, 200, 4);
  button5 = new Button(338, 200, 5);
  button6 = new Button(398, 200, 6);
  button7 = new Button(278, 230, 7);
  button8 = new Button(338, 230, 8);
  button9 = new Button(398, 230, 9);
  button0 = new Button(338, 260, 0);
  DelButton = new Button(278, 260, "✕");
  EntButton = new Button(398, 260, "✓");
  
  // Create the fullscreen object
 /* fs = new FullScreen(this); 
  
  // enter fullscreen mode
  fs.enter(); 
  
  //enable sounds
  minim = new Minim(this);
  
  beep = minim.loadSample("beep-7.wav");
  dial = minim.loadSample("beep-6.wav");
  explosion = minim.loadSample("Explosion.wav");
  powerDown = minim.loadSample("Power-down.wav");*/
  
  while(code1 == code2 || code1 == code3 || code1 == code4 || code2 == code3 || code2 == code4 || code3 == code4) {
    code1 = (int)random(10);
    code2 = (int)random(10);
    code3 = (int)random(10);
    code4 = (int)random(10);
  }
}


//////////////////////////////////////////////////////////////


void draw() {
  if (defuse) {
      fill (0,20);
      rect(0,0,width,height);
    
    
  }
  
  else if (attempts == 15) {
    
    //create background
    for (int x = 0; x < 900; x += 8) {
      for (int y = 0; y < 400; y += 12) {
        number = (int)random(2);
        text(number,x,y);
      }
    }
    
    /*beep.trigger();
    delay(500);
    beep.trigger();
    delay(450);
    beep.trigger();
    delay(400);
    beep.trigger();
    delay(350);
    beep.trigger();
    delay(300);
    beep.trigger();
    delay(250);
    beep.trigger();
    delay(200);
    beep.trigger();
    delay(150);
    beep.trigger();
    delay(100);
    beep.trigger();
    delay(500);
    explosion.trigger();
    delay(3000);*/
    noLoop();
    
  }
  
  else {
    //sound();
    
    background(0);
    
    
    fill(#07DB2B);
    textFont(font2);
    
    //create background
    for (int x = 0; x < 900; x += 8) {
      for (int y = 0; y < 400; y += 12) {
        number = (int)random(2);
        text(number,x,y);
      }
    }
    
    //screen
    fill(0);
    rect(240,98,243,59);
    
    //entered code
    fill(#D80000);
    textFont(font3);
    text(digit1,260,153);
    text(digit2,315,153);
    text(digit3,365,153);
    text(digit4,415,153);
    
    //light bulb
    stroke(255,99);
    fill(ball1);
    ellipse(223,110,11,11);
    fill(ball2);
    ellipse(223,140,11,11);
    fill(ball3);
    ellipse(498,110,11,11);
    fill(ball4);
    ellipse(498,140,11,11);
  
    noStroke();
    fill(0,99);
    rect(273,163,180,125);
    rect(213,86,298,210);
    
    //buttons
    button1.drawButton();
    button2.drawButton();
    button3.drawButton();
    button4.drawButton();
    button5.drawButton();
    button6.drawButton();
    button7.drawButton();
    button8.drawButton();
    button9.drawButton();
    button0.drawButton();
    DelButton.drawButton();
    EntButton.drawButton();
  }
}

///////////////////////////////////////////////////////////////


void mousePressed(){
  println(mouseX + " " + mouseY);

  if (button1.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 1;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 1;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 1;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 1;
      digitCount++;
    }
  }
  
  if (button2.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 2;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 2;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 2;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 2;
      digitCount++;
    }
  }
  
  if (button3.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 3;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 3;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 3;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 3;
      digitCount++;
    }
  }
  
  if (button4.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 4;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 4;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 4;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 4;
      digitCount++;
    }
  }
  
  if (button5.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 5;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 5;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 5;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 5;
      digitCount++;
    }
  }
  
  if (button6.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 6;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 6;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 6;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 6;
      digitCount++;
    }
  }
  
  if (button7.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 7;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 7;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 7;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 7;
      digitCount++;
    }
  }
  
  if (button8.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 8;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 8;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 8;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 8;
      digitCount++;
    }
  }
  
  if (button9.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 9;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 9;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 9;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 9;
      digitCount++;
    }
  }
  
  if (button0.mouseIsOver()) {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 0;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 0;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 0;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 0;
      digitCount++;
    }
  }
  
  if (DelButton.mouseIsOver()) {
    //dial.trigger();
    digitCount--;
    if (digitCount == 1) {
      digit1 = 0;
    }
    else if (digitCount == 2) {
      digit2 = 0;
    }
    else if (digitCount == 3) {
      digit3 = 0;
    }
    else if (digitCount == 4) {
      digit4 = 0;
    }
    else if (digitCount < 1) {
      digitCount = 1;
    }
  }
  
  if (EntButton.mouseIsOver()) {
    checkCode();
    changeLight();
    digit1 = 0;
    digit2 = 0;
    digit3 = 0;
    digit4 = 0;
    digitCount = 1;
    attempts++;
    println(attempts);
  }
  
}


///////////////////////////////////////////////////////////////


void keyPressed(){

  if (key == '1') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 1;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 1;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 1;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 1;
      digitCount++;
    }
  }
  
  if (key == '2') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 2;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 2;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 2;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 2;
      digitCount++;
    }
  }
  
  if (key == '3') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 3;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 3;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 3;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 3;
      digitCount++;
    }
  }
  
  if (key == '4') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 4;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 4;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 4;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 4;
      digitCount++;
    }
  }
  
  if (key == '5') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 5;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 5;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 5;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 5;
      digitCount++;
    }
  }
  
  if (key == '6') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 6;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 6;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 6;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 6;
      digitCount++;
    }
  }
  
  if (key == '7') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 7;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 7;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 7;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 7;
      digitCount++;
    }
  }
  
  if (key == '8') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 8;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 8;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 8;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 8;
      digitCount++;
    }
  }
  
  if (key == '9') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 9;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 9;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 9;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 9;
      digitCount++;
    }
  }
  
  if (key == '0') {
    //dial.trigger();
    if (digitCount == 1) {
      digit1 = 0;
      digitCount++;
    }
    else if (digitCount == 2) {
      digit2 = 0;
      digitCount++;
    }
    else if (digitCount == 3) {
      digit3 = 0;
      digitCount++;
    }
    else if (digitCount == 4) {
      digit4 = 0;
      digitCount++;
    }
  }
  
  if (key == DELETE || key == BACKSPACE) {
    //dial.trigger();
    digitCount--;
    if (digitCount == 1) {
      digit1 = 0;
    }
    else if (digitCount == 2) {
      digit2 = 0;
    }
    else if (digitCount == 3) {
      digit3 = 0;
    }
    else if (digitCount == 4) {
      digit4 = 0;
    }
    else if (digitCount < 1) {
      digitCount = 1;
    }
  }
  
  if (key == ENTER || key == RETURN) {
    checkCode();
    changeLight();
    digit1 = 0;
    digit2 = 0;
    digit3 = 0;
    digit4 = 0;
    digitCount = 1;
    attempts++;
    println(attempts);
  }
  
}


//////////////////////////////////////////////////////////

/*
void sound() {
  if (attempts > 0 && attempts < 5) {
    if (frameCount%20 == 0) {
      beep.trigger();
    }
  }
  
  else if (attempts >= 5 && attempts < 10) {
    if (frameCount%10 == 0) {
      beep.trigger();
    }
  }
  
  else if (attempts >= 10 && attempts < 15) {
    if (frameCount%5 == 0) {
      beep.trigger();
    }
  }
}


void endSound() {
  powerDown.trigger();
  endSound = true;
}*/

