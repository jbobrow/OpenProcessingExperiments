
/*
* Project 3 (Final Project)
* by JPLa
* 18.12.2014
*
* This is an interactive greeting card.
* It shows an Xmas tree with decorations.
* You can write your own greeting message.
* Randomly selected characters will trigger 
* changes in decoration colors and may play a sound effect.
*/

// import sound support
import ddf.minim.*;

// global variables
Minim minim;
AudioSample bells;
PImage bg;
PFont myFont;
String greeting = "";
String instruction = "Write your greeting here!";
int [][]balls;
int BALLPOSX = 0;
int BALLPOSY = 1;
int BALLCOLOR = 2;
char []triggerKeys = new char[10];


// init decorative balls (position and initial color)
void initBalls() {
  
  balls = new int[10][3];
  balls[0][BALLPOSX] = 550;
  balls[0][BALLPOSY] = 350;
  balls[0][BALLCOLOR] = #FC4112;
  
  balls[1][BALLPOSX] = 676;
  balls[1][BALLPOSY] = 388;
  balls[1][BALLCOLOR] = #ECF242;
  
  balls[2][BALLPOSX] = 646;
  balls[2][BALLPOSY] = 443;
  balls[2][BALLCOLOR] = #FC4112;
  
  balls[3][BALLPOSX] = 600;
  balls[3][BALLPOSY] = 300;
  balls[3][BALLCOLOR] = #ECF242;
  
  balls[4][BALLPOSX] = 612;
  balls[4][BALLPOSY] = 377;
  balls[4][BALLCOLOR] = #FC4112;
  
  balls[5][BALLPOSX] = 525;
  balls[5][BALLPOSY] = 450;
  balls[5][BALLCOLOR] = #ECF242;
  
  balls[6][BALLPOSX] = 625;
  balls[6][BALLPOSY] = 255;
  balls[6][BALLCOLOR] = #ECF242;
}

// init sound support
void initSound() {
  minim = new Minim(this);
  bells = minim.loadSample("bell3.mp3");
}

// init trigger keys
void initTriggers() {
  // assign random keys to be used as trigger keys
  for (int i = 0; i < triggerKeys.length; i = i + 1) {
    triggerKeys[i] = char(int(random('a','z')));
    println("triggerKey:"+triggerKeys[i]);
  }
}

// setup
void setup() {
  size(800,600);
  bg = loadImage("background.png");
  //background(#F2DFDF);
  myFont = loadFont("myfont.vlw");
  textFont(myFont);
  
  initSound();
  
  initBalls();
  
  initTriggers();  
}

// draw a pulsating star
void drawStar() {
  
  // slight color change makes a pulsating effect
  color c = #FCFC12+floor(random(-50,50));

  fill(c);
  beginShape();
    vertex(600, 140);
    vertex(610, 160);
    vertex(630, 170);
    vertex(610, 180);
    vertex(600, 200);
    vertex(590, 180);
    vertex(570, 170);
    vertex(590, 160);
  endShape(CLOSE);

}

// draw an xmas tree (with stand)
void drawTree() {
  fill(#5DB936);
  triangle(600, 200, 500, 450, 700, 450);
  fill(#B99036);
  rect(590, 450, 20, 50);
  rect(575, 490, 50, 10);
  
}

// draw decorative balls
void drawBalls() {
  for (int i = 0; i < balls.length; i = i+1) {
    if (balls[i][BALLPOSX] != 0) {
      color c = balls[i][BALLCOLOR]+floor(random(-20,20));
      fill(c);
      ellipse(balls[i][BALLPOSX], balls[i][BALLPOSY], 30, 30);
    }
  }
}

// draw a button
void drawButton(String text) {
  fill(#FFCE05);
  strokeWeight(2);
  stroke(#AFA6A6);
  rect(5, 505, 100, 40, 7);
  stroke(#000000);
  strokeWeight(1);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(#050505);
  text(text, 5, 505, 100, 40);
}

// draw everything
void draw() {
  
  // draw background image
  image(bg, 0, 0);
  
  // write instruction text
  strokeWeight(1);
  textSize(32);
  fill(#FFFFFF);
  text("This is an interactive Greeting Card. Write your greeting text and see the xmas tree decorations change color.", 15, 10, 785, 75); 
  
  // show writing area
  fill(#F5EA72);
  rect(5, 95, 405, 405);

  textSize(32);
  textAlign(LEFT);
  if (greeting.length() == 0) {
    // display instruction
    fill(#C6BB3C);
    text(instruction, 10, 100, 400, 400); 
  }
  else {
    // display greeting text
    fill(#744A4A);
    text(greeting, 10, 100, 400, 400);
  }
  
  // reset button
  drawButton("Clear");
  
  // xmas tree
  drawStar();
  drawTree();
  drawBalls();
}


// handle keyboard input
// - printable keys are appended to greeting text
// - BACKSPACE/DELETE remove last character from greeting text
void keyTyped() {
  //println("typed " + int(key) + " " + keyCode);
  switch(key) {
    case BACKSPACE:
    case DELETE:
      // remove the last character from greeting text
      if (greeting.length() > 0) {
        greeting = greeting.substring(0, greeting.length()-1);
      }
      break;
    // case ENTER:
    // case RETURN:
    // treat enter/return as normal text 
    case TAB:
    case ESC:
      // ignore unused special keys
      break; 
    default: 
      // add key to greeting text
      greeting = greeting + key;
      break;
  }

  // see if the key was one of the trigger keys that trigger ball color change
  for (int i = 0; i < triggerKeys.length; i= i + 1) {
    if (key == triggerKeys[i]) {
      balls[floor(random(0, balls.length))][BALLCOLOR] = color(random(10,250), random(10,250), random(10,250));
      bells.setGain(0.025);
      bells.trigger();
    }
  }
}


// handle mouse input
// - reset greeting text and decorations when mouse clicked within the button
void mouseClicked() {
  if (mouseButton == LEFT && mouseX > 5 && mouseY > 505 && mouseX < 105 && mouseY < 545) {
    // reset greeting text
    greeting = "";
    // reset decorations
    initBalls();
    // reset trigger keys
    initTriggers();
  }
}


