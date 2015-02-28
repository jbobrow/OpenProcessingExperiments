
//Copyright Christopehr Henley 2014

float AfigX,AfigY,BfigX,BfigY, diam;
float spdAx,spdAy,spdBx,spdBy;
color bgColor=color(0,25);
color elipColor1=color(random(255),random(255),random(255));
color elipColor2=color(random(255),random(255),random(255));



void setup(){
  size(400,400);
  background(0);
  diam=50;
  AfigX=diam/2;
  AfigY=diam/2;
  BfigX=width-(diam/2);
  BfigY=height-(diam/2);
  spdAx=1;
  spdBx=-2;
  spdAy=0;
  spdBy=0;
}

void draw(){
  prepWindow();
  moveFigures();
  drawFigure();
}

void prepWindow(){
  fill(bgColor);
  rect(0,0,width,height);
}

void drawFigure(){
  figure(AfigX,AfigY,elipColor1);
  figure(BfigX,BfigY,elipColor2);
}

void figure(float figX, float figY, int elipColor){
  noStroke();
  fill(elipColor);
  ellipse(figX,figY,diam,diam);
}

void moveFigures(){
  AfigX=AfigX+spdAx;
  AfigY=AfigY+spdAy;
  BfigX=BfigX+spdBx;
  BfigY=BfigY+spdBy;
  //Ellipse 1
  if (AfigX==width-(diam/2) && (AfigY==diam/2)){
    spdAx=0;
    spdAy=1;
    elipColor1=color(random(255),random(255),random(255));
  }
  if (AfigY==height-(diam/2) && (AfigX==width-(diam/2))){
    spdAy=0;
    spdAx=-1;
    elipColor1=color(random(255),random(255),random(255));
  }
  if (AfigX==diam/2 && (AfigY==height-diam/2)){
    spdAx=0;
    spdAy=-1;
    elipColor1=color(random(255),random(255),random(255));
  }
  if (AfigY==diam/2 && (AfigX==diam/2)){
    spdAx=1;
    spdAy=0;
    elipColor1=color(random(255),random(255),random(255));
  }
  //Ellipse 2
  if (BfigX==width-(diam/2) && (BfigY==diam/2)){
    spdBx=0;
    spdBy=2;
    elipColor2=color(random(255),random(255),random(255));
  }
  if (BfigY==height-(diam/2) && (BfigX==width-(diam/2))){
    spdBy=0;
    spdBx=-2;
    elipColor2=color(random(255),random(255),random(255));
  }
  if (BfigX==diam/2 && (BfigY==height-diam/2)){
    spdBx=0;
    spdBy=-2;
    elipColor2=color(random(255),random(255),random(255));
  }
  if (BfigY==diam/2 && (BfigX==diam/2)){
    spdBx=2;
    spdBy=0;
    elipColor2=color(random(255),random(255),random(255));
  }
}


