
import processing.opengl.*;

int i =0, s=1, r = 0;
int cameraY=0, cameraX=0;
float ax = 0, ay = 0, ax2 = 0, ay2 = 0, x1 = 0, y1 = 0;
float aa = 1.78125, ab = -0.78125, ac = 1.90625, ad = 2.65625;
int xx = 0, yy = 0;

int xWindow = 700, yWindow = 700;
int xScreen = 1200, yScreen = 800;
color bg;

boolean drawingMode;
boolean sharp;
boolean direction;
boolean paint;

float xpos = xWindow/2, ypos = yWindow/2, yspeed= 0;
float a, c=0;
int count = 0;
int equation = 0;
int totalTori = 75; //100 slows it down... 
Tori[] tori;

float minZ = 0;
float maxZ = 0;

int[] colorNum = {0,0,1,1,1,1,2,2,2,3,3,3,4,4,4,4,
                     5,5,5,6,6,6,7,7,7,8,8,9,9,9,10,10,
                     11,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,
                     18,19,20,20,21,22,22,23,24,24,25,26,26,27,28,29,
                     29,30,31,32,33,34,35,36,37,37,38,39,40,41,42,44,
                     45,46,47,48,49,50,51,52,54,55,56,57,59,60,61,62,
                     64,65,66,68,69,70,72,73,75,76,77,79,80,82,83,85,
                     86,88,89,91,92,94,96,97,99,100,102,104,105,107,109,110,
                     112,114,115,117,119,120,122,124,126,127,129,131,133,135,136,138,
                     140,142,143,145,147,149,151,152,154,156,158,160,161,163,165,167,
                     168,170,172,174,175,177,179,180,182,184,185,187,189,190,192,193,
                     195,196,198,200,201,203,204,205,207,208,210,211,212,214,215,216,
                     217,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,
                     233,234,235,236,237,237,238,239,239,240,240,241,242,242,243,243,
                     244,244,245,245,246,246,247,247,248,248,248,249,249,249,250,250,
                     250,251,251,251,252,252,252,253,253,253,254,254,254,254,255,255};


//////////////////////////////////////////////////////////////////

void setup() {
  
  size(xWindow, yWindow,P3D);
  bg = color(colorNum[184], colorNum[175], colorNum[138]);
  background(bg);
  frameRate(100);
  camera(width/2.0, height/2.0, (height/2.0)/tan(PI*60.0/360.0),width/2.0, height/2.0, 0, 0, 1, 0);
  translate(width/2, height/2, 0);
  noFill();
  smooth();
  
  tori = new Tori[totalTori];
  for (int i=0; i<totalTori; i++) {
    tori[i] = new Tori(0,0,0,0,0,0,i);
  }
  drawingMode = true;
  sharp = false;
  direction = true;
  paint = false;
} 

void draw() {
  if(!drawingMode) {
   // tori[i].update();
  }
}

///////////////////////////////////////////////////////////////

