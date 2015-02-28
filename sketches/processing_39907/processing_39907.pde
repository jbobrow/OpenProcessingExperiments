
PImage m;
color Sea = color(10, 28, 80);
color redBall = color(255, 20, 20);
color purpleBall = color(50, 10, 80);
color yellowBall = color(220, 255, 50);
int random;

import ddf.minim.*;

AudioPlayer whaleSound;
AudioPlayer gullSound;
AudioPlayer redBird;
Minim minim;

void setup() {

  size(500, 500);
  background(200);
  makeStang(200, 200);
  smooth();
  noStroke();

  minim = new Minim(this);
  whaleSound = minim.loadFile("blue.wav", 2048);
  gullSound = minim.loadFile("seagull.mp3", 2048);
  redBird = minim.loadFile("wishart.mp3", 2048);
}

void draw() {

  if (mouseX<300) {   //if the mouse is on the left side of the screen
   if (mousePressed) {       //and mouse clicked then make seagull
      makeGull(mouseX, mouseY);
    }
  }
  else {
    makeGull(int(random(0, width)), int(random(0, height)));
   // makeyellowBall(int(random(0,width)),int(random(0,height)));
   // makeredBall(int(random(0,width)),int(random(0,height)));
   // makepurpleBall(int(random(0,width)),int(random(0,height)));
   // makeDivingDuck(int(random(0,width)),int(random(0,height)));



  }
}



void keyPressed() {
  if (key ==' ') {   //1  clear to empty parkinglot
    background(200);
  }
  if (key == 'o') {   //2  switch to oceanscape
    background(Sea);
  }

  if (key == 'b') {    //3 blur that
    filter(BLUR, 3);
  }
  if (key =='e') {    //4 now erode
    filter(ERODE);
  }
  if (key == 'd') {    //5 make it bigger, dilated
    filter(DILATE);
  }
  if (key == 'i') {    //6 invert the color
    filter(INVERT);
  }
  if (key == 't') {      //7  pull to black and white
    filter(THRESHOLD);
  }

  if (key == '3') {       //8   a red beach ball
    makeredBall(mouseX, mouseY);
  }

  if (key == '2') {      //9    a purple beach ball
    makepurpleBall(mouseX, mouseY);
  }

  if (key == '4') {      //10   a yellow one
    makeyellowBall (mouseX, mouseY);
  }

  if (key == '8') {      //11     one of those awesome diving ducks that duck under the water to catch fish
    makeDivingDuck(mouseX, mouseY);
  }

  if (key == '9') {     //12      make another mustang
    makeStang(mouseX, mouseY);
  }

  if (key =='g') {     //13   play gull sounds
    gullSound.play();
  }

  if (key =='w') {     //14  play whale sounds 
    whaleSound.play();
  }

  if (key == 'z') {     //15  credit: Trevor Wishart "Red Bird" excerpt 
    redBird.play();
  }
}

//void keyReleased(){
  
//o}

void makeGull ( int w, int h) {

colorMode (HSB, 100);
float H= 13; //46/360 *100  //map(46, 0, 360, 0, 100);
float S= map(mouseY, 0, width, 10, 45);
float B= map(mouseX, 0, width, 50, 90);


//colorMode (HSB, 134);
//float H= map(mouseX, 0, width, 134, 134); //not the color i was trying to get
//float S= map(mouseX, 0, width, 69, 0);
//float B= map(mouseX, 0, width, 49, 99);

  //head     
  fill(H, S, B); //map between color scale
  ellipse((0.3)*50 + w, (0.3)*50 + h, 15, 15); //.3 is 15 divided by the initial grid width/height
  // point((0.24)*w +i*w, 0.26*h + j*h);
  //eye
  fill(0);
  ellipse(0.3*50 +w, 0.26*50 +h, 3, 3); 
 

  //body
  fill(H, S, B);
  arc(0.66*50 +w, 0.3*50 + h, 33, 33, 0, PI);
  
colorMode(RGB, 255);
  //bottom beak
  fill(232, 122, 37); //orange

  arc(0.04*50 +w, 0.22*50 +h, 10, 2, 0, PI);
  //top beak
  arc(0.02*50 +w, 0.22*50 +h, 11, 2, radians(50), radians(220));

  //first leg
  //stroke(232,122,37);
  rect(0.7*50 +w, 0.66*50 +h, 1, 9);
  //second leg
  rect (0.62*50 +w, 0.66*50 +h, 1, 9);
  //give wings
}

void makeDivingDuck ( int w, int h) {

  //head     
  fill(0);
  ellipse((0.3)*50 + w, (0.3)*50 + h, 15, 15); //.3 is 15 divided by the initial grid width/height
  // point((0.24)*w +i*w, 0.26*h + j*h);
  //eye
  fill(255, 20, 20); //red
  ellipse(0.3*50 +w, 0.26*50 +h, 3, 3); 


  //body
  fill(0);
  arc(0.66*50 +w, 0.3*50 + h, 33, 33, 0, PI);

  //bottom beak
  fill(232, 122, 37);

  arc(0.04*50 +w, 0.22*50 +h, 10, 2, 0, PI);
  //top beak
  arc(0.02*50 +w, 0.22*50 +h, 11, 2, radians(50), radians(220));

  //first leg
  //stroke(232,122,37);
  rect(0.7*50 +w, 0.66*50 +h, 1, 9);
  //second leg
  rect (0.62*50 +w, 0.66*50 +h, 1, 9);
}

void makeredBall (int x, int y) {
  fill (redBall);
  ellipse (mouseX, mouseY, 70, 70);
}

void makepurpleBall (int x, int y) {
  fill(purpleBall);
  ellipse(mouseX, mouseY, 35, 35);
}

void makeyellowBall (int x, int y) {
  fill(yellowBall);
  ellipse(mouseX, mouseY, 100, 100);
}

void makeStang(int x, int y) {
  m =loadImage("mustang.jpg");
  image(m, x, y);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  whaleSound.close();
  gullSound.close();
  redBird.close();
  minim.stop();

  super.stop();
}


