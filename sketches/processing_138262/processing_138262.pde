
/* SIMPLE VZUALIZATIONS OF CARDS SIGNS */

/* 
   CONTROLS:
   key 1 - ON/OFF shape 1 
   key 2 - ON/OFF shape 2
   key 3 - ON/OFF shape 3 
   key 4 - ON/OFF shape 4 
   
   SPACE bar - ON/OFF draw and enable color taransparency
   DELETE/BACKSPACE - 1. return original color of shapes
                      2. disable color transparency
                      
   MOUSE MOVE - size of circles 
   MOUSE DRAGGED - change color of shapes 
*/

                      
//Import 'Minim' library files
import ddf.minim.*;

//Global variables 
Minim minim;
AudioPlayer card;
AudioSample signal;
AudioSample buttons;

boolean button0 = true;
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;
boolean button4 = false;

float c;               //color
float brightness = 0;  //color brightness
float trans = 255;     //transparensy

float turnClub;
float turnSpade;
float turnDiamond;
float turnHeart;

PImage cards;

//Setup block
void setup() {  
  //Load audio file
  minim = new Minim(this);
  card = minim.loadFile("cards.wav");
  card.play();
  signal = minim.loadSample("bell.wav");
  buttons = minim.loadSample("buttons.wav");
  
  size(1024, 720);
  colorMode(HSB, 360, 100, 100);
  cards = loadImage("cards.jpg");
  image(cards, 0, 0);
}

//Draw block
void draw() {
  if (button0) {
    image(cards, 0, 0);
  }

  if (button1) {
    pushMatrix();
    translate(width/2, height/2);
    int bile = (int)map(mouseY+100, 0, height, 2, 16);
    int radius = mouseX-width/2;
    float angle = TWO_PI/bile;

    for (int i = 0; i <= bile; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;
      spade(0, 0, x+width/4, y+height/4);
    }
    popMatrix();
  }
  
  if (button2) {
    pushMatrix();
    translate(width/2, height/2);
    int bile = (int)map(mouseY+100, 0, height, 2, 16);
    int radius = mouseX-width/2;
    float angle = TWO_PI/bile;

    for (int i = 0; i <= bile; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;
      club(0, 0, x-width/4, y-height/4);
    }
    popMatrix();
  }

  if (button3) {
    pushMatrix();
    translate(width/2, height/2);
    int bile = (int)map(mouseY+100, 0, height, 2, 16);
    int radius = mouseX-width/2;
    float angle = TWO_PI/bile;

    for (int i = 0; i <= bile; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;
      diamond(0, 0, x+width/4, y-height/4);
    }
    popMatrix();
  }
  
  if (button4) {
    pushMatrix();
    translate(width/2, height/2);
    int bile = (int)map(mouseY+100, 0, height, 2, 16);
    int radius = mouseX-width/2;
    float angle = TWO_PI/bile;

    for (int i = 0; i <= bile; i++) {
      float x = 0 + sin(angle*i)*radius;
      float y = 0 + cos(angle*i)*radius;
      heart(0, 0, x-width/4, y+height/4);
    }
    popMatrix();
  }
}

//When keys is pressed
void keyPressed() {
  if (keyPressed && key == '1') {
    button1 = !button1;
    signal.trigger();
  }
  if (keyPressed && key == '2') {
    button2 = !button2;
    signal.trigger();
  }
  if (keyPressed && key == '3') {
    button3 = !button3;
    signal.trigger();
  }
  if (keyPressed && key == '4') {
    button4 = !button4;
    signal.trigger();
  }  
  if (keyPressed && key == ' ') {
    buttons.trigger();
    button0 = !button0;
    trans = 100;
  }
  if (key == DELETE || key == BACKSPACE) {
    buttons.trigger();
    brightness = 0;
    trans = 255;
    c = 360*3;
  }
}
//When mouse is dragged
void mouseDragged() {
  c = (int)map(mouseX, 0, height, 0, 360);
  brightness++;
  c++;
}

//POLYGONS
//Spade
void spade(float x, float y, float trX, float trY) {
  pushMatrix();
  translate(trX, trY);
  scale(0.2);
  rotate(map(turnSpade, 0, 180, 0, PI));

  fill(c, 100, brightness, trans);
  stroke(360, 100, 0);
  beginShape();
  vertex(x-5, y+10);
  bezierVertex(x-50, y+70, x-120, y+40, x-123, y);
  bezierVertex(x-130, y-80, x-10, y-130, x, y-180);
  bezierVertex(x+10, y-130, x+130, y-80, x+123, y);
  bezierVertex(x+120, y+40, x+50, y+70, x+5, y+10);
  bezierVertex(x+5, y+10, x, y+120, x+60, y+120);
  bezierVertex(x, y+115, x, y+115, x-60, y+120);
  bezierVertex(x, y+120, x-5, y+10, x-5, y+10); 
  endShape();
  popMatrix();
  turnSpade++;
}

//Club
void club(float x, float y, float trX, float trY) {
  pushMatrix();
  translate(trX, trY);
  scale(0.2);
  rotate(map(turnClub, 0, 180, 0, PI));

  fill(c*2, 100, brightness, trans);
  stroke(360, 100, 0);
  beginShape();
  vertex(x-5, y+10);
  bezierVertex(x-160, y+140, x-160, y-140, x-20, y-20); //left leaf
  bezierVertex(x-140, y-160, x+140, y-160, x+20, y-20); //top leaf
  bezierVertex(x+160, y-140, x+160, y+140, x+5, y+10);  //right leaf
  bezierVertex(x+5, y+10, x, y+120, x+60, y+120);       //leg right
  bezierVertex(x, y+115, x, y+115, x-60, y+120);        //leg bottom
  bezierVertex(x, y+120, x-5, y+10, x-5, y+10);         //leg left
  endShape();
  popMatrix();
  turnClub++;
}

//Diamond
void diamond(float x, float y, float trX, float trY) {
  pushMatrix();
  translate(trX, trY);
  scale(0.2);
  rotate(map(turnDiamond, 0, 180, 0, PI));


  fill(c/3, 100, 100, trans);
  stroke(360, brightness, 100);
  beginShape();
  vertex(x-160, y);
  bezierVertex(x-100, y-30, x-30, y-100, x, y-170);
  bezierVertex(x+30, y-100, x+100, y-30, x+160, y);
  bezierVertex(x+100, y+30, x+30, y+100, x, y+170);
  bezierVertex(x-30, y+100, x-100, y+30, x-160, y);
  endShape();
  popMatrix();
  turnDiamond--;
}

//Heart
void heart(float x, float y, float trX, float trY) {
  pushMatrix();
  translate(trX, trY);
  scale(0.2);
  rotate(map(turnHeart, 0, 180, 0, PI));

  fill(c/2, 100, 100, trans);
  stroke(360, 100, 100);
  beginShape();
  vertex(x, y+140);
  bezierVertex(x-10, y+90, x-130, y+40, x-123, y-40);
  bezierVertex(x-120, y-80, x-50, y-110, x, y-40);
  bezierVertex(x+50, y-110, x+120, y-80, x+123, y-40);
  bezierVertex(x+130, y+40, x+10, y+90, x, y+140);
  endShape();
  popMatrix();
  turnHeart--;
}



