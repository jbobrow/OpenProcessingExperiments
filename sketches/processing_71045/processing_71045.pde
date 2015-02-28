
// creature's local origin

int seed = 1; //Random color
int biting = 0; //Positon on bite
int bitetime = 10; //Frames per bite
boolean flip = false; //Flip controller
int stampN = 0;
int[] stampX = new int[100];
int[] stampY = new int[100];
float[] stampR = new float[100];
float[] stampSi = new float[100];
int[] stampSe = new int[100];

void setup() {
  size(1024,1024 );        // size of the window
  smooth();                // antialiasing 
  rectMode(CENTER);
  ellipseMode(CENTER);
  strokeWeight(1);
  frameRate(30);
}

void draw() {
  background(255);
  //Make stamps
  makestamps();
  //Follow mouse
  makecreature(mouseX, mouseY, 128, 0, 1, seed);
  biteon();
}

void keyReleased() {
  //Clear stage on key press
  if (key == 'c' || key == 'C') {
    stampN = 0;
  }
  else if ((key == 'b' || key == 'B') && biting == 0) {
    biting ++;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    stampX[stampN] = mouseX;
    stampY[stampN] = mouseY;
    stampR[stampN] = 0;
    stampSi[stampN] = 1;
    stampSe[stampN] = seed;
    stampN ++;
  }
  if (mouseButton == RIGHT) {
    chooseSeed();
  }
}

void makestamps() {
  for (int i=0; i < stampN; i ++) {
    makecreature(stampX[i],stampY[i],255,stampR[i],stampSi[i],stampSe[i]);
  }
}

void makecreature(int localX, int localY, int localalp, float localrot, float localsize, int localseed) {
  randomSeed(localseed);
  maketail(localX,localY,localalp);
  makefeet(localX,localY,localalp);
  makeface(localX,localY,localalp);
  makemouth(localX,localY,localalp);
  makeantennae(localX,localY,localalp);
}

void maketail(int localX, int localY, int localalp) {
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

void makemouth(int localX, int localY, int localalp) {
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

void makeantennae(int localX, int localY, int localalp) {
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

void biteon() {
  //Next step of bite function
  if (biting > 0) {
    biting++;
    //Reset when done
    if (biting > bitetime) {
      biting = 0;
    }
  }
}
