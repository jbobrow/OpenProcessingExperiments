
int sizeX;
int sizeY;
fairy[] fairies = new fairy[200]; //an array of fairy objects
boolean drawingNet = false; //becomes true when the user clicks
net activeNet;
int totalHits = 0;

PImage bg; //background image with tree silhouettes
boolean runAway = true; //if true they are running from the mouse, if false they are running to the mouse

void setup() {
  sizeX= 500;
  sizeY= 500;
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
  //background(bg);
  tint(255, 150);
  image(bg,0,0,sizeX, sizeY);
  noTint();
  noCursor();
  //call react
  //check if user is drawing circle 
  for (fairy each : fairies) {
    each.react();
    each.runToOrFrom(mouseX, mouseY);
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
}

void mousePressed() {
  //changes the runAway mode when the right button is clicked.
  if (mouseButton == RIGHT) {
    if(runAway){
      runAway = false;
    }
    else{
      runAway = true;
    }
  }
  else{
  if (activeNet !=null) {
    activeNet.breakNet();
  }
  drawingNet = true;
  activeNet = new net(mouseX, mouseY);
}
}

void mouseReleased() {
  drawingNet = false;
  if(activeNet != null && activeNet.closed==false){
  activeNet.closeNet();
  for (fairy check : fairies) {
    if (dist(check.xpos+check.xstep, check.ypos+check.ystep, activeNet.centerX, activeNet.centerY)<activeNet.rad/2) {
      check.trapped =true;
    }
  }
  }
}

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
      stroke(0);
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

  float dx;
  float dy;

  float xstep;
  float ystep;

  float holdX;
  float holdY;

  float breath;//the count that goes up
  float b =0.01;//how much the count goes up by
  float a;//the opacity
  
  float baseR = 120;//the r component of the original colour
  float r  = 120;//r component of the colour
  float g = 191; //g component
  float baseG = 191;//the g component of the original colour
  float blu = 255; //b component
  float baseBLU = 255;//the r component of the original colour

  //the dimensions of the circles
  float inner;
  float outer;
  //hold the original size of the fairy
  float holdIN;
  float holdOUT;

  int hitCount = 0;


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

  //this method is called in draw()
  //it makes the fairy move, breath, stay within bounds
  void react() {
    //if the mouse is in any of the four corners
    if ((mouseX<sizeX*0.1 &&mouseY<sizeX*0.1)||(mouseX>sizeX*0.9&&mouseY>sizeX*0.9)||(mouseX>sizeX*0.9&&mouseY<sizeX*0.1)||(mouseX<sizeX*0.1&&mouseY>sizeX*0.9)) {
      b=0.2;
    }
    else {
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
    
    //if the fairies are running to the mouse, they are brighter the closer they get to it
    if(runAway==false){
    if (dist(mouseX, mouseY, xpos, ypos)<100) {
      fill(r, g, blu, a*3.5);
    }
    else if (dist(mouseX, mouseY, xpos, ypos)<150) {
      fill(r, g, blu, a*2);
    }
    else {
      fill(r, g, blu, a);
    }
    }
    //if the fairies are running away from the mouse they are brighter the further they get from the mouse
    if(runAway==true){
    if (dist(mouseX, mouseY, xpos, ypos)>250) {
      fill(r, g, blu, a*3.5);
    }
    else if (dist(mouseX, mouseY, xpos, ypos)>150) {
      fill(r, g, blu, a*2);
    }
    else {
      fill(r, g, blu, a*0.2);
    }
    }
    ellipse(xpos, ypos, outer, outer);
    if (trapped==false) {
      if (inner>holdIN ) {
        inner -= 0.03;
      }
      if (outer>holdOUT) {
        outer-= 0.03;
      }
      //if any of the colours are different to the original colour slowly restore to original state
      if (r>baseR) {
        r-=0.04;
      }
      else if (r<baseR) {
        r+=0.04;
      }
      if (g<baseG) {
        g+=0.05;
      }
      else if (g>baseG) {
        g-=0.05;
      }
      if (blu<baseBLU) {
        blu+=0.05;
      } 
      else if (blu>baseBLU) {
        blu-=0.05;
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
    //this makes sure the fairy isn't ever going in a vertical or horizontal line
    if (xstep>-0.5&& xstep<=0 && ystep>0.7) {
      xstep=-0.5;
    }
    else if (xstep<0.5&& xstep>=0 &&ystep>0.7) {
      xstep=0.5;
    }
    if (ystep>-0.5&& ystep<=0 &&xstep>0.7) {
      xstep=-0.5;
    }
    else if (ystep<0.5&& ystep>=0 &&xstep>0.7) {
      xstep=0.5;
    }
  }

  //unTrap is called to reset all of the things that got changed when it was trapped
  void unTrap() {
    trapped = false;
    xstep = holdX;
    ystep = holdY;
    b = 0.01;
    inner += random(5, 10);
    outer += random(5, 20);
    hitCount = 0;
    r +=random(20, 50); 
    g-=random(15, 30);
    blu-=random(10, 20);
  }

  //the glow around the fairy fades in and out 
  //to look like the fairy is breathing
  void breathe() {
    a = sin(breath)*100;
    //uses a sin wave to change the transparency smoothly;
    breath= breath+b;
  }

  void runToOrFrom(float xp, float yp) {
    dx = 0;
    dy = 0;
    if (dist(xpos, ypos, mouseX, mouseY)<60) {
      dx = xpos - xp;
      dy = ypos - yp;
      if (runAway==false) {
        xpos -=dx/10;
        ypos -=dy/10;
      }
    else if(runAway==true){
     xpos +=dx/10;
     ypos +=dy/10;
   }
  }
  }
  }




