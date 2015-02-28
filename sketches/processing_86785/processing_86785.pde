
//mouseclick rotate on Y axis
//spacebar rotate on X axis
//m key shows moonwalk

float tick, cd, dd;
float target_degY, target_degX, hi;
PFont font;

PImage[] mj;
int playhead;
int ct, st, inv;
boolean mjshow;

void setup() {
  size(500, 500, P3D);
  strokeWeight(4.5);
  smooth();
  
  target_degY=0;
  target_degX=0;
  tick=0;
  cd=0;
  dd=0;
  hi=180;

  font=loadFont("AbadiMT-CondensedLight-24.vlw");
  textFont(font, 18);

  mjshow=false;
  playhead=0;
  inv=500;
  st=millis();
  //load images in for MJ animation
  mj=new PImage[6];
  for (int i=0; i<6;i++) {
    mj[i]=loadImage("mj_"+(i+1)+".png");
  }
}

void draw() {
  background(0);
  //light();
  //setup camera type (orthography or perspective)
  ortho(-width/2, width/2, -height/2, height/2, -10, 10);
  
  //use screen center as (0,0)
  translate(width/2, height/2);
  
  //animate (lerp concept) rotation on X axis and Y axis
  cd+=(target_degY-cd)*0.3;
  rotateY(cd*PI/180);
  dd+=(target_degX-dd)*0.3;
  rotateX(dd*PI/180);
  
  //draw 1, 0, -1 near Y axis
  pushMatrix();
  translate(25-width/2, 6, -30);
  rotateY(-cd*PI/180);
  text("0", 0, 0);
  translate(0, -hi, 0);
  text("1", 0, 0);
  translate(0, 2*hi, 0);
  text("-1", 0, 0);
  popMatrix();
  
  //draw X and Y axis
  stroke(240, 215, 255);
  line(45-width/2, 30-height/2, 0, 45-width/2, 470-height/2, 0);
  line(35-width/2, 0, 0, 480-width/2, 0, 0);
  
  //draw dotted trace of sin wave
  noStroke();
  for (int i=0;i<90;i++) {
    fill(151, 213, 230);
    pushMatrix();
    translate(45+i*4.8-width/2, -sin(4*i*PI/180)*hi, 0);
    sphere(1);
    popMatrix();
  }
  
  //draw the animated ball
  translate(45+tick*2.4-width/2, -sin(2*tick*PI/180)*hi, 0);
  fill(255, 239, 221);
  sphere(10);

  //draw MJ
  if (target_degX>0 && mjshow) {
    pushMatrix();
    translate(-20, 0, 105);
    rotateX(-dd*PI/180);
    rotateY(90);
    translate(-30, 0, 0);
    if (sin(2*(tick-1)*PI/180)-sin(2*tick*PI/180)<0) {
      scale(-1, 1, 0);
      translate(-50, 0, 0);
    }
    image(mj[playhead], 0, 0);
    ct=millis();
    if (ct-st>inv) {
      playhead+=1;
      if (playhead>5) {
        playhead=0;
      }
      st=ct;
    }
    popMatrix();
  }
  //draw the number next to the ball
  if (!mjshow) {
    float d= sin(2*tick*PI/180);
    pushMatrix();
    translate(20, 5, 20);
    rotateY(-cd*PI/180);
    text("Y="+d, 0, 0);
    popMatrix();
  }
  //step 1 at a time, when exceed 180 return to 1
  tick+=1;
  if (tick>180) {
    tick=1;
  }
}

void keyReleased() {
  if (keyCode==32) {
    //toggle rotate angle between 0 and 90;
    if (target_degX==0) {
      target_degX=90;
    }
    else {
      target_degX=0;
      mjshow=false;
    }
  }
  if (key=='m') {
    mjshow=!mjshow;
  }
}

void mouseReleased() {
  //toggle rotate angle between 0 and 90;
  if (target_degY==0) {
    target_degY=90;
  }
  else {
    target_degY=0;
  }
}