void keyPressed() {

  //Paint tool
  if(key == 'h') {
    if (paint==false) {
      paint = true;
    }
    else {
      paint = false;
    }
  }
  //... tool
  if(key == 'i') {
      filter(INVERT);
      filter(BLUR,1);
  }
  //.. tool
  if(key == 'p') {
    filter(POSTERIZE,3);
    filter(BLUR,1);
  }
  //disperse
  if(key == 'd') {
    background(bg);
    if (sharp) {
      smooth();
      minZ = 0;
      maxZ = 0;
    }
    else {
      noSmooth();
      minZ = random(-100,0);
      maxZ = random(0,600);
    }
    for (int i=0; i<totalTori; i++) {
        tori[i].update();
      }
  }
  //change Fractal equation 
  if(key == 'f') {
    println(equation);
    if (equation < 3) {
      equation += 1;
    }
    else {
      equation = 0;
    }
  }
  //decrease strokeWeight *(*
  if(key == '9') { 
    s = s-1;
    if (s < 1) {
      s = 50;
    }
  }
  //increase strokeWeight *)*
  if(key == '0') {
    s = s + 1;
    if (s > 50) {
      s = 1;
    }
  }
  //change background to Black
  if(key == 'b') {
    background(0);
  }
  //Clear palette
  if(key == 'c') {
    background(bg);
    translate(width/2, height/2, 0);
    count = 0;
    drawingMode = true;
    sharp = false;
    s = 1;
    cameraX=0;
    cameraY=0;
  }

//left analog stick controls pointer  
  /*if (X > 0) { //right
    aa = random(-PI,PI); ab = random(-PI,PI); ac = random(-PI,PI); ad = random(-PI,PI);
    xpos = xpos +1;
    if (xpos > xScreen) {
      xpos = 0;
    }
  }
  if (X < 0) { //left
    aa = random(-PI,PI); ab = random(-PI,PI); ac = random(-PI,PI); ad = random(-PI,PI);
    xpos = xpos -1;
    if (xpos < 0) {
      xpos = xScreen;
    }
  }
  if (Y < 0) { //up
    ypos = ypos -1;
    if (ypos < 0) {
      ypos = yScreen;
    }
  }
  if (Y > 0) { //down
    ypos = ypos +1;
    if (ypos > yScreen) {
      ypos = 0;
    }
  }
  xx = int(xpos);
  yy = int(ypos);*/
 
  //robby.mouseMove(xx, yy);

//right analog stick controls camera  
  if (keyCode == RIGHT) { //right
    cameraY = cameraY + 1;
    if (cameraY > 359) {
      cameraY = 0;
    }
  }
  if (keyCode == LEFT) { //left
    cameraY = cameraY - 1;
    if (cameraY < 0) {
      cameraY = 359;
    }
  }
  if (keyCode == UP) { //up
    cameraX = cameraX + 1;
    if (cameraX > 359) {
      cameraX = 0;
    }
  }
  if (keyCode == DOWN) { //down
    cameraX = cameraX - 1;
    if (cameraX > 359) {
      cameraX = 0;
    }
  } 
}

///////////////////////////////////////////////////////////////

void mouseDragged() {
  if (count<totalTori) {
    createTori();
    for (int i=0; i<totalTori; i++) {
      tori[i].update();
    }
  }
  else {
    count = 0;
  }
}

void mousePressed() {
  aa = random(-PI,PI); ab = random(-PI,PI); ac = random(-PI,PI); ad = random(-PI,PI);
}

/////////////////////////////////////////////////////////////////

void createTori() {
  float x = mouseX;
  float y = mouseY;
  float z = 0;
  
  int cr=50, cg=270, cb=90;
  if (count%7 == 0) {
    cr = 140;
    cg = 35;
    cb = 24;
  }
  else if (count%7 == 1) {
    cr = 94;
    cg = 140;
    cb = 106;
  }
  else if (count%7 == 2) {
    cr = 136;
    cg = 166;
    cb = 94;
  }
  else if (count%7 == 3) {
    cr = 191;
    cg = 179;
    cb = 90;
  }
  else if (count%7 == 4) {
    cr = 242;
    cg = 196;
    cb = 90;
  }
  else if (count%7 == 5) {
    cr = 240;
    cg = 240;
    cb = 240;
  }
  else if (count%7 == 6) {
    cr = 123;
    cg = 59;
    cb = 59;
  }
  tori[count] = new Tori(x,y,z,cr,cg,cb,count);
  tori[count].born = true;
  count++;
}

class Tori {
  float x, y, z;
  //float x1, y1;
  float c; 
  int index;
  int cr, cg, cb;
  
  boolean[] hasConnections;
  
  boolean born = false;
  
  //constructor
  Tori(float X, float Y, float Z, int CR, int CG, int CB, int I) {
    
    x = X;
    y = Y;
    z = Z;

    cr = CR;
    cg = CG;
    cb = CB;
    index = I;
    hasConnections = new boolean[count]; //totalTori?
  }
  
  void update() {
    if(born) {
      if (paint) {
        paint();
      }
      displayLink();
    }
  }
  
  void paint() {
    cr = int(random(0,255));
    cg = int(random(0,255));
    cb = int(random(0,255));
  }
  
