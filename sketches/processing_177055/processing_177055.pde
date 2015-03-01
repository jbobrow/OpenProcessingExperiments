
float widt = 1000;
color c1 = color(0);
color c2 = color(255);
float thick1 = 20;
float thick2 = 40;
float displacement = 10;
int phase = 1;
float interval = 70;
float lastT;

void setup(){
  size(1000,1000);
  lastT = millis();
}

void draw(){
  if(millis()-lastT>interval){
    phase = phase+1;
    if(phase==5){
      phase=1;
    }
    lastT = millis();
  }
  pushMatrix();
  if(phase==1){
    c1 = color(0);
    c2 = color(255);
  }else if(phase==2){
    c1 = color(0);
    c2 = color(255);
    translate(displacement,0);
  }else if(phase==3){
    c1 = color(255);
    c2 = color(0);
  }else if(phase==4){
    c1 = color(255);
    c2 = color(0);
    translate(displacement,0);
  }
  drawStim(c1,c2);
  popMatrix();
  drawMask();
}

void drawStim(color col1, color col2){
  background(c1);
  fill(c2);
  noStroke();
  for(float th = thick1;th<widt/2;th=th+2*thick1){
    rect(th,0,thick1,widt);
  }
  for(float th= thick2+widt/2;th<widt;th = th+2*thick2){
    rect(th,0,thick2,widt);
  }
  pushMatrix();
  translate(0,widt/2);
  fill(c1);
  rect(0,0,widt,widt);
  fill(c2);
  for(float th = thick1*2;th<widt/2;th=th+4*thick1){
    rect(th,0,thick1,widt);
  }
  for(float th= thick2*2+widt/2;th<widt;th = th+4*thick2){
    rect(th,0,thick2,widt);
  }
  popMatrix();
}

void drawMask(){
  fill(128);
  noStroke();
  float maskTh = 50;
  rect(0,0,maskTh,widt);
  rect(widt/2-maskTh/2,0,maskTh,widt);
  rect(widt-maskTh,0,maskTh,widt);
  
  rect(0,0,widt,widt/3-25);
  rect(0,widt/3+25,widt,widt/3-50);
  rect(0,2*widt/3+25,widt,widt);
}


