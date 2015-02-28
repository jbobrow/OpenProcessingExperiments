
//Tian Jason Tian
//Assignment 3: Mouse Tracking
//Pac-Man! Waka Waka

ArrayList dotsListX = new ArrayList();
ArrayList dotsListY = new ArrayList();
int points = 0;
int high = 0;
int x_p = 180;
int y_p = 180;
boolean animate = true;
PImage img;


void setup() {

  //initializes the canvas
  size(900,900);
  background(0);
  smooth();

  //create the border graphics
  img = loadImage("pacman.jpg");
  image(img, 100,25);
  smooth();
  stroke(141,34,162);
  strokeWeight(2);
  noFill();
  rect(149,149,603,603);
  pacman p1 = new pacman(380,820);
  pacman p2 = new pacman(450,820);
  pacman p3 = new pacman(520,820);
  cherry c1 = new cherry(820,400);
  cherry c2 = new cherry(820,480);

  //create the score displays
  PFont font;
  font = loadFont("StencilStd-36.vlw");
  textFont(font);
  fill(218, 97, 252);
  text("GAME", 20,80);
  text("SCORE",20,120);
  text("000",20,200);
  text("000",780,200);
  text("HIGH",760,80);
  text("SCORE",760,120);

  //other init
  frameRate(5);
}


void draw() {
  drawPacman(x_p,y_p,animate);
  animate = !animate;
}

void mouseMoved() {
  //creates the edible dots
  if (mouseX > 155 && mouseX < 745 && mouseY > 155 && mouseY < 745) {
    int x = mouseX;
    int y = mouseY;
    drawDot(x,y);
    points++;
  }  
}

void drawDot(int x, int y) {
  dots d1 = new dots(x,y);
  dotsListX.add(x);
  dotsListY.add(y);
}

void drawPacman(int x, int y, boolean ani) {
  if(ani == true) {
    pacman p1 = new pacman(x,y);
  }
  if(ani == false) {
    pacClosed p2 = new pacClosed(x,y);
  }
}

void keyPressed() {
  //initiates pacman animation
  if (key == ' ') {
    for(int i=0;i<dotsListX.size();i++) {
      int x_p = (Integer) dotsListX.get(i);
      int y_p = (Integer) dotsListY.get(i);
      draw();
    }
  }

  //updates the  score counts
  stroke(141,34,162);
  strokeWeight(2);
  stroke(0);
  fill(0);
  rect(20,160,78,40);
  rect(780,160,120,40);
  fill(218, 97, 252);
  text(points,20,200);
  if(points > high) {
    high = points;
  }
  text(high,780,200);
  points = 0;
}

class dots {
  //makes the dots
  int rad;
  PVector circle;
  dots(int myxloc, int myyloc) {
    rad = 50;
    circle = new PVector(myxloc,myyloc);
    for(rad = 50; rad > 0; rad-=10) {
      display();
    }
    noStroke();
    fill(234,227,73);
    ellipse(myxloc,myyloc,10,10);
  }
  void display() {
    noFill();
    stroke(234,227,73,100-rad);
    strokeWeight(2);
    ellipse(circle.x,circle.y,rad,rad);
  }
}

class pacman {
  //makes pacman
  pacman(int xloc, int yloc) {
    stroke(0);
    strokeWeight(1);
    fill(234, 227, 73);
    ellipse(xloc, yloc, 60, 60);
    fill(0);
    arc(xloc,yloc,60,60,-PI/6,PI/6);
  }
}

class pacClosed {
  //makes pacClosed
  pacClosed(int xloc, int yloc) {
    stroke(0);
    strokeWeight(1);
    fill(234, 227, 73);
    ellipse(xloc, yloc, 60, 60);
  }
}

class pacClear {
  //makes a blank ellipse
  pacClear(int xloc, int yloc) {
    stroke(0);
    strokeWeight(1);
    fill(0);
    ellipse(xloc, yloc, 60, 60);
  }
}

class cherry {
  //makes the cherries
  cherry(int xloc, int yloc) {
    stroke(100);
    fill(193,25,31);
    line(xloc-10,yloc,xloc,yloc-40);
    line(xloc+20,yloc-2,xloc,yloc-40);
    ellipse(xloc-10,yloc,30,30);
    ellipse(xloc+10,yloc-2,30,30);
    noStroke();
    fill(255,25,31);
    ellipse(xloc-10,yloc,20,20);
    ellipse(xloc+10,yloc-2,24,24);
  }
}


