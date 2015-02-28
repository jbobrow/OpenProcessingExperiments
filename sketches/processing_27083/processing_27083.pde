
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import fisica.*;

FWorld world;
int boxCount = 10;  //number of note boxes in the world
FCircle ball; /*creates a circular physics object outside the methods so it can
 be manipulated outside the method where it was created*/

Minim minim;
AudioPlayer note1,note2,note3,note4,note5,note6,note7,note8,note9,note10;

void setup() {
  size(500,500);
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setEdges(-6,-6,505,505); // set the edges ouside the frame so they cannot be seen

  ball = new FCircle(50);
  ball.setPosition(250,400);
  ball.setRestitution(1);    /*sets the properties of the ball including how bouncy it is*/
  ball.setNoStroke();
  ball.setFill(255);
  world.add(ball);


  for (int i=0; i<boxCount; i++) {      //this is the bottom row of blcoks.  These are ummoveable
    FBox b = new FBox(50,50);
    b.setPosition(map(i,0,boxCount-1,25,475),height*19/20);
    b.setStatic(true);
    b.setFill(255,150,15);
    b.setStroke(15,125,255);
    b.setGrabbable(false);
    world.add(b);
  }
    for (int i=0; i<boxCount; i++) {   //this is the top row of blocks.  They can moved with the mouse around the screen.
    FBox b = new FBox(50,50);
    b.setPosition(map(i,0,boxCount-1,25,475),height*1/20);
    b.setStatic(true);
    b.setFill(255,150,15);
    b.setStroke(15,125,255);
    world.add(b);
  }
  minim = new Minim(this);      //sets the sound files to the apropriate notes
  note1 = minim.loadFile("1.wav");
  note2 = minim.loadFile("2.wav");
  note3 = minim.loadFile("3.wav");
  note4 = minim.loadFile("4.wav");
  note5 = minim.loadFile("5.wav");
  note6 = minim.loadFile("6.wav");
  note7 = minim.loadFile("7.wav");
  note8 = minim.loadFile("8.wav");
  note9 = minim.loadFile("9.wav");
  note10 = minim.loadFile("10.wav");
}

void draw() {
  background(15,125,255);

  world.step();
  world.draw();
}

void keyPressed() {
  // if (ball.getY()>=400) {
  switch(keyCode) {
  case RIGHT:
    ball.adjustVelocity(20,0);  //accellerates the ball to the right when the 'right' key is pressed.
    break;
  case LEFT:
    ball.adjustVelocity(-20,0); //accellerates the ball to the left when the 'left' key is pressed.
    break;
  case UP:
    ball.adjustVelocity(0,-50); //accellerates the ball to upwards when the 'up' key is pressed.
    break;
    //  }
  }
}



void contactStarted(FContact c) {  // causes the note boxes at the bottom to change color when the ball collides with it.
  FBody note = null;    
  if(c.getBody1() == ball) {
    note = c.getBody2();
  }
  else if (c.getBody2() == ball) {
    note = c.getBody1();
  }
  if (note == null) {
    return;
  }
  note.setFill(255);

  if (ball.getX()>0&&ball.getX()<50) {    //makes a defferent note play depending on the posistion of the ball.
    note1.loop(0);
  }
  else if (ball.getX()>50&&ball.getX()<100) {
    note2.loop(0);
  }
  else if (ball.getX()>100&&ball.getX()<150) {
    note3.loop(0);
  }
  else if (ball.getX()>150&&ball.getX()<200) {
    note4.loop(0);
  }
  else if (ball.getX()>200&&ball.getX()<250) {
    note5.loop(0);
  }
  else if (ball.getX()>250&&ball.getX()<300) {
    note6.loop(0);
  }
  else if (ball.getX()>300&&ball.getX()<350) {
    note7.loop(0);
  }
  else if (ball.getX()>350&&ball.getX()<400) {
    note8.loop(0);
  }
  else if (ball.getX()>400&&ball.getX()<450) {
    note9.loop(0);
  }
  else if (ball.getX()>450&&ball.getX()<500) {
    note10.loop(0);
  }
}


void contactEnded(FContact c) {  //causes the boxes to revert to their original color after contact with the ball ends.
  FBody note = null;
  if (c.getBody1() == ball) {
    note = c.getBody2();
  }
  else if( c.getBody2() == ball) {
    note = c.getBody1();
  }

  if (note ==null) {
    return;
  }

  note.setFill(255,150,15);
}


