
Triad myTriad;


boolean fade = false;
int decay = 0;
boolean restart = false;

float orixspacing = 40;
float oriyspacing = 40;
float orifatstore = 50;
float orixposmodstore = 10;
float oriyposmodstore = 10;

float xspacing = orixspacing;
float yspacing = oriyspacing;
float fatstore = orifatstore;
float xposmodstore = orixposmodstore;
float yposmodstore = oriyposmodstore;

int click = 1;

void setup() {
  background(0);
  size(500, 500);
  smooth();
  int i = 0;
  //                  (                 xpm, ypm, fat, chance
  myTriad = new Triad(-xspacing, -yspacing, xposmodstore, yposmodstore, fatstore, 60);
  i++;
  click = 1;
  decay = 0;
}


void draw() {
  if (click == 1) {
    restart = false;
    if (fade == true) {
      fill (0, 10);
      stroke(0);
      strokeWeight(0);
      rect(-2, -2, width+2, height+2);
    }
    myTriad.display();
    myTriad.shuffle();
    println(decay);
  }
}
void mousePressed() {
  if (click == 1) {
    click = 0;
  }
  else {
    click = 1;
  }
}

class Triad { 
  float xpos;
  float ypos;
  float xposmod;
  float yposmod;
  float fat;
  float redo;
  float redoChance;


  Triad(float tempXpos, float tempYpos, float tempXposmod, float tempYposmod, float tempFat, float tempRedoChance) { 
    xpos = tempXpos;
    ypos = tempYpos;
    xposmod = tempXposmod;
    yposmod = tempYposmod;
    fat = tempFat;
    redoChance = tempRedoChance;
    redo = 1;
  }

  void display() {
    while (redo < redoChance) {
      stroke(0);
      int randomfat = (int)random(fatstore/2, fatstore);
      strokeWeight(randomfat);
      int xshift = (int)random(-xposmod, xposmod);
      int yshift = (int)random(-yposmod, yposmod);
      point (xpos+xshift, ypos+yshift);
      strokeWeight(randomfat*0.5);
      stroke(120, 160, (int)random(255));
      point (xpos+xshift, ypos+yshift);
      redo = (int)random(100);
      
      if ((keyPressed)&&(key == 'y')) {
        yposmod = yposmod+1;
      }
      if ((keyPressed)&&(key == 'u')&&(yposmod>2)) {
        yposmod = yposmod-1;
      }
      if ((keyPressed)&&(key == 'x')) {
        xposmod = xposmod+1;
      }
      if ((keyPressed)&&(key == 'c')&&(xposmod>2)) {
        xposmod = xposmod-1;
      }
      if ((keyPressed)&&(key == 'j')&&(redoChance<98)) {
        redoChance = redoChance+2;
      }
      if ((keyPressed)&&(key == 'k')&&(redoChance>3)) {
        redoChance = redoChance-2;
      }
    }
  }

  void shuffle() {
    xpos = xpos + xspacing;
    redo = 1;
    if (xpos > width+xspacing) {
      xpos = 0;
      ypos = ypos+yspacing;
    }
    if ((ypos>height+yspacing)&&(fat>1)) {
      ypos = 0;
      if (decay == -1) {
        fatstore = fatstore*0.6;
      }
      if (decay == 1) {
        fatstore = fatstore*1.4;
      }
    }
  }
}

void keyPressed() {
  if (key == 'f') {
    fade = false;
  }
  if (key == 'g') {
    fade = true;
  }
  if (key == 'q') {
    decay = -1;
  }
  if (key == 'w') {
    decay = 0;
  }
  if (key == 'e') {
    decay = 1;
  }
}


