

import ddf.minim.*;

PImage bg;
Minim minim;
AudioSample sound;
//boolean rect = false;
String[] words = { "this", "is", "how", "you", "doing", "but", "with", "out", "exception", "we have life" };

void setup(){
    size(800, 600);
    background(#000000);
    smooth();
    noFill();    
    colorMode(HSB, 100);
    bg = loadImage("minimalwall.png");
    minim = new Minim(this);
    sound = minim.loadSample("sound.wav");
}


int baseSize = 20;
int value1 = 0;
int value2 = 100;
int value3 = 200;
int wordKey = 0;

void draw() {
  image(bg,0,0,520,346);
 
  if (mousePressed) {
    fill(value1, value2, value2, 25);
    
    int size = (int) random(20, 30);
    stroke((int) random(0, 360));
    
    int off2 = Math.max(baseSize+2, 1), off2Neg = Math.max(baseSize-2, 1);
    int off5 = Math.max(baseSize+5, 1), off5Neg = Math.max(baseSize-5, 1);
    int off10 = Math.max(baseSize+10, 1), off10Neg = Math.max(baseSize-10, 1);
    
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off5, off5);
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off5Neg, off5Neg);
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off10, off10);
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off10Neg, off10Neg);
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off2, off2);
      ellipse ((int) random(mouseX - 10, mouseX + 10),
      (int) random(mouseY - 10, mouseY + 10), off2Neg, off2Neg);
    
  }
  //background(#000000);
}


void drawEllipse() {
    int i = (int) random(200, 1200);
    int size = (int) random(5, 80);
    int stren = (int)random(0, 100);
    
    while (i >= 2) {
        size -= 4;
        if (size < 5) {
            size = 5;
        }        
        
        int mod = (int) random(-100, 155);
        
        value1 = modifyValue(value1, mod);
        value2 = modifyValue(value2, mod);
        value3 = modifyValue(value3, mod);
        stroke((int) random(0, 360));
        fill(value1, value2, value2, stren);
        i-=size;
        
          ellipse(mouseX, mouseY, i, i);
       
        
    }
    
}


void mouseDragged() {
    int offset = 6;
    value1 = modifyValue(value1, 6);
    value2 = modifyValue(value2, 6);
    value3 = modifyValue(value3, 6);
}


int modifyValue(int value, int mod) {
    value = value + mod;
    if (value > 255) {
        value = 0;
    }
    
    return value;
}


void keyReleased(){
    
    
    if (key == 's' || key == 'S') {
        saveFrame("image_" + value1 + ".png");
        sound.trigger();
    }
    
    if (key == '+') {
        baseSize += 3;
    }
    
    if (key == '-') {
        baseSize -= 3;
    }
    
    
    
   
    
    if (key == ENTER) {
      textSize(32);
      fill(2, 0, 73);
      if (wordKey == 10) {
        wordKey = 0;
      }
      text(words[wordKey], (int) random(10, width-10), (int) random(10, height-10));
      wordKey++;
    }
}


