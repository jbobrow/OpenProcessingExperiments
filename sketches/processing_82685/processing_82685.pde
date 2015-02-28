
/* 
 this work by [Complex Geometry] www.complexgeometry.com is licensed under
 a Creative Commons Attribution-ShareAlike 3.0 Unported License
 
 This work is for the public domain, fell free to use it, share it and modify it, by providing
 proper citing. The author, Leonardo Nuevo Arenas of [Complex Geometry] makes no warranty, expressed
 or implied, as to the usefulness of the software and documentation for any purpose. If this tool is
 used for comercial purposes please notify the author.
 for more resources and information please visit www.complexgeometry.com
 .*/
 
int n;
float posX[], velX[], posY[], velY[], baseX1[], velBaseX1[], baseX2[], velBaseX2[];
float mini, maxi;

void setup() {
  
  n= 6;

  size(1280, 720);
  background(0);
  smooth();
  frameRate(60);

  posX=new float[n];
  velX=new float[n];
  posY=new float[n];
  velY=new float[n];
  baseX1=new float[n];
  baseX2=new float[n];
  velBaseX1=new float[n];
  velBaseX2=new float[n];
  mini= -7;
  maxi=  7;
 

  for (int i=0;i<n;i++) {
    posX[i]=random(width);
    posY[i]=random(height);
    velX[i]=random(mini, maxi);
    velY[i]=random(mini, maxi);
    baseX1[i]=random(width);
    baseX2[i]=random(width);
    velBaseX1[i]=random(mini, maxi);
    velBaseX2[i]=random(mini, maxi);
  }
}

void draw() {

  for (int i=0;i<n;i++) {

    stroke(255,10);
    line(baseX1[i], 0, posX[i], posY[i]);
    line(baseX2[i], height, posX[i], posY[i]);

    posX[i]+=velX[i];
    posY[i]+=velY[i];
    baseX1[i]+=velBaseX1[i];
    baseX2[i]+=velBaseX2[i];
  }

  for (int i=0; i<n;i++) {

    if ((posX[i]>width)||(posX[i]<0)) {
      velX[i]*=-1;
    }
    if ((posY[i]>height)||(posY[i]<0)) {
      velY[i]*=-1;
    }
    if ((baseX1[i]>width)||(baseX1[i]<0)) {
      velBaseX1[i]*=-1;
    }
    if ((baseX2[i]>width)||(baseX2[i]<0)) {
      velBaseX2[i]*=-1;
    }
  }
}

void keyPressed() {
  if (key=='s') {
    String date= day()+" "+ hour()+" "+minute()+" "+second();
    saveFrame("flow"+ date +".png");
  }
  if (key=='c') {
    fill(0);
    rect(0, 0, width, height);
  }
  if (key=='r') {
    n=int(random(1,5));

    fill(0);
    rect(0, 0, width, height);
    
    for (int i=0;i<n;i++) {
    posX[i]=random(width);
    posY[i]=random(height);
    velX[i]=random(mini, maxi);
    velY[i]=random(mini, maxi);
    baseX1[i]=random(width);
    baseX2[i]=random(width);
    velBaseX1[i]=random(mini, maxi);
    velBaseX2[i]=random(mini, maxi);
  }
 
  }
}