  /*void fly() {
    // Flight
    px = sin(radians(ang3)) * 170;
    py = cos(radians(ang3)) * 300;
    pz = sin(radians(ang4)) * 500;
    translate(width/2 + px, height/2 + py, -700+pz);
    rotateX(sin(radians(ang2)) * 120);
    rotateY(sin(radians(ang2)) * 50);
    rotateZ(sin(radians(ang2)) * 65);

    // Left wing
    pushMatrix();
    rotateY(sin(radians(ang)) * -20);
    //tori[i].update();
    rect(sin(i), cos(i), 75, s);
    popMatrix();
  
    // Wing flap
    ang += flapSpeed;
    if (ang > 3) {
      flapSpeed *= -1;
    } 
    if (ang < -3) {
      flapSpeed *= -1;
    }
  
    // Increment angles
    ang2 += 0.01;
    ang3 += 2.0;
    ang4 += 0.75;
  }*/
  
  void displayLink() {
    for (int i=0; i<totalTori; i++) {
      if (i < index) {
        strokeWeight(s);
        if (hasConnections[i] == false) {
          int r = (int)((cr + tori[i].cr) / 2.0);
          int g = (int)((cg + tori[i].cg) / 2.0);
          int b = (int)((cb + tori[i].cb)/ 2.0);
          int o = int(random(5,255));
          stroke(r,g,b,o);
          
          if(!drawingMode) {
            stroke(tori[i].cr, tori[i].cg, tori[i].cb);
            println("!drawing mode");
          }
        }
        if (mouseX != x) {
          z = random(minZ, maxZ);
        }
        if (equation == 0) {
          //smooth(); //THIS IS WHat slows it down!!!
          spiral(i);
        }
        else if (equation == 1) {
          translate(x,y); //or xpos, ypos
          if (i<1) {
            if (z ==0) { z = 300; } //set z b/c it controls the rotation
            tree(120*(random(1,3))); 
          }
          rotateZ(radians(cameraY)); //rotates around the bottom point
        }
        else if (equation == 2) {
          z = 1;
          attractor(i);
        }
      }
    }
  }
///////////////////////////////////////////////////////////////////////
  
  void spiral(int i) {
    pushMatrix();
    translate(x,y);
    rotateX(radians(cameraX));
    rotateY(radians(cameraY));
     curve((6*(i+0))*sin(i+0),(6*(i+0))*cos(i+0),z,
       (6*(i+1))*sin(i+1),(6*(i+1))*cos(i+1),z+2,
       (6*(i+2))*sin(i+2),(6*(i+2))*cos(i+2),z+4,
       (6*(i+3))*sin(i+3),(6*(i+3))*cos(i+3),z+6);
    popMatrix();
  }
  
  void bezierCurve(int i) {
    //smooth();
    pushMatrix();
    translate(x,y);
    //rotate((x/float(height)-0.5)*-PI);
    //line(i/2,i/2,10,0);
    ellipse(0,0,2,2);
    translate(y-350,x-350);
    rotate((y/float(height)-0.5)*PI);
    //line(0,0,10,0);
    //fill(cr,cg,cb,10);
    //noStroke();
    if (i<2) {   
    ellipse(0,0,10*tan(i),10*tan(i));
    }
    popMatrix();

    rotateX(radians(cameraX));
    rotateY(radians(cameraY));
  }
  
  void tree(float h) {
    h *= 0.66;
    if (h > 2) {
      pushMatrix();
      rotate(radians((z / (float) width) * 90f));
      line(0, 0, 0, -h);
      translate(0, -h);
      tree(h);
      if (mouseX%2 == 0) {
        popMatrix();
        pushMatrix();
      }
      rotate(-radians((z / (float) width) * 90f));
      line(0, 0, 0, -h);
      translate(0, -h);
      tree(h);
      popMatrix();
    }
  }

  void mandelbrot(int i) {
    c = pow(c,2) - sqrt(i);
    translate(x,y,z);
    ellipse(c,c,10,10);
  }
  
  void attractor(int i) {
    strokeWeight(2);
    aa += random(-0.001, 0.001);  ab += random(-0.001, 0.001);
    ac += random(-0.001, 0.001);  ad += random(-0.001, 0.001);
    ax = (sin (aa*ay) - cos(ab*ax));
    ay = (sin (ac*ax) - cos(ad*ay));
    z = sin ( 0.7*ax) - cos( -1.1*z);
    x = (int)((ax+2.5) * (800*0.2))-50;
    y = (int)((ay+2.5) * (800*0.2))-50;
    rotateX(radians(cameraX));
    rotateY(radians(cameraY));
    point(x,y,z);
    println(x + " and " + y);
    stroke(cr,cg,cb,5);
    ellipse(x,y,i*2,i*2);
  }
}

