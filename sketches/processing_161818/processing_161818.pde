
float widt = 750;
float dx = 50;
color col = color(200,100,100);

void setup(){
  size(750,750);
}

void draw(){
  background(200);
//  float offSet = (millis()/(500./dx))%(dx*6.);
//  if(offSet>4.5*dx){
//    offSet = offSet=3.*dx;
//  }else if(offSet>3.*dx){
//    offSet = offSet-1.5*dx;
//  }else if(offSet>1.5*dx){
//    offSet = 1.5*dx;
//  }
  float offSet = (millis()/(1000./dx))%(dx*3);
  
  drawRow(offSet, 3.*dx, -5.*dx);
  drawRow(offSet, 0, 0);
  drawRow(offSet, 3.*dx, 5.*dx);
}

void drawRow(float offSet,float x, float y){
  drawStaticRect(offSet, x, y);
  drawShrinkingRect(offSet, x, y);
  drawExpandingRect(offSet, x, y);
  drawBars(offSet);
}

void drawExpandingRect(float offSet, float x, float y){
  noStroke();
  fill(col);
  int nBars = ceil(widt/(dx*3.))+1;
  float adjustment;
  if(offSet<1.5*dx){
    adjustment = 0;
  }else{
    adjustment = 1.5*dx;
    offSet = offSet-1.5*dx;
  }
  for(int i=0;i<ceil(nBars/2.);i++){
    pushMatrix();
    float pos = offSet/(dx*1.5);
    translate(-2.*dx+i*6.*dx+adjustment+x,widt/2.-dx/2.+y);
    translate(-1.5*dx*pos,pos*dx);
    scale(1.+pos);
    rotate(pos*-1.*PI/2.);
    rect(0,0,dx/2.,dx);
    popMatrix();
  }
}
  
void drawShrinkingRect(float offSet, float x, float y){
  noStroke();
  fill(col);
  int nBars = ceil(widt/(dx*3.))+1;
  float adjustment;
  if(offSet<1.5*dx){
    adjustment = 0;
  }else{
    adjustment = 1.5*dx;
    offSet = offSet-1.5*dx;
  }
  for(int i=0;i<ceil(nBars/2.);i++){
    pushMatrix();
    float pos = offSet/(dx*1.5);
    translate(3.*dx+i*6.*dx+adjustment+x,widt/2.-dx/2.+y);
    //translate(-1.5*dx*pos,pos*dx);
    translate(-2.*dx+.5*dx*pos,dx);
    scale(2.-pos);
    //rotate(PI/2.+pos*PI/2.);
    rotate(1.5*PI-pos*PI/2.);
    rect(0,0,dx/2.,dx);
    popMatrix();
  }
}

void drawStaticRect(float offSet, float x, float y){
  noStroke();
  fill(col);
  int nBars = ceil(widt/(dx*3.))+1;
  if(offSet<1.5*dx){
    for(int i=0;i<ceil(nBars/2.);i++){
      rect(-.5*dx+i*6.*dx+x,widt/2.-dx/2.+y,dx/2.,dx);
    }
  }else{
    for(int i=0;i<ceil(nBars/2.);i++){
      rect(dx+i*6.*dx+x,widt/2.-dx/2.+y,dx/2.,dx);
    }
  }
}

void drawBars(float offSet){
  noStroke();
  fill(0);
  pushMatrix();
  translate(-1.*(offSet-1.5*dx),0);
  int nBars = ceil(widt/(dx*3.))+1;
  for(int i=0;i<nBars;i++){
    rect(i*3.*dx,0,dx,widt);
  }
  popMatrix();
}


