
import controlP5.*;

ControlP5 controlP5;

int maxStep = 12;
int[] rSeeds = new int[maxStep];
int angle = 45;
float rtheta;
float leng = 60;
float lratio = 0.66;
float aratio = 1;
float pos = 1;
int step = 4;
int tmin = 20;
int tmax = 50;
int mod = 3;
boolean swAng = true;

RadioButton r;

void setup() {
  size(550, 400);
  smooth();
  
  controlP5 = new ControlP5(this);
  
  for(int i = 0; i<maxStep; i++){
    rSeeds[i] = int(random(1000000000));
  }
  
  int s1 = 15;
  
  r = controlP5.addRadioButton("radioButton",20,20);
  r.setSpacingRow(48);
  Toggle t1 = r.addItem("Normal Angle",1);
  Toggle t2 = r.addItem("Random Angle",2);
  r.activate(0);
  
  controlP5.addSlider("angle",0,90,angle,20,20+s1*1,80,10);
  controlP5.addSlider("aratio",0,2,aratio,20,20+s1*2,80,10);
  controlP5.addSlider("tmin",0,90,tmin,20,65+s1*2,80,10);
  controlP5.addSlider("tmax",0,90,tmax,20,65+s1*3,80,10);
  
  controlP5.addSlider("step",1,maxStep,step,20,80+s1*4,80,10);
  controlP5.addSlider("leng",10,150,leng,20,80+s1*5,80,10);
  controlP5.addSlider("lratio",0.1,1,lratio,20,80+s1*6,80,10);
  controlP5.addSlider("pos",0,2,pos,20,80+s1*7,80,10);
  controlP5.addSlider("mod",1,5,mod,20,80+s1*8,80,10);
  
  
}



void draw() {
  background(255);
  
  //randomSeed(rseed);
  //println(random(100,50));
  
  fill(200);
  noStroke();
  rect(0,0,150,height);

  

  pushMatrix();
  translate(150+(width-150)/2, height);
  stroke(0);
  branch(leng,radians(angle),step);
  popMatrix();
}

void branch(float len, float ang, int count) {
  float sw = map(len,2,120,1,10);
  color col = color(map(len,120,0,50,200),map(len,120,0,50,200),50);
  stroke(col);
  strokeWeight(sw);
      
  line(0, 0, 0, -len);
  translate(0, -len*pos);

  len *= lratio;
  
  // All recursive functions must have an exit condition!!!!
  count--;
  
  
  float theta;
  randomSeed(rSeeds[count]);
  if(swAng){
    theta = ang;
    theta *= aratio;
  }else{
    if(tmax>tmin){
      theta = int(random(tmin,tmax));
    }else{
      theta = int(random(tmax,tmin));
    }
    theta = map(theta,0,90,0,PI/2);
  }  
  
  
  
  if (count > 0) {
    pushMatrix();
    rotate(theta);
    branch(len,theta,count);       // call myself to draw new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    branch(len,theta,count);
    popMatrix();
    
    if(count % mod == 0){
      pushMatrix();
      branch(len*2/3,theta,count);
      popMatrix();
    }
  }
}

void keyReleased(){
  if(key == 's' || key == 'S'){
    for(int i = 0; i<maxStep; i++){
      rSeeds[i] = int(random(1000000000));
    }
  }
  if(key == 't' || key == 'T'){
    saveFrame();
  }
}


void controlEvent(ControlEvent theEvent) {
  int m = int(theEvent.group().value());
  switch(m){
    case 1:
      swAng = true;
      break;
    case 2:
      swAng = false;
      break;
  }
}


void angle(int theValue){
  angle = theValue;
}
void aratio(float theValue){
  aratio = theValue;
}
void tmin(int theValue){
  tmin = theValue;
}
void tmax(int theValue){
  tmax = theValue;
}
void step(int theValue){
  step = theValue;
}
void leng(float theValue){
  leng = theValue;
}
void lratio(float theValue){
  lratio = theValue;
}
void pos(float theValue){
  pos = theValue;
}
void mod(int theValue){
  mod = theValue;
}

