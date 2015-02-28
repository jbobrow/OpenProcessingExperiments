
//Variables
int dim = 1024; //Default size
int seed = 1; //Random color
int bitetime = 10; //Frames per bite
float sscale = 10;
float rscale = 10;
int sadjust = floor(sscale/2);
int radjust = 0;

//Mouse monster
Creature mousefollow = new Creature(mouseX,mouseY,128,radjust,sadjust,seed);

//Stamp
int nmax = 100;
int stampN = 0;
Creature[] stamps = new Creature[nmax];

void setup() {
  setuphandle();
}

void draw() {
  drawhandle();
}

void keyReleased() {
  presshandle();
}

void mousePressed() {
  clickhandle();
}

void setuphandle() {
  size( 1024, 1024);        // size of the window
  smooth();                // antialiasing 
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(1);
  frameRate(30);
}

void drawhandle() {
  background(255);
  //Make stamps
  makestamps();
  //Follow mouse
  mousefollow.crePos(mouseX,mouseY);
  mousefollow.creDraw();
}

void clickhandle() {
  if (mouseButton == LEFT && stampN < nmax) {
    addstamps();
  }
  if (mouseButton == RIGHT) {
    chooseSeed();
    mousefollow.creColor(seed);
  }
}

void presshandle() {
  //Clear stage on key press
  if (key == 'c' || key == 'C') {
    stampN = 0;
  }
  else if (key == 'b' || key == 'B') {
    mousefollow.creBite();
    //Do for list as well
    for (int i=0; i < stampN; i ++) {
      stamps[i].creBite();
    }
  }
  else if (key == CODED) {
    arrowcheck();
    mousefollow.creBig(sadjust);
    mousefollow.creSpin(radjust);
  }
}

void arrowcheck() {
  if (keyCode == UP && sadjust <= sscale) {
    sadjust ++;
  }
  else if (keyCode == DOWN && sadjust > 1) {
    sadjust --;
  }
  else if (keyCode == RIGHT) {
    radjust ++;
    while (radjust > rscale) {
      radjust -= rscale;
    }
  }
  else if (keyCode == LEFT) {
    radjust --;
    while (radjust < 0) {
      radjust += rscale;
    }
  }
}

void addstamps() {
  stamps[stampN] = new Creature(mouseX,mouseY,255,radjust,sadjust,seed);
  stampN ++;
}

void makestamps() {
  for (int i=0; i < stampN; i ++) {
    stamps[i].creDraw();
  }
}

class Creature {
  int creX;
  int creY;
  int creAlp;
  float creRot;
  float creSize;
  int creSeed;
  int creBiting = 0;
  Creature (int localX, int localY, int localalp, float localrot, float localsize, int localseed)
  {
    creX = localX;
    creY = localY;
    creAlp = localalp;
    creRot = localrot;
    creSize = localsize;
    creSeed = localseed;
  }
  void creSet (int localX, int localY, int localalp, float localrot, float localsize, int localseed)
  {
    creX = localX;
    creY = localY;
    creAlp = localalp;
    creRot = localrot;
    creSize = localsize;
    creSeed = localseed;
  }
  void crePos(int localX, int localY) {
    creX = localX;
    creY = localY;
  }
  void creTrans(int localalp) {
    creAlp = localalp;
  }
  void creSpin(float localrot) {
    creRot = localrot;
  }
  void creBig(float localsize) {
    creSize = localsize;
  }
  void creColor(int localseed) {
    creSeed = localseed;
  }
  void creBite() {
    if (creBiting == 0) {
      creBiting ++;
    }
  }
  void creDraw () {
    makecreature(creX,creY,creAlp,creRot,creSize,creSeed,creBiting);
    if (creBiting > 0) {
      creBiting++;
      //Reset when done
      if (creBiting > bitetime) {
        creBiting = 0;
      }
    }
  }
}

void makecreature(int localX, int localY, int localalp, float localrot, float localsize, int localseed, int biting) {
  randomSeed(localseed);
  pushMatrix();
    translate(localX,localY);
    scale(2*localsize/sscale);
    rotate(TWO_PI*localrot/rscale);
    translate(-localX,-localY);
    maketail(localX,localY,localalp,biting);
    makefeet(localX,localY,localalp);
    makeface(localX,localY,localalp);
    makemouth(localX,localY,localalp,biting);
    makeantennae(localX,localY,localalp,biting);
  popMatrix();
}

