
int seed = 1; //Random color
int seedmax = 10; //Maximum number of seed values
int bitetime = 20; //Frames per bite
int walktime = 20; //Frames per walk
int jumptime = 20; //Frames per jump
int maxspeed = 100;
int maxjump = 400;
int speed = 5; //increment of acceleration
float fric = .99999; //incriment of friction
float sscale = 10; //number of sizes between (0,2]x
float rscale = 10; //number of rotations (out of 360 degrees)
float sadjust = floor(sscale/2); //current scale
float radjust = 0; //current rotation

class Creature {
  //Positions
  int creX;
  int creY;
  int creZ = 0;
  //Speeds
  int xspeed;
  int yspeed;
  int zspeed;
  int jumpspeed; //Distance jumped
  boolean jumped;
  //Transparancy, rotation, size, color
  int creAlp;
  float creRot;
  float creSize;
  int creSeed;
  //Animation status
  int creBiting = 0;
  int creWalking = 0;
  int creJumping = 0;
  //Side viewing 0 = face, 1 = side, 2 = back
  int creSide = 0;
  boolean creLeft = false;
  Creature (int localX, int localY, int localZ, int localalp, float localrot, float localsize, int localseed)
  {
    creX = localX;
    creY = localY;
    creZ = localZ;
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
  void crePos(int localX, int localY, int localZ) {
    creX = localX;
    creY = localY;
    creZ = localZ;
  }
  void creMoveL() {
    xspeed -= speed;
    if (xspeed < -1*maxspeed) {
      xspeed = -1*maxspeed;
    }
    if (xspeed < 0) {
      creLeft = true;
      creSide = 1;
    }
  }
  void creMoveR() {
    xspeed += speed;
    if (xspeed > maxspeed) {
      xspeed = maxspeed;
    }
    if (xspeed > 0) {
      creLeft = false;
      creSide = 1;
    }
  }
  void creStopLR() {
    xspeed = friction(xspeed);
  }
  void creMoveU() {
    yspeed -= speed;
    if (yspeed < -1*maxspeed) {
      yspeed = -1*maxspeed;
    }
    if (yspeed < 0) {
      creSide = 2;
    }
  }
  void creMoveD() {
    yspeed += speed;
    if (yspeed > maxspeed) {
      yspeed = maxspeed;
    }
    if (yspeed > 0) {
      creSide = 0;
    }
  }
  void creStopUD() {
    yspeed = friction(yspeed);
    if (jumpspeed > 0) {
      jumped = true;
    }
  }
  void creJumpUD() {
    if (jumpspeed < maxjump && !jumped) {
      jumpspeed += 10*speed;
      if (jumpspeed >= maxjump) {
        jumped = true;
        jumpspeed = maxjump;
      }
    }
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
  void creTurn(int side) {
    creSide = side;
    creSide %= 3;
  }
  void creBite() {
    if (creBiting == 0) {
      creBiting ++;
    }
  }
  void creWalk() {
    if (creWalking == 0 && creJumping == 0) {
      creWalking ++;
    }
  }
  void creJump() {
    if (creJumping == 0) {
      creJumping ++;
      creWalking = 0;
    }
  }
  void creDraw () {
    //Running
    creX += xspeed;
    creY += yspeed;
    if ((xspeed != 0 || yspeed != 0) && creJumping == 0 && creWalking == 0) {
      creWalking ++;
    }
    else if (xspeed == 0 && yspeed == 0) {
      creWalking = 0;
    }
    //Jumping
    if (jumped) {
      jumpspeed -= 10*speed;
      if (jumpspeed <= 0) {
        jumped = false;
        jumpspeed = 0;
      }
    }
    makecreature(creX,creY,creZ,jumpspeed,creAlp,creRot,creSize,creSeed,creBiting,creWalking,creJumping,creSide,creLeft);
    if (creBiting > 0) {
      creBiting++;
      //Reset when done
      if (creBiting > bitetime) {
        creBiting = 0;
      }
    }
    if (creWalking > 0) {
      //Speed of walk animation varies with speed of creature.
      //Change 4 to 2 when you remove the y-movement.
      creWalking += ceil(walktime*float(abs(xspeed)+abs(yspeed))/(4*maxspeed));
      //Reset when done
      if (creWalking > 2*walktime) {
        creWalking = 0;
      }
    }
    if (creJumping > 0) {
      creJumping++;
      //Reset when done
      if (creJumping > jumptime) {
        creJumping = 0;
      }
    }
  }
}

void makecreature(int localX, int localY, int localZ, int jumpspeed, int localalp, float localrot, float localsize, int localseed, int biting, int walking, int jumping, int side, boolean left) {
  pushMatrix();
    translate(localX,localY);
    translate(0,-jumpspeed);
    scale(2*localsize/sscale);
    if (!left) {
      scale(-1,1);
    }
    rotate(TWO_PI*localrot/rscale);
    //translate(-localX,-localY,localZ);
    translate(-localX,-localY);
    if (side == 0) {
      //Show face
      randomSeed(localseed);
      maketail(localX,localY,localalp,biting);
      randomSeed(localseed);
      makefeet(localX,localY,localalp, walking, jumping);
      randomSeed(localseed);
      makebody(localX,localY,localalp);
      randomSeed(localseed);
      makemouth(localX,localY,localalp,biting);
      makeantennae(localX,localY,localalp,biting);
    }
    else if (side == 1) {
      //Show side
      randomSeed(localseed);
      maketail(localX,localY,localalp,biting);
      randomSeed(localseed);
      makesidefeet(localX,localY,localalp, walking, jumping);
      makesideantennae1(localX,localY,localalp,biting);
      randomSeed(localseed);
      makesidemouth(localX,localY,localalp,biting);
      randomSeed(localseed);
      makesidebody(localX,localY,localalp);
      makesideantennae2(localX,localY,localalp,biting);
    }
    else {
      //Show back
      makeantennae(localX,localY,localalp,biting);
      randomSeed(localseed);
      makebackfeet(localX,localY,localalp, walking, jumping);
      randomSeed(localseed);
      makebody(localX,localY,localalp);
      randomSeed(localseed);
      maketail(localX,localY,localalp,biting);
      randomSeed(localseed);
      makeback(localX,localY,localalp);
    }
  popMatrix();
}

void maketail(int localX, int localY, int localalp, int wagging) {
  //Tail wag
  pushMatrix();
    translate(localX-64,localY);
    rotate(-QUARTER_PI*.6*smoothtrans(float(wagging)/bitetime));
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
    for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 10; i++) {
      int j = floor(.5*i);
      fill(darkgreenchoose(),localalp);
      ellipse(localX+320-i*32,localY+112-i*8-j*16/1.5,64,64);
    }
  popMatrix();
}

void makefeet(int localX, int localY, int localalp, int walking, int jumping) {
  stroke(0,localalp);
  //Choose legs
  color legchoice = midgreenchoose();
  color feetchoice = midgreenchoose();
  color toechoice = midgreenchoose();
  pushMatrix();
    //Jumping
    translate(0,-64*smoothtrans(float(jumping)/jumptime));
    //Left leg
    if (walking < walktime) {
      translate(0,-64*smoothtrans(float(walking)/walktime)-64*smoothtrans(float(jumping)/jumptime));
    }
    fill(legchoice,localalp);
    ellipse(localX-64,localY+128,64,170);
    //left foot
    fill(feetchoice,localalp);
    ellipse(localX-64,localY+192,85,51);
    //left toe
    fill(toechoice,localalp);
    for (int i = 0; i < 3; i++) {
      ellipse(localX-96+i*32,localY+224,51,42);
    }
    //Right leg
    translate(0,-64*smoothtrans(float(walking-walktime)/walktime));
    fill(legchoice,localalp);
    ellipse(localX+64,localY+128,64,170);
    //right foot
    fill(feetchoice,localalp);
    ellipse(localX+64,localY+192,85,51);
    //right toe
    fill(toechoice,localalp);
    for (int i = 0; i < 3; i++) {
      ellipse(localX+32+i*32,localY+224,51,42);
    }
  popMatrix();
} 

void makebody(int localX, int localY, int localalp) {
  stroke(0,localalp);
  //New face equation.
  int jtimes = 20;
  int itimes = 5;
  pushMatrix();
    //Center of face
    translate(localX,localY);
    for (int i = 0; i <= itimes; i++) {
      for (int j = 1; j <= jtimes*(itimes+1-i)/(itimes); j++) {
      //Determine fixed position (no longer random)
      pushMatrix();
        //Circle around face
        rotate(HALF_PI+TWO_PI*j/(jtimes*(itimes+1-i)/(itimes)));
        //Radiate inward
        translate(128-128*i/itimes,0);
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
  rect(localX, localY, 128, 64-32*smoothtrans(float(biting)/bitetime));
  //red tongue
  fill(floor(random(128)+128),0,0,localalp);
  //Adjust as mouth moves.
  ellipse(localX,localY+16-16*smoothtrans(float(biting)/bitetime),64,32);
  //white teeth
  fill(255,localalp);
  for (int i = 0; i < 4; i++) {
    //Tooth position adjusted by bite function
    pushMatrix();
      translate(0,-16*smoothtrans(float(biting)/bitetime));
      triangle(localX-64+32*i,localY+32,localX-32+32*i,localY+32,localX-48+32*i,localY);
      translate(0,32*smoothtrans(float(biting)/bitetime));
      triangle(localX-64+32*i,localY-32,localX-32+32*i,localY-32,localX-48+32*i,localY);
    popMatrix();
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
    rotate(5*QUARTER_PI-QUARTER_PI*smoothtrans(float(biting)/bitetime));
    line (0,0,150,0);
  popMatrix();
  pushMatrix();
    translate(localX+21,localY-53);
    rotate(7*QUARTER_PI+QUARTER_PI*smoothtrans(float(biting)/bitetime));
    line (0,0,150,0);
  popMatrix();
  strokeWeight(1);
}

void makesidefeet(int localX, int localY, int localalp, int walking, int jumping) {
  stroke(0,localalp);
  //Choose legs
  color legchoice = midgreenchoose();
  color feetchoice = midgreenchoose();
  color toechoice = midgreenchoose();
  pushMatrix();
    //Jumping
    translate(0,-64*smoothtrans(float(jumping)/jumptime));
    //Walking
    if (walking < walktime) {
      translate(0,-64*smoothtrans(float(walking)/walktime));
    }
    //left toe
    fill(toechoice,localalp);
    for (int i=0; i < 2; i++) {
      ellipse(localX-96+10-10*i,localY+224-20+10*i,51,42);
    }
    //Left leg
    fill(legchoice,localalp);
    ellipse(localX-64,localY+128,64,170);
    //left foot
    fill(feetchoice,localalp);
    ellipse(localX-64,localY+192,85,51);
    //front left toe
    fill(toechoice,localalp);
    ellipse(localX-96,localY+224,51,42);
    //wa;lomg
    translate(0,-64*smoothtrans(float(walking-walktime)/walktime));
    //right toe
    fill(toechoice,localalp);
    for (int i=0; i < 2; i++) {
      ellipse(localX+32+10-10*i,localY+224-20+10*i,51,42);
    }
    //right leg
    fill(legchoice,localalp);
    ellipse(localX+64,localY+128,64,170);
    //right foot
    fill(feetchoice,localalp);
    ellipse(localX+64,localY+192,85,51);
    //right front toe
    fill(toechoice,localalp);
    ellipse(localX+32,localY+224,51,42);
  popMatrix();
}

void makesidebody(int localX, int localY, int localalp) {
  stroke(0,localalp);
  //New face equation.
  int jtimes = 20;
  int itimes = 5;
  pushMatrix();
    //Center of face
    translate(localX,localY);
    for (int i = 0; i <= itimes; i++) {
      for (int j = 1; j <= jtimes*(itimes+1-i)/(itimes); j++) {
      //Determine fixed position (no longer random)
      pushMatrix();
        //Circle around face
        rotate(PI+TWO_PI*j/(jtimes*(itimes+1-i)/(itimes)));
        //Radiate inward
        translate(128-128*i/itimes,0);
        //Random color
        fill(greenchoose(),localalp);
        ellipse(0,0,64,64);
      popMatrix();
      }
    }
  popMatrix();
}

void makesidemouth(int localX, int localY, int localalp, int biting) {
  stroke(0,localalp);
  //Green elipse face
  fill(greenchoose(),localalp);
  ellipse(localX-128, localY, 128, 170);
  //black mouth square in center of face
  fill(0,localalp);
  //Adjust as mouth moves
  rect(localX-192,localY,32,64-32*smoothtrans(float(biting)/bitetime));
  //red tongue
  fill(floor(random(128)+128),0,0,localalp);
  //Adjust as mouth moves.
  arc(localX-176,localY+16-16*smoothtrans(float(biting)/bitetime),64,32,HALF_PI,1.5*PI);
  //white teeth
  fill(255,localalp);
  pushMatrix();
    translate(0,-16*smoothtrans(float(biting)/bitetime));
    triangle(localX-208,localY+32,localX-176,localY+32,localX-208,localY);
    translate(0,32*smoothtrans(float(biting)/bitetime));
    triangle(localX-208,localY-32,localX-176,localY-32,localX-208,localY);
  popMatrix();
}

void makesideantennae1(int localX, int localY, int localalp, int biting) {
  //Makes a pair of black lines for eyebrows
  //centered around dim/8,dim/2-3dim/16 and 3dim/8,dim/2-3dim/16
  stroke(0,localalp);
  fill(0,localalp);
  strokeWeight(10);
  //Added in function to move antennae while biting
  pushMatrix();
    translate(localX-160,localY-53);
    rotate(5*QUARTER_PI-QUARTER_PI*smoothtrans(float(biting)/bitetime));
    line (0,0,150,0);
  popMatrix();
  strokeWeight(1);
}

void makesideantennae2(int localX, int localY, int localalp, int biting) {
  //Makes a pair of black lines for eyebrows
  //centered around dim/8,dim/2-3dim/16 and 3dim/8,dim/2-3dim/16
  stroke(0,localalp);
  fill(0,localalp);
  strokeWeight(10);
  //Added in function to move antennae while biting
  pushMatrix();
    translate(localX-160,localY-53);
    rotate(7*QUARTER_PI+QUARTER_PI*smoothtrans(float(biting)/bitetime));
    line (0,0,150,0);
  popMatrix();
  strokeWeight(1);
}

void makebackfeet(int localX, int localY, int localalp, int walking, int jumping) {
  stroke(0,localalp);
  //Choose legs
  color legchoice = midgreenchoose();
  color feetchoice = midgreenchoose();
  color toechoice = midgreenchoose();
  pushMatrix();
    //Jumping
    translate(0,-64*smoothtrans(float(jumping)/jumptime));
    //Left position
    if (walking < walktime) {
      translate(0,-64*smoothtrans(float(walking)/walktime));
    }
    //left toe
    fill(toechoice,localalp);
    for (int i = 0; i < 3; i++) {
      ellipse(localX-96+i*32,localY+224,51,42);
    }
    //left foot
    fill(feetchoice,localalp);
    ellipse(localX-64,localY+192,85,51);
    //Left leg
    fill(legchoice,localalp);
    ellipse(localX-64,localY+128,64,170);
    //Right position
    translate(0,-64*smoothtrans(float(walking-walktime)/walktime));
    //right toe
    fill(toechoice,localalp);
    for (int i = 0; i < 3; i++) {
      ellipse(localX+32+i*32,localY+224,51,42);
    }
    //right foot
    fill(feetchoice,localalp);
    ellipse(localX+64,localY+192,85,51);
    //Right leg
    fill(legchoice,localalp);
    ellipse(localX+64,localY+128,64,170);
  popMatrix();
}

void makeback(int localX, int localY, int localalp) {
  stroke(0,localalp);
  //New face equation.
  int jtimes = 10;
  int itimes = 4;
  pushMatrix();
    //Center of face
    translate(localX,localY);
    for (int i = 0; i <= itimes; i++) {
      for (int j = 1; j <= jtimes*(itimes+1-i)/(itimes); j++) {
      //Determine fixed position (no longer random)
      pushMatrix();
        //Circle around face
        rotate(HALF_PI+TWO_PI*j/(jtimes*(itimes+1-i)/(itimes)));
        //Radiate inward
        translate(64-64*i/itimes,0);
        //Random color
        fill(greenchoose(),localalp);
        ellipse(0,0,64,64);
      popMatrix();
      }
    }
  popMatrix();
}

float smoothtrans(float control) {
  return sin(PI*control);
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

int chooseSeed(int seed) {
  seed ++;
  seed %= seedmax;
  return seed;
}

int friction (int moving) {
  if (moving != 0) {
    moving *= fric;
  }
  if (abs(moving) < speed) {
    return 0;
  }
  else {
    return moving;
  }
}

