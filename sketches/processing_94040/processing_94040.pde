
//

PImage motif;
PImage gold;
PImage star;
int x = 0;
boolean paused = false;

void setup() {
  size(1200, 700);
  background(255);
  motif = loadImage("a1.png");
  gold = loadImage("d3.png");
  star = loadImage("e2.png");
  for (int x=0;x<width-160;x=x+motif.width/4) {
    image(motif, x, 0, motif.width/2, motif.height/2.);
  }
  for (int x=0;x<width-160;x=x+motif.width/4) {
    image(motif, x, motif.height/2, motif.width/2, motif.height/2.);
  }
  for (int x=0;x<width-160;x=x+motif.width/8) {
    blend(motif, 0, 0, motif.width, motif.height, x, motif.height*3/8, motif.width/2, motif.height/2, MULTIPLY);
  }
  for (int x=0;x<width-160;x=x+motif.width/8) {
    blend(motif, 0, 0, motif.width, motif.height, x, motif.height*-1/8, motif.width/2, motif.height/2, MULTIPLY);
  }
  for (int x=0;x<width;x=x+motif.width/8) {
    blend(motif, 0, 0, motif.width, motif.height, x, motif.height*-1/4, motif.width/2, motif.height/2, SCREEN);
  }
  for (int x=0;x<width;x=x+motif.width/8) {
    blend(motif, 0, 0, motif.width, motif.height, x, motif.height/4, motif.width/2, motif.height/2, SCREEN);
  }
  for (int x=0;x<width;x=x+motif.width/8) {
    blend(motif, 0, 0, motif.width, motif.height, x, motif.height*3/4, motif.width/2, motif.height/2, SCREEN);
  }
}

void draw() {
    if (keyPressed == true) {
      if (key == 'g' || key == 'G') {
        //      rotate(random(PI/4));
        image(gold, mouseX-gold.width/8, mouseY-gold.height/8, gold.width/4, gold.height/4);
      }
      if (key == 'f' || key == 'F') {
        //      rotate(random(PI/4));
        image(gold, mouseX-gold.width/4, mouseY-gold.height/4, gold.width/2, gold.height/2);
      }
    }
    if (!paused) {
    image(star, random(width), random(height), star.width/16, star.height/16);
  }
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    for (int x=0;x<width-160;x=x+motif.width/4) {
      image(motif, x, 0, motif.width/2, motif.height/2.);
    }
    for (int x=0;x<width-160;x=x+motif.width/4) {
      image(motif, x, motif.height/2, motif.width/2, motif.height/2.);
    }
    for (int x=0;x<width-160;x=x+motif.width/8) {
      blend(motif, 0, 0, motif.width, motif.height, x, motif.height*3/8, motif.width/2, motif.height/2, MULTIPLY);
    }
    for (int x=0;x<width-160;x=x+motif.width/8) {
      blend(motif, 0, 0, motif.width, motif.height, x, motif.height*-1/8, motif.width/2, motif.height/2, MULTIPLY);
    }
    for (int x=0;x<width;x=x+motif.width/8) {
      blend(motif, 0, 0, motif.width, motif.height, x, motif.height*-1/4, motif.width/2, motif.height/2, SCREEN);
    }
    for (int x=0;x<width;x=x+motif.width/8) {
      blend(motif, 0, 0, motif.width, motif.height, x, motif.height/4, motif.width/2, motif.height/2, SCREEN);
    }
    for (int x=0;x<width;x=x+motif.width/8) {
      blend(motif, 0, 0, motif.width, motif.height, x, motif.height*3/4, motif.width/2, motif.height/2, SCREEN);
    }
  }
  if (key == 'c' || key=='C') {
    fill(255, 20);
    rect(0, 0, width, height);
  }
  //press the space bar to pause and unpause
  if (key == ' ') {
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if (paused) {
      paused = false;
    }
    //otherwise, pause it.
    else {
      paused = true;
    }
  }
}



