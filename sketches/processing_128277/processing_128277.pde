
/*Assignment 4
 
 Draws a psudeo maze with stroke weights based on 
 mouse position
 /Added stuff
 Screen flashes in bright colors
 Storkes change color every second
 Pressing the spacebar makes the image from being redrawn (stop loop)
 relesaing it continues the loop
 
 
 Arturo Alviar
 01/09/2014
 */

int tileCount = 20;

void setup() {
  size(800, 800);
  frameRate(60);
}

void draw() {
  //Random color background flashes really bright
  //background(random(50,255) ,random(0,255) ,random(100,255));
  //Black background is safer to view
  background(0);
  for (int i = 0; i < tileCount; i++) {
    for (int j = 0; j< tileCount; j++) {
      int x, y, x2, y2, randNum;
      randNum = (int)random(0, 2);
      if (randNum ==0) {
        x = i * (width/tileCount);
        y = j * (height/tileCount);
        x2 = (i * (width/tileCount)) + (width/tileCount);
        y2 = (j * (height/tileCount)) + (height/tileCount);
        stroke(random(0,255),random(0,255),random(0,255),180);
        strokeWeight(mouseX/40);
        line(x, y, x2, y2);
      }
      else {
        x = (i * (width/tileCount)) + (width/tileCount);
        y = j * (height/tileCount);
        x2 = (i * (width/tileCount));
        y2 = (j * (height/tileCount)) + (height/tileCount);
        stroke(random(0,255),random(0,255),random(0,255),180);
        strokeWeight(mouseY/40);
        line(x, y, x2, y2);
      }
    }
  }
}

void keyPressed() {
    switch(key) {
  case ' ':
    noLoop();
    break;
    }
}

void keyReleased() {

  switch(key) {
  case 'r':
    redraw();
    break;
    
  case ' ':
    loop();
    break;
    
  case 's':
    saveFrame("aalviar_hw4b_####.png");
    break;
  }
}



