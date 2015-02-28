
import processing.pdf.*;
boolean record;
int col_increment=255;    // speed of color change
int gl_r=255,gl_g=255,gl_b=255;  // global ranges to select from
int a=10;  //global alpha
int numthreads=500;
triang[] t=new triang[numthreads];
float tsize=7;
boolean bg=true;  //true = black, false = white
boolean paused=false;
int randomness,rand_thresh=0;            // threshold of randomness (0) vs mouse direction (100)
float initx1,inity1;
int runtimes=0;

void setup() {
  //size(screen.width, screen.height);
  runtimes++;
  size(screen.width,screen.height);    // for facebook cover
  size(600,600);
  if (bg) background(0); else background(255); 
  if (runtimes<=5) {      // start in middle first 5 times
    initx1=width/2;
    inity1=height/2;
  }
  else {
    initx1=mouseX;
    inity1=mouseY;
  }
  for (int i=0;i<t.length;i++) {
    t[i]=new triang();
    t[i].x1=initx1;
    t[i].y1=inity1; 
    t[i].x2=initx1-tsize/2;
    t[i].y2=inity1+tsize/sqrt(2);
    t[i].x3=initx1+tsize/2;
    t[i].y3=inity1+tsize/sqrt(2);
  }
//  t[0].col=color(255,255,0,10);
//  t[1].col=color(0,255,255,10);
//  t[2].col=color(255,0,255,10);
  smooth();
  noStroke();
}

void draw() {
  //to print PDF
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  //if (bg) background(0); else background(255);
  
  //draw triangles
  for (int i=0;i<t.length;i++) {
    t[i].draw();
    t[i].move();
  }
  
  //to print PDF
  if (record) {
    endRecord();
    record = false;
  }
  
}

/////////// TRIANGLE CLASS ///////////

class triang {
  float x1, y1, x2, y2, x3, y3;
  int dir;                                    // random 0-2 determines next placement
  boolean t_up=true, rand=true;
  int r,g,b;
  color col;

  triang() {
    r=int(random(gl_r));
    g=int(random(gl_g));
    b=int(random(gl_b));
  }

  void draw() {
    col=color(r,g,b,a);
    fill(col);
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  void choosedir() {
    
    randomness = int(random(100));
    if (randomness>rand_thresh) rand=true; else rand=false;
    if (rand==true) dir=int(random(3));
    else {
      
      if (t_up==true) {
        if (mouseY>=y2) dir=1;
        if ((mouseY<y2) && (mouseX<=x1)) dir=0;
        if ((mouseY<y2) && (mouseX>x1)) dir=2;
      }
      
      if (t_up==false) {
        if (mouseY<=y2) dir=1;
        if ((mouseY>y2) && (mouseX<=x1)) dir=0;
        if ((mouseY>y2) && (mouseX>x1)) dir=2;
      }
      
    }
    
  }
  
  void move() {                    // x1,y1 = center node, x2 = left node, x3 = right node
                                             
    choosedir();
    
    if (t_up==true) {              // dir 0 = left, dir 1 = up/down, dir 2 = right
      if (dir==0){
        x1=x2;
        x2=x1-tsize/2;
        x3=x1+tsize/2;
        y1=y2;
        y2=y1-tsize/sqrt(2);
        y3=y1-tsize/sqrt(2); 
      }
      if (dir==1){
        y1=y1+2*tsize/sqrt(2);
      }
      if (dir==2){
        x1=x3;
        x2=x1-tsize/2;
        x3=x1+tsize/2;
        y1=y2;
        y2=y1-tsize/sqrt(2);
        y3=y1-tsize/sqrt(2);
      }
    }
    if (t_up==false) {
      if (dir==0){
        x1=x2;
        x2=x1-tsize/2;
        x3=x1+tsize/2;
        y1=y2;
        y2=y1+tsize/sqrt(2);
        y3=y1+tsize/sqrt(2); 
      }
      if (dir==1){
        y1=y1-2*tsize/sqrt(2);
      }
      if (dir==2){
        x1=x3;
        x2=x1-tsize/2;
        x3=x1+tsize/2;
        y1=y2;
        y2=y1+tsize/sqrt(2);
        y3=y1+tsize/sqrt(2);
      }
    }
    t_up=!t_up;
  }
}

/////////// MOUSE CONTROLS ///////////

// restart on mouse click
//void mousePressed() {
//  setup();
//}

/////////// KEYBOARD CONTROLS ///////////

void keyPressed() {
  if ((key=='`') || (key=='`')) {
    bg=!bg;
    setup();
  }
  if ((key=='p') || (key=='P')) {
    paused=!paused;
    if (paused) noLoop(); else loop();
  }
  if ((key=='s') || (key=='S')) {
    saveFrame("tri-####.jpg");
  }
  if ((key=='r') || (key=='R')) {
    record=true;
  }
  if (key=='d') {
    for (int i=0;i<t.length;i++) {
      t[i].r+=col_increment;
    }
  }
  if (key=='f') {
    for (int i=0;i<t.length;i++) {
      t[i].g+=col_increment;
    }
  }
  if (key=='g') {
    for (int i=0;i<t.length;i++) {
      t[i].b+=col_increment;
    }
  }
  if (key=='c') {
    for (int i=0;i<t.length;i++) {
      t[i].r-=col_increment;
    }
  }
  if (key=='v') {
    for (int i=0;i<t.length;i++) {
      t[i].g-=col_increment;
    }
  }
  if (key=='b') {
    for (int i=0;i<t.length;i++) {
      t[i].b-=col_increment;
    }
  }
  if (key=='q') {
    if (tsize>0) tsize--;
  }
  if (key=='w') {
    tsize++;
  }
  if ((key=='[') && (rand_thresh<100)) rand_thresh+=10;
  if ((key==']') && (rand_thresh>0)) rand_thresh-=10;
  
//  if ((key=='v') || (key=='V')) {
//    record=true;
//  }
//  if ((key=='b') || (key=='B')) {
//    record=true;
//  }
  if (key==' ') {
    setup();
  }
}
