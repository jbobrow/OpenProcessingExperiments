

final int NUMPOINTS=12;
final int FIXEDDIST=10;
final int BORDER=-100;




float fTargX, fTargY, fDeltaX, fDeltaY;
Boolean mouseControl;

class SPoint {
  float fX, fY;
  SPoint(float fTX, float fTY) {
    fX=fTX;
    fY=fTY;
  }
}

SPoint[] points=new SPoint[NUMPOINTS];
SPoint[] buffer=new SPoint[NUMPOINTS];



void setup() {

  size(800, 600);

  //init points
  for (int i=0;i<NUMPOINTS; i++) {
    points[i]= new SPoint(FIXEDDIST*i, height/2);
    buffer[i]= new SPoint(0, 0);
  }
  fTargX=width/2;
  fTargY=height/2;
  fDeltaX=random(-4, 4);
  fDeltaY=random(-4, 4);
  fill(64, 128, 64);
  stroke(64, 128, 64);
  mouseControl=false;

  frameRate(40);
}


void draw() {


  background(200, 210, 230);
  //background(0);
  showPoints();
  updatePoints();

  if (mouseControl) {
     points[NUMPOINTS-1].fX=mouseX;
     points[NUMPOINTS-1].fY=mouseY;
  }
  else {

    points[NUMPOINTS-1].fX=fTargX;
    points[NUMPOINTS-1].fY=fTargY;

    fTargX+=fDeltaX;
    fTargY+=fDeltaY;

    if ((fTargX<BORDER) || (fTargX>width-BORDER)) {
      fDeltaX=-fDeltaX;
      fTargX+= 2*fDeltaX;
    }
    if ((fTargY<BORDER) || (fTargY>height-BORDER)) {
      fDeltaY=-fDeltaY;
      fTargY+= 2*fDeltaY;
    }

    if (random(1)>0.98) {
      fDeltaX=random(-4, 4);
      fDeltaY=random(-4, 4);
    }
  }
}



void mousePressed(){
  
   mouseControl=!mouseControl; 
   if(mouseControl) noCursor();
     else{
       fTargX=mouseX;
       fTargY=mouseY;
       cursor();
     }
}


void showPoints() {

  float fXT, fYT;
   
  //connect 
  stroke(206, 148, 148, 220);  
  for (int i=0;i<NUMPOINTS-1; i++) {
    strokeWeight(8+2*i); 
    line(points[i].fX, points[i].fY, points[i+1].fX, points[i+1].fY);
  }

  noStroke();
  fill(206, 148, 148);
  for (int i=0;i<NUMPOINTS-1; i++)
    ellipse(points[i].fX, points[i].fY, 8+i, 8+i);



  //eyesies :D
  fXT=points[NUMPOINTS-1].fX - points[NUMPOINTS-2].fX;
  fYT=points[NUMPOINTS-1].fY - points[NUMPOINTS-2].fY;  
  PVector vT1=new PVector(fXT, fYT);
  float temp1=vT1.heading2D()-radians(90);
  float temp2=vT1.heading2D()+radians(90);
  stroke(0);  
  strokeWeight(8);
  line(points[NUMPOINTS-1].fX +10*cos(temp1), points[NUMPOINTS-1].fY+10*sin(temp1), points[NUMPOINTS-1].fX+10*cos(temp2), points[NUMPOINTS-1].fY+10*sin(temp2));
  stroke(200, 200, 200);  
  strokeWeight(2);   
  ellipse(points[NUMPOINTS-1].fX+12*cos(temp2), points[NUMPOINTS-1].fY+12*sin(temp2), 3, 3);
  ellipse(points[NUMPOINTS-1].fX+12*cos(temp1), points[NUMPOINTS-1].fY+12*sin(temp1), 3, 3);

  //head
  noStroke();
  fill(206, 148, 148);
  ellipse(points[NUMPOINTS-1].fX, points[NUMPOINTS-1].fY, 8+NUMPOINTS, 8+NUMPOINTS);
  
}



void updatePoints() {

  PVector v1, v2;
  float mag1, mag2;
  float extension1, extension2;
  float fX1, fY1, fX2, fY2, finalX, finalY;

  for (int i=1; i<NUMPOINTS-1; i++) {

    //preceeding node
    fX1=points[i-1].fX - points[i].fX;
    fY1=points[i-1].fY - points[i].fY;
    v1=new PVector(fX1, fY1);
    mag1=v1.mag();
    extension1 = mag1 - FIXEDDIST;

    //next node
    fX2=points[i+1].fX - points[i].fX;
    fY2=points[i+1].fY - points[i].fY;
    v2=new PVector(fX2, fY2);
    mag2=v2.mag();
    extension2= mag2 - FIXEDDIST;    

    finalX=(fX1 / mag1 * extension1) + (fX2 / mag2 * extension2);
    finalY=(fY1 / mag1 * extension1) + (fY2 / mag2 * extension2);

    buffer[i].fX = points[i].fX + (finalX * 0.8);
    buffer[i].fY = points[i].fY + (finalY * 0.8);
  }

  //need to deal with end...

  //next node
  fX2=points[1].fX - points[0].fX;
  fY2=points[1].fY - points[0].fY;
  v2=new PVector(fX2, fY2);
  mag2=v2.mag();
  extension2= mag2 - FIXEDDIST;    

  finalX=(fX2 / mag2 * extension2);
  finalY=(fY2 / mag2 * extension2);

  buffer[0].fX = points[0].fX + (finalX * 0.8);
  buffer[0].fY = points[0].fY + (finalY * 0.8);  


  //copy buffer over
  for (int i=0; i<NUMPOINTS-1; i++) 
    points[i]=buffer[i];
}



