
int sizeX= 500;
int sizeY= 500;
fairy[] fairies = new fairy[200]; //an array of fairy objects
boolean drawingNet = false; //becomes true when the user clicks
net activeNet;
int totalHits = 0;
PImage bg;

void setup() {
  //I used variables for the size so I can refer to them later 
  //when I'm making sure the fairies don't go offscreen
  bg = loadImage("Background.jpg");
  size(500, 500);
  background(bg);
  smooth();
  //fills the array with fairies created at random positions
  for (int i =0; i<200; i++) {
    fairies[i] = new fairy(random(0, sizeX), random(0, sizeY), random(-1.5, 1.5), random(-1.5, 1.5), random(2, 8), random(15, 25), random(0, 20));
  }
}

void draw() {
  background(bg);
  //call react
  //check if user is drawing circle 
  for (fairy each : fairies) {
    each.react();
    if (each.trapped) {
      totalHits += each.hitCount;
    }
  }
  if (!(activeNet==null)) {
    activeNet.drawNet();
    if (totalHits>7000) {
      activeNet.breakNet();
    }
  }
//  checkMouse();
}

void mousePressed() {
  if(activeNet !=null){
    activeNet.breakNet();
  }
  drawingNet = true;
  activeNet = new net(mouseX, mouseY);
}

void mouseReleased() {
  drawingNet = false;
  activeNet.closeNet();
  for (fairy check : fairies) {
    if (dist(check.xpos+check.xstep, check.ypos+check.ystep, activeNet.centerX, activeNet.centerY)<activeNet.rad/2) {
      check.trapped =true;
    }
  }
}

////checks the mouse position and alters the fairies accordingly
//void checkMouse(){
//  //top left quarter
//  if(mouseX<250 && mouseY<250){
//  }
//  //top right quarter
//  else if(mouseX>250 && mouseY<250){
//  }
//  //bottom left quarter
//  else if(mouseX<250 && mouseY>250){
//  }  
//  //bottom right quarter
//  else{
//  }
//  //right in centre
//  if(dist(250,250, mouseX, mouseY)<30){
//    //run to mouse
//  }
//  else if(dist(250,250, mouseX, mouseY)<50){
//    //run from mouse
//  }
//  else if(dist(250,250, mouseX, mouseY)<300){
//    
//  }
//  else{
//  }
//}

//-------------------------------------------------------------//
class net {
  boolean closed;

  float centerX;
  float centerY;

  float rad;

  //constructor
  net(float x, float y) {
    centerX = x;
    centerY = y;
    closed = false;
  }

  void drawNet() {
    if (closed) {
      stroke(10);
    }
    else {
      stroke(190, 191, 255);
    }

    strokeWeight(3);
    noFill();
    if (closed) {
      ellipse(centerX, centerY, rad, rad);
    }
    else {
      float temp = dist(centerX, centerY, mouseX, mouseY);
      ellipse(centerX, centerY, 2*temp, 2*temp);
    }
  }

  void closeNet() {
    closed = true;
    drawingNet=false;
    if (mouseX>centerX) {
      rad=2*(dist(centerX, centerY, mouseX, mouseY));
    }
    else {
      rad=centerX-mouseX;
    }
  }

  void breakNet() {
    for (fairy check : fairies) {
      if (check.trapped) { 
        check.unTrap();
      }
    }
    totalHits = 0;
    activeNet = null;
  }
}


//-------------------------------------------------------------//
class fairy {
  boolean trapped = false;
  float xpos;
  float ypos;

  float xstep;
  float ystep;

  float holdX;
  float holdY;

  float breath;//the count that goes up
  float b =0.01;//how much the count goes up by
  float a;//the opacity
  float r  = 170;//r component of the colour
  float g = 191; //g component
  float blu = 255; //b component

  //the dimensions of the circles
  float inner;
  float outer;
  //hold the original size of the fairy
  float holdIN;
  float holdOUT;

  int hitCount = 0;
  int mode = 0; //mode changes depending on where the mouse is on the screen

  //constructor, 
  //gets passed the initial x and y position of the fairy
  //the initial speed and size 
  //where the transparency starts
  fairy(float x, float y, float x2, float y2, float x3, float y3, float i) {

    xpos = x;
    ypos = y;

    xstep = x2;
    ystep = y2;

    holdX = x2;
    holdY = y2;

    inner = x3;
    outer = y3;
    
    holdIN = x3;
    holdOUT = y3;

    breath = i;
  }

  //this makes the fairy move 
  //and changes its direction if it's about to go out of bounds
  void react() {
    if((mouseX<50&&mouseY<50)||(mouseX>450&&mouseY>450)||(mouseX>450&&mouseY<50)||(mouseX<50&&mouseY>450)){
    b=0.2;
    }
    else{
      b=0.01;
    }
    breathe();
    outOfBounds();
    if (trapped) {
      b= b+0.002;
      xstep = xstep*1.01;
      ystep = ystep*1.01;
    }
    xpos = xpos+xstep;
    ypos = ypos+ystep;
 
    fill(r, g, blu);
    noStroke();
    ellipse(xpos, ypos, inner, inner);
    if(dist(mouseX,mouseY, xpos, ypos)<100){
      fill(r, g, blu, a*3.5);
    }
   else if(dist(mouseX,mouseY, xpos, ypos)<150){
      fill(r, g, blu, a*2);
    }
    else{
    fill(r, g, blu, a);
    }
    ellipse(xpos, ypos, outer, outer);
    if(trapped==false){
    if(inner>holdIN ){
      inner -= 0.03; 
    }
    if(outer>holdOUT){
      outer-= 0.03;
    }
    if(r>170){
      r-=0.03;
    }
    if(blu<255){
      blu+=0.03;
    }
    if(g<191){
      g+=0.03;
    }
    }
  }


  //if the fairy is about to go offscreen or run in to the edge 
  //of a net it turns it around. 
  void outOfBounds() {
    if (trapped) {
      //makes sure the fairy doesn't go outside the net
      if (dist(xpos+xstep, ypos+ystep, activeNet.centerX, activeNet.centerY)>activeNet.rad/2) {
        xstep = xstep*-1;
        ystep = ystep*-1;
        hitCount++;
      }
    }
    else {

      if (xpos+xstep<0 || xpos+xstep>sizeX) {
        xstep = xstep*-1;
      }
      if (ypos+ystep<0 || ypos+ystep>sizeY) {
        ystep = ystep*-1;
      }
      if (!(activeNet==null)) {
        if (dist(xpos+xstep, ypos+ystep, activeNet.centerX, activeNet.centerY)<activeNet.rad/2) {
          ystep = ystep*-1;
          xstep = xstep*-1;
        }
      }
    }
  }

  //unTrap is called to reset all of the things that got changed when it was trapped
  void unTrap() {
    trapped = false;
    xstep = holdX;
    ystep = holdY;
    b = 0.01;
    inner += random(1, 6);
    outer += random(1, 10);
    hitCount = 0;
    r +=random(5, 20); 
    g-=random(5, 20);
    blu-=random(0, 8);
  }

  //the glow around the fairy fades in and out 
  //to look like the fairy is breathing
  void breathe() {
  a = sin(breath)*100;
    //uses a sin wave to change the transparency smoothly;
    breath= breath+b;
  }
}

