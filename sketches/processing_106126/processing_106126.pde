
int numballs = 500;
float [] xpos = new float[numballs]; //creates an array for the x position of the circle
float [] ypos = new float[numballs]; //array for y pos
float [] speedx = new float[numballs];  //speed for xpos
float [] speedy = new float[numballs]; //speed for ypos
float [] opacity = new float [numballs];
float [] radius =  new float[numballs];
int [] hue = new int[numballs];
float gravity = 0.9;
float gravity2 = int(-0.95);
float disappear =60;
PFont Roman;



void setup() {
  size(500, 500);
  colorMode (HSB, 255);
  background(255);
  noStroke();
  for (int i = 0; i < numballs; i++) {
    xpos[i]= int(random(1, 500));
    ypos[i]= int(random(1, 500));
    hue[i]= int(random(1, 255));
    radius[i]= int(random(10, 50));
    opacity[i]= 50;
    speedx[i]= int(random(1, 5));
    speedy[i]= int(random(1, 5));
    Roman = loadFont("Delicious-Roman-48.vlw");
    textFont(Roman, 32);
  }
}
void draw() {
  //background to stop balls repleating behind eachother
  //call functions to to different tasks- they need to get drawn out somewhere- here!
  background(255);
  rectMode(CENTER);
  textSize(20);
  fill(255, 255, 255);

  text("Click objects to erase", 250, 30);
  text("Drag objects to pick up", 250, 50);
  text("Press down to reset", 250, 70);
  

  drawBalls();
  moveBalls();
  bounceBalls();
  disappearBalls();
  collideBalls();
}

//we need to draw the balls, so we use a fuction that says for integer i, if i is less than width then plus 1
//
void drawBalls() {
  for (int i = 0; i < numballs; i++) {
    fill(i, 255, 255, opacity [i]);
    ellipse(xpos[i], ypos[i], radius[i], radius[i]);
  }
}

void moveBalls() {
  for (int i=0; i < numballs; i++) {
    speedy[i]= speedy[i] + gravity;
    xpos[i] += speedx [i];
    ypos[i] += speedy [i];
  }
}
void bounceBalls() {

  for (int i=0; i < numballs; i++) {
    if (xpos[i] >= width-radius[i]/2) {
      speedx[i] = -speedx[i]*.9 ;
      //we need the balls to- if they go off the screen- to place them back onto the screen
      xpos[i]= width-radius[i]/2;
    }
    if (xpos[i] <= radius[i]/2) {
      speedx [i]= -speedx[i]*.9;
      xpos[i]= -radius[i]/2;
    }
    if (ypos[i]  >= height-radius[i]/2) {
      speedy[i] = -speedy[i]*.9;
      speedx[i]*=gravity;
      ypos[i]= height-radius[i]/2;
    }
    if (ypos[i] <= radius[i]/2) {
      speedy[i] = -speedy[i]*.9;
      ypos[i]= -radius[i]/2;
    }
  }
}
void disappearBalls() {
  for (int i = 0; i < numballs; i++) {
    if (dist(mouseX, mouseY, xpos[i], ypos[i]) < disappear) {
      opacity[i] = 0;
    }
  }
}
void keyPressed() {
  for (int i = 0; i < numballs; i++) {
    opacity[i] = 50;
  }
}
void collideBalls() {
  for (int i = 0; i < numballs; i++) {
    for (int j = 1; j < numballs; j++) {
      if (dist(xpos[i], ypos[i], xpos[j], ypos[j]) <radius [i] + radius [j] /2); 
      {
        speedx[i] = - speedx[i];
        speedy[j] = - speedy[j];
      }
    }
  }
}



//}
//void draw() {
//  
//}
//
//void circle() {
//  



