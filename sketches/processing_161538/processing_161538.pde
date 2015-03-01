
float biggest = 100;
float spacing = 1.5*biggest;
float widt = 770;
color tCol = color(200,50,50);

void setup(){
  size(770,770);
  drawTargets();
  drawOccluders();
}

void draw(){
  
}

void drawTargets(){
  background(255);
  int nSmall;
  int rand = floor(random(15));
  if(rand<5){
    nSmall=0;
  }else if(rand<9){
    nSmall=1;
  }else if(rand<12){
    nSmall=2;
  }else if(rand<14){
    nSmall=3;
  }else{
    nSmall=4;
  }
  int nBig = floor(random(4.99-nSmall));
  drawSmalls(nSmall);
  drawBigs(nBig);
}

void drawSmalls(int n){
  noStroke();
  fill(tCol);
  for(int i=0;i<n;i++){
    float x;
    x = random(widt-biggest/2.);
    while((x-spacing/2.)%(2.*biggest) < biggest/2. || (x-spacing/2.)%(2.*biggest) > 1.5*biggest){
     x = random(widt-biggest/2.);
    }
    float y = random(widt-biggest/2.);
    if(random(2)>1.){
      rect(x,y,biggest/2.,biggest/4.);
    }else{
      rect(x,y,biggest/4.,biggest/2.);
    }
  }
}

void drawBigs(int n){
  noStroke();
  fill(tCol);
  int nOcc = floor(random(n+.99));
  int nColumns = ceil(widt/(spacing+biggest/2.));
  for(int i=0;i<nOcc;i++){
    float x = floor(random(nColumns))*2.*biggest+spacing/2.-biggest/4.;
    float y = random(widt-biggest/2.);
    rect(x,y,biggest,biggest/2.);
  }
  for(int i=0;i<n-nOcc;i++){
    float x;
    x = random(widt-biggest);
    while((x-spacing/2.)%(2.*biggest) < biggest/2. || (x-spacing/2.)%(2.*biggest) > biggest){
     x = random(widt-biggest);
    }
    float y = random(widt-biggest);
    if(random(2)>1.){
      rect(x,y,biggest/2.,biggest);
    }else{
      rect(x,y,biggest,biggest/2.);
    }
  }
}

void drawOccluders(){
  int nColumns = ceil(widt/(spacing+biggest/2.));
  fill(0);
  noStroke();
  for(int i=0;i<nColumns;i++){
    rect(.5*spacing+i*(spacing+biggest/2.),0,biggest/2.,widt);
  }
}

void mousePressed(){
  drawTargets();
  drawOccluders();
}


