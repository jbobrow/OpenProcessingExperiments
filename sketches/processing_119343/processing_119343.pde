
//Cautions
//Papaver somniferum is one of my favorite flowers! When it is fully blossoming, it is so beautiful but also a //bit scaring! The center is black and yellow, same colors as bees...
//I tried to make them look like blossoming, but I still need to work on how to make a group of funtions repeated at diferent position.  
//Papaver somniferum blossom...click to clear, save screen images and then reapeat.
//suhsiupai@gmail.com


int n1=1;
int div = 3;
int step=1;

void setup() {
  size(800, 450);
  background(0);
  frameRate(24);
  smooth();
  //noLoop();


}


void draw() {


  
   //Draw blue tress
  for (int i = 100; i<900; i+=400) {
    drawtrees(i, 999, i, 0, 200, 4, 20,51 , 8);    
    drawtrees(i, 999, i, 0, 200, 4, 10,41, 7);
    drawtrees(i, 999, i, 0, 200, 2, 5, 31, 6);
    drawtrees(i, 999, i, 0, 255, 2, 0, 20, 2);
  }
  
  
  
  float PXA=320+noise(random(3)*10);float PYA=150+noise(random(1))*10;
  float PXB =650+noise(random(3)*10);float PYB=220+noise(random(1))*10;
  float PXC= 130+noise(random(3)*10); float PYC=300+noise(random(1))*10;
  float PXD=220+noise(random(3)*10); float PYD=360+noise(random(1))*10;
  

  
  //A
  if (frameCount>24) {for (int x=0; x<21;x+=7) {drawflower(PXA, PYA, 2, 225, 50, 50, 1);}}
  if (frameCount>18) {drawflower(PXA, PYA, -10, 60, 5, 5, 20);}
  if (frameCount>12) {drawflower(PXA, PYA, -25, 225, 30, 30, 20);}
  drawflower(PXA, PYA, -50, 210, 20, 20, 20);  
  for (int x=0; x<21; x+=7) {drawspiralline(PXA,PYA);}
  drawflowercenter(PXA,PYA);

   //B
  if (frameCount>6) {for (int x=0; x<21;x+=7) {drawflower(PXB,PYB, 2, 225, 50, 50, 1);}}
  if (frameCount>6) {drawflower(PXB,PYB, -10, 60, 5, 5, 20);}
  if (frameCount>3) {drawflower(PXB,PYB, -25, 225, 30, 30, 20);}
  drawflower(PXB,PYB, -50, 210, 20, 20, 20);  
  for (int x=0; x<21; x+=7) {drawspiralline(PXB,PYB);}
  drawflowercenter(PXB,PYB);
 
 
  pushMatrix();
  translate(0,-150);
  
  scale(1.5);
  
   //C
  if (frameCount>24) {for (int x=0; x<21;x+=7) {drawflower(PXC,PYC, 2, 155, 30, 70, 1);}}
  if (frameCount>18) {drawflower(PXC,PYC, -10, 155, 40, 60, 20);}
  if (frameCount>12) {drawflower(PXC,PYC, -25, 155, 30, 92, 20);}
  drawflower(PXC,PYC, -50, 139, 34, 82, 20);  
  for (int x=0; x<21; x+=7) {drawspiralline(PXC,PYC);}
  drawflowercenter(PXC,PYC);
  
   //D
  if (frameCount>18) {for (int x=0; x<21;x+=7) {drawflower(PXD,PYD, 2, 225, 50, 50, 1);}}
  if (frameCount>12) {drawflower(PXD,PYD, -10, 60, 5, 5, 20);}
  if (frameCount>9) {drawflower(PXD,PYD, -25, 225, 30, 30, 20);}
  drawflower(PXD,PYD, -50, 210, 20, 20, 20);  
  for (int x=0; x<21; x+=7) {drawspiralline(PXD,PYD);}
  drawflowercenter(PXD,PYD);

  
  popMatrix();
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}



void drawtrees(float sx, float sy, float ex, float ey, float trans, int cr, int cg, int cb, int thick) {
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  float t =trans; 
  int th= thick;
  int CoR= cr;
  int CoG= cg;
  int CoB =cb;
  for (int i=0; i<div; i++) {
    x = x + xstep;
    x = x + random(6) - 5; // wiggle on x
    y = y + ystep;
    y = y + random(15) - 7; // wiggle on y
    stroke(cr, cg, cb, t);
    strokeWeight(th);
    //line (x, y, lastx, lasty);
    line (x, height-y, lastx, height-lasty);
    lastx = x;
    lasty = y;
  }
}


void drawflower(float px, float py, float ce, int dr, int dg, int db, int trans) { 
  float PX=px;
  float PY=py;
  float CE = ce;
  int DR =dr;
  int DG = dg;
  int DB = db;
  int TR=trans;
  strokeWeight(0.1);
  float radius = 100;
  float centX=PX;
  float centY=PY;


  stroke(DR, DG, DB, 56);
  float x, y;
  float noiseval = random(100);
  float radVariance, thisRadius, rad;
  beginShape();

  fill(DR, DB, DG, TR);


  for (float ang=0; ang<=360;ang+=1)
  {
    noiseval += 0.06;
    radVariance=CE+20*customNoise(noiseval);
    thisRadius=radius+radVariance;
    rad=radians(ang);
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    curveVertex(x, y);

    line(centX, centY, x, y);
  }

  endShape();
}



void drawspiralline(float px, float py) {

  strokeWeight(0.5);
  float PX=px;
  float PY=py;
  float radius = 100;
  float centX= PX;
  float centY=PY;
  stroke(255, 30);
  noFill();
  //ellipse(centX,centY,radius*2,radius*2);
  stroke(0, 90);
  radius = 10;
  float x, y;
  float lastx=-999;
  float lasty=-999;
  float radiusNoise=random(10);
  for (float ang=0; ang<=360*2.5;ang+=1) {
    radiusNoise+=0.008;
    radius+=0.1; 
    float thisRadius=radius+(noise(radiusNoise)*100)-100;
    float rad = radians(ang);
    x= centX + (thisRadius*cos(rad));
    y= centY+(thisRadius*sin(rad));

    if (lastx>-999) {
      line (x, y, lastx, lasty);
    }
    lastx=x;
    lasty=y;  
    line(centX, centY, x, y);
  }
}


void drawflowercenter(float px, float py) {

  strokeWeight(0.);
  strokeWeight(0.5);
  float PX=px;
  float PY=py;
  float radius = 100;
  float centX= PX;
  float centY=PY;

  noFill();
  //ellipse(centX,centY,radius*2,radius*2);
  stroke(255, 246, 143, 50);
  radius = 10;
  float x, y;
  float lastx=-999;
  float lasty=-999;
  float radiusNoise=random(0.1);
  for (float ang=0; ang<=360*3.1;ang+=10) {
    radiusNoise+=0.01;
    radius+=1; 
    float thisRadius=radius+(noise(radiusNoise)*100)-10;
    float rad = radians(ang);
    x=centX + 0.15*(thisRadius*cos(rad));
    y=centY+0.15*(thisRadius*sin(rad));

    lastx=x;
    lasty=y;  
    line(centX,centY, x, y);
float R= random(1.3,2);
    if (frameCount>18) {
      fill(255, 246, 143, 255);
      
      ellipse(x, y, R,R);
    }
  }
}











//custoomed moise function
float customNoise(float value) {
  float retValue=pow(sin(value), 2);
  return retValue;
}

void clearBackground() {
  background(0);
}



void mousePressed() {
  saveFrame("spiral####.png");
  clearBackground();
}





