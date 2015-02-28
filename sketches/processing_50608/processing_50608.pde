


//ENDASSIGNMENT 1 PROGRAMMING/PHYSICAL COMPUTING
//by Marcel Ertel
//Enschede, December 2011

import toxi.geom.*; // the geometry library for the use of vectors
import processing.opengl.*; // and the 3D library OPENGL

PFont use;
PFont header; // declaring the fonts 
PFont maintext;
PFont subhead;
PShape button3D;
PImage wasd;
ArrayList sigCollection; //declaration arraylist for signatur animation
ArrayList myBalls; //sorry for that name, i couldn't help it: array list for the balls
GUI Gui; // the gui class is declared now




void setup() {
  smooth(); //it looks just nicer
  size(900, 600);
  //please note that OPENGL decreases the quality of 
  //antialiasing (smooth)...to see the 2D part of the sketch in
  //the best quality, temporily comment out OPENGL in 
  //the size arguments...it is especially affecting the 3D button, which is 
  //sad as you need ogl to use it, but without it (opgl) it looks better...

  //loading some fonts for the text
  header = loadFont("Swiss721BT-LightExtended-48.vlw");
  maintext = loadFont("Swiss721BT-Roman-17.vlw");
  subhead = loadFont("Swiss721BT-RomanExtended-22.vlw");
  //and an svg vector graphic for the button
  button3D = loadShape("3D illu.svg");
  wasd = loadImage("wasd.jpg");
  use = loadFont("Bauhaus-Regular-45.vlw");

  //initializing the gui class
  Gui = new GUI();


  //initialization signatur animation arraylist:

  sigCollection = new ArrayList();

  //and the balls arraylist

    myBalls = new ArrayList();

  //launching the signature elements on the upper right part (just under the 
  //header, i suppose you'll find it

    launchSignature();


  ///////////////////////////////

  //////////////////////////////

  /////////////////////////////





  for (int i = 0; i<13; i++) {    

    // this is not working:

    if (i < 1) { 
      Ball myBall = new Redball();
      myBalls.add(myBall);
    }
    
    if (i > 0) {
      Ball myBall = new Ball();
      myBalls.add(myBall);
    }
 
}
}
//////////////////////////////

///////////////////////////

///////////////////////

/////////////////////////

///////////////////
void draw() {
  //lets draw some stuff

  //nearly white...
//  background(250, 252, 255);
//fill(255,50);
//rect(0,0,1000,1000);
if(Gui.madness){
rectMode(CORNER);
fill(250,252,255);
noStroke();
rect(601,0,500,1000);}
else{
background(250,252,255);
}

  drawText();
  Gui.drawGUI();
  //drawLauncher();
  //drawSpring();
  //drawFloor();
  // drawDemo();
  //  myBall1.run();
  //  myBall2.run();
  //  myBall3.run();



  //if(mousePressed){
  for (int i = 0; i<myBalls.size(); i++) {
    Ball mb = (Ball) myBalls.get(i);
    mb.run();
  }
  //}


  //unanimated (lazy) stuff around the moving objects
  environment();


  //call functionality of the signature
  functionalitySignature();
}