void maketail(int localX, int localY, int localalp, int biting) {
  //Tail wag
  pushMatrix();
    translate(localX-64,localY);
    rotate(-QUARTER_PI*biting/bitetime);
    translate(-(localX-64),-localY);
    stroke(0,localalp);
    //Make the tail point
    noFill();
    strokeWeight(5);
    arc(localX+320,localY+144,64,64,PI+HALF_PI,TWO_PI);
    strokeWeight(1);
    //Add spike ball (square + rotated square)
    fill(0,localalp);
    rect(localX+352,localY+160, 32, 32);
    pushMatrix();
      translate(localX+352,localY+160);
      rotate(QUARTER_PI);
      rect(0,0, 32, 32);
    popMatrix();
    //Make the tail length
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < .5*i; j++) {
        //Random color for each elipse
        fill(darkgreenchoose(),localalp);
        ellipse(localX+320-i*32,localY+112-i*8-j*16/1.5,64,64);
      }
      for (int j = i; j > .5*i; j--) {
        //Random color for each elipse
        fill(darkgreenchoose(),localalp);
        ellipse(localX+320-i*32,localY+112-i*8-j*16/1.5,64,64);
      }
    }
    //Center of tail length
    for (int i = 0; i < 12; i++) {
      int j = floor(.5*i);
      fill(darkgreenchoose(),localalp);
      ellipse(localX+320-i*32,localY+112-i*8-j*16/1.5,64,64);
    }
  popMatrix();
}

void makefeet(int localX, int localY, int localalp) {
  stroke(0,localalp);
  //Choose legs
  fill(midgreenchoose(),localalp);
  ellipse(localX-64,localY+128,64,170);
  ellipse(localX+64,localY+128,64,170);
  //Choose feet
  fill(midgreenchoose(),localalp);
  ellipse(localX-64,localY+192,85,51);
  ellipse(localX+64,localY+192,85,51);
  //Make toes
  fill(midgreenchoose(),localalp);
  for (int i = 0; i < 3; i++) {
    ellipse(localX-96+i*32,localY+224,51,42);
    ellipse(localX+32+i*32,localY+224,51,42);
  }
} 

void makeface(int localX, int localY, int localalp) {
  stroke(0,localalp);
  //New face equation.
  int jtimes = 20;
  pushMatrix();
    //Center of face
    translate(localX,localY);
    for (int i = 0; i <= 5; i++) {
      for (int j = 1; j <= jtimes; j++) {
      //Determine fixed position (no longer random)
      pushMatrix();
        //Circle around face
        rotate(HALF_PI+TWO_PI*j/jtimes);
        //Radiate inward
        translate(128-128*i/5,0);
        //Random color
        fill(greenchoose(),localalp);
        ellipse(0,0,64,64);
      popMatrix();
      }
    }
  popMatrix();
}

void makemouth(int localX, int localY, int localalp, int biting) {
  stroke(0,localalp);
  //Green elipse face
  fill(greenchoose(),localalp);
  ellipse(localX, localY, 170, 170);
  //black mouth square in center of face
  fill(0,localalp);
  //Adjust as mouth moves
  rect(localX, localY, 128, 64-32*biting/bitetime);
  //red tongue
  fill(floor(random(128)+128),0,0,localalp);
  //Adjust as mouth moves.
  ellipse(localX,localY+16-16*biting/bitetime,64,32);
  //white teeth
  fill(255,localalp);
  for (int i = 0; i < 4; i++) {
    //Tooth position adjusted by bite function
    triangle(localX-64+32*i,localY+32-16*biting/bitetime,localX-32+32*i,localY+32-16*biting/bitetime,localX-48+32*i,localY-16*biting/bitetime);
    triangle(localX-64+32*i,localY-32+16*biting/bitetime,localX-32+32*i,localY-32+16*biting/bitetime,localX-48+32*i,localY+16*biting/bitetime);
  }
  
}

void makeantennae(int localX, int localY, int localalp, int biting) {
  //Makes a pair of black lines for eyebrows
  //centered around dim/8,dim/2-3dim/16 and 3dim/8,dim/2-3dim/16
  stroke(0,localalp);
  fill(0,localalp);
  strokeWeight(10);
  //Added in function to move antennae while biting
  pushMatrix();
    translate(localX-21,localY-53);
    rotate(5*QUARTER_PI-QUARTER_PI*biting/bitetime);
    line (0,0,150,0);
  popMatrix();
  pushMatrix();
    translate(localX+21,localY-53);
    rotate(7*QUARTER_PI+QUARTER_PI*biting/bitetime);
    line (0,0,150,0);
  popMatrix();
  strokeWeight(1);
}

color greenchoose() {
  return color(floor(random(128)),floor(random(128)+128),floor(random(128)));
}

color midgreenchoose() {
  return color(floor(random(96)),floor(random(96)+96),floor(random(96)));
}

color darkgreenchoose() {
  return color(floor(random(64)),floor(random(64)+64),floor(random(64)));
}

void chooseSeed() {
  seed ++;
  seed %= 10;
}
