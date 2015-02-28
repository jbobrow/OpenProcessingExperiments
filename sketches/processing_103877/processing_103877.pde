
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

ArrayList<Ball> p = new ArrayList<Ball>();
int numBalls;
int time, level, score;
boolean showGUI, playing;
int GUIHeight;
int ALTO, ANCHO;
int IMG_SIZE;

void setup()
{
  size(480, 800);
  
  ANCHO=480;
  ALTO=800;
  // Size of bubble image
  IMG_SIZE=200;
  
  background(0);
  numBalls = 0;
  
  frameRate(50);
  time=0;
  level=1;
  score=0;
  showGUI=true;
  playing=false;
}

void draw()
{
  // Print score and level  
  background(0);
  
  fill(255,255,0);
  textSize(16);
  text("Score: "+str(score), 10, 30);
  text("Level: "+str(level), ANCHO-10-textWidth("Level: "+str(level)), 30);
  
  if (showGUI) {
    drawGUI();
  }
  
  if (!playing) {
    return;
  }
  
  time++;
  // level=1: Se crea bola cada segundo
  // level=2: Se crean 2 bolas cada segundo
  if (time>=50/level) {
    time=0;
    Create_ball();
  }
    
  if (!p.isEmpty()) {
    for (int i = 0; i < p.size(); i++) {
      p.get(i).update();
      p.get(i).draw();
    }
  }
  
// Changes level
  level=int(score/100)+1;

}

void drawGUI() {
  rectMode(CORNERS);
  fill(0,0,255);
  rect(0, ALTO-25, ANCHO, ALTO);
  fill(64,64,64);
  //line(2,ALTO-23,ANCHO,ALTO-23);
  rect(2, ALTO-25+2, ANCHO/3-2, ALTO-3, 4);
  fill(255,255,255);
  if (!playing) {
    text("Start", (ANCHO/3-textWidth("Start"))/2, ALTO-8);
  }
  else {
    text("Stop", (ANCHO/3-textWidth("Stop"))/2, ALTO-8);
  }
}
  

void Create_ball() {
  int xVel;
  int yVel;
  if (numBalls < 10) {
    xVel = level;
    if (random(0,1)>0.5) {
      xVel = -xVel;
    }
    yVel = level;
    if (random(0,1)>0.5) {
      yVel = -yVel;
    } 

    p.add(new Ball(int(ANCHO*random(1)), int(ALTO*random(1)), xVel, yVel,level));
    //p.add(new Ball(int(ANCHO/2), int(ALTO/2), xVel, yVel, level));
    numBalls += 1;
  }
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down

}

void mousePressed()
{
  if (mouseY>ALTO-25) {
    if (showGUI) {
      if ((mouseX>0) && (mouseX<ANCHO/3)) {
        if (!playing) {
          level=1;
          score=0;
          p.clear();
          showGUI=false;
          playing=true;
        }
        else {
          playing=false;
        }
      }
    }
    else {
      showGUI=true;
    }
    
  }

  int i=0;
  while (i<p.size()) {
    //Ball item = p.get(i);
    if (dist(mouseX,mouseY,p.get(i).x,p.get(i).y)<=p.get(i).r) {
      p.remove(i);
      score+=10*level;
      numBalls--;
      i=0; }
    else {
      i++;
    }
  }
}


class Ball {
  int x;
  int y;
  int xVel;
  int yVel;
  float escala;
  float r;
  PImage img;
  
  // Contructor
  Ball(int xPosition, int yPosition, int xVelocity, int yVelocity, int level) {
    escala = 1.0/level;
    img = loadImage("Bubble.png");
   
    r = escala*IMG_SIZE/2;
    
    x = xPosition;
    if (x < IMG_SIZE/2) {   
      x = IMG_SIZE/2 + 1;
    }
    if (x > ANCHO - IMG_SIZE/2) {
      x = ANCHO - IMG_SIZE/2-1;
    }
   
    y = yPosition;
    if (y < IMG_SIZE/2) {   
      y = IMG_SIZE/2+1;
    }
    if (y > ALTO - IMG_SIZE/2) {
      y = ALTO-IMG_SIZE/2-1;
    }

    xVel = xVelocity;
    yVel = yVelocity;
   
  }
  
  // Custom method for updating the variables
  void update() {
    x = x + xVel;
    if (x >= ANCHO-r || x <= r) {
      xVel *= -1;
    }
    y = y + yVel;    
    if (y >= ALTO-r || y <= r) {
      yVel *= -1;
    }
  }
  
  // Custom method for drawing the object
  void draw() {
    imageMode(CENTER);
    image(img,x,y,int(escala*IMG_SIZE),int(escala*IMG_SIZE));
  }
}


