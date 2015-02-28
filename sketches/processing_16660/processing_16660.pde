

import processing.pdf.*;

/* global variables */
// dimension of fourbar ... link lengths
float a,b,c,d;
// initial angle and angle steps of input crank angle
float theta,dtheta;
float[] IP,OP1,GP1,GP2,OP2;
boolean pdfOutput = false;
PGraphicsPDF pdf;

void circularArc(float cx, float cy, float rad,float sa,float ea,float adelta){
  /* 
  draw a circular arc centered at (cx,cy), having radius rad, angle sweep (sa,ea), and angle step adelta
  Supposed to be called within BeginShape .. EndShape
  */
  float newgx, newgy;
  
  int adiv = round( rad*abs(ea-sa)/adelta );
  adelta = (ea-sa)/adiv;  
  
  float gx = rad*cos(sa); 
  float gy = rad*sin(sa); 
  float rx = cos(adelta);
  float ry = sin(adelta);
  float a = sa;
  for(int i=0;i<adiv;i++){
    if(false){
      // g <- (gx+I*gy)*(rx+I*ry) = (gx*rx-gy*ry)+I*(gx*ry+gy*rx)
      newgx = (gx*rx-gy*ry);
      newgy = (gx*ry+gy*rx);
      gx = newgx;
      gy = newgy;
    } else {
      gx = rad*cos(a);
      gy = rad*sin(a);
      a += adelta;
    }
    vertex(cx+gx,cy+gy);
  }

}

void setup(){
  size(450,450);
  frameRate(24);
  
  smooth();
  
  a = 1;
  b = 2;
  c = 3;
  d = 2;
  
  theta = 0.0;
  dtheta = 8*PI/180;
  
  // declare Input point, Output points
  IP = new float[2];
  OP1 = new float[2];
  OP2 = new float[2];
  // declare ground pivot 1 and 2 
  GP1 = new float[2];
  GP2 = new float[2];
  
  if(pdfOutput){
    pdf = (PGraphicsPDF)beginRecord(PDF, "deneme2.pdf");
    beginRecord(pdf);
  }
  
}

float[] ab(float d1, float d2, float d){
  /* 
  finds normalized coordinates (alpha,beta) of point which is at a distance 
  d1,d2 from  two points that are located with a distance d apart from each other. 
  */
  float[] result = new float[2];
  float delta = (d1-d2)/d;
  float sigma = (d1+d2)/d;
  
  result[0] = (1+sigma*delta)/2.0;
  result[1] = 0.5*sqrt((1-sq(delta))*(sq(sigma)-1));
  
  return result;
}

void drawConnectingRodx(float r1, float r2, float R1, float R2, float rho1, float rho2, float d, boolean filled){
  /* 
  draws connecting rod schematically aligned with x axis. 
  (R1,r1) and (R2,r2) are big and small radii at the two ends.
  d is the distance between centers.
  require:
    R1>r1>0,   R2>r2>0,   rho1>0,   rho2>0
  */
  float a = asin((r2-r1)/d);
  float p1x = -r1*sin(a);
  float p1y = +r1*cos(a);
  
  float p2x = d-r2*sin(a);
  float p2y =  +r2*cos(a);  
  //strokeWeight(0.1);
  //point(0.0,0.0);  
  //point(d,0.0);
  
  float q1x = p1x + sqrt(sq(R1)-sq(r1))*cos(a);
  float q1y = p1y + sqrt(sq(R1)-sq(r1))*sin(a);

  float q2x = p2x - sqrt(sq(R2)-sq(r2))*cos(a);
  float q2y = p2y - sqrt(sq(R2)-sq(r2))*sin(a);
  
  float p1s1 = sqrt( sq(R1+rho1)-sq(rho1+r1) );
  float p2s2 = sqrt( sq(R2+rho2)-sq(rho2+r2) );
  
  float b1 = acos((rho1+r1)/(rho1+R1));
  float b2 = acos((rho2+r2)/(rho2+R2));
  
  float w1x = (rho1+R1)*cos(PI/2+a-b1);
  float w1y = (rho1+R1)*sin(PI/2+a-b1);

  float w2x = d + (rho2+R2)*cos(PI/2+a+b2);
  float w2y =   + (rho2+R2)*sin(PI/2+a+b2);
  
  float s1x = p1x + p1s1*cos(a);
  float s1y = p1y + p1s1*sin(a);
  
  float s2x = p2x - p2s2*cos(a);
  float s2y = p2y - p2s2*sin(a);  

  if(filled){  
    float dela = 0.03;
  
    fill(100,100,200,150);
    beginShape();  
    circularArc(0.,0.,R1,2*PI-(PI/2+a-b1),PI/2+a-b1,dela);
    circularArc(w1x,w1y,rho1,3*PI/2+a-b1,3*PI/2+a,dela);  
  
    circularArc(w2x,w2y,rho2,3*PI/2+a,3*PI/2+a+b2,dela);
    circularArc(d,0,R2,PI/2+a+b2,-(PI/2+a+b2),dela);
    
    circularArc(w2x,-w2y,rho2,-(3*PI/2+a+b2),-(3*PI/2+a),dela);
    endShape(CLOSE);    
  } else {
    noFill();
    strokeWeight(0.015);    
    arc(0,0,        2*R1,2*R1,        PI/2+a-b1,PI); // red-left-top
    arc(w1x,w1y,    2*rho1,2*rho1,    3*PI/2+a-b1,3*PI/2+a); // blue-left-top
    
    line(s1x,s1y,s2x,s2y); // green-top
    
    arc(w2x,w2y,    2*rho2,2*rho2,   3*PI/2+a,3*PI/2+a+b2); //blue-right-top
    arc(d,0,        2*R2,2*R2,       0,PI/2+a+b2); // red-right-top
    
    arc(d,0,        2*R2,2*R2,       -(PI/2+a+b2),0); // red-right-below
    arc(w2x,-w2y,   2*rho2,2*rho2,   -a+PI/2-b2,-a+PI/2);  // blue-right-below
    
    arc(w1x,-w1y,   2*rho1,2*rho1,    PI/2-a,PI/2-a+b1); // blue-left-below
    arc(0,0,        2*R1,2*R1,        PI,3*PI/2+b1-a); // red-left-below   
    
    line(s1x,-s1y,s2x,-s2y); // green-below

    strokeWeight(0.005);        
    line(0.0, 0.0, d, 0.0);   
  }
}

void drawConnectingRod(float r1, float r2, float R1, float R2, float rho1, float rho2, float p1[], float p2[], boolean filled){
  float dx = p2[0]-p1[0];
  float dy = p2[1]-p1[1];
  float angle = atan2(dy,dx);
  float d = sqrt(dx*dx+dy*dy);
  
  pushMatrix();
  translate(p1[0],p1[1]);
  rotate(angle);
  drawConnectingRodx( r1, r2, R1, R2, rho1, rho2, d, filled);
  popMatrix();
}

void draw(){
  
  translate(width/2, height/2);
  scale(width/2/2, -height/2/2);
  
  background(120,120,200);
  strokeWeight(0.05);
  strokeCap(ROUND);
  strokeJoin(ROUND);

  stroke(255,120,127); 

  // increment current input crank angle
  theta += dtheta;
  
  // set input pivot~point
  IP[0] = a*cos(theta);
  IP[1] = a*sin(theta);
  
  // set output ground pivot~point (constant)
  GP2[0] = d;
  GP2[1] = 0;
  
  // compute the distance between the input pivot and output ground pivot
  float D = dist(IP[0],IP[1],GP2[0],GP2[1]);
  
  // compute local normalized coordinates that describe the point having distances 
  // b and c to input pivot and output ground pivot 
  float[] alphabeta = ab(b,c,D); 
  // compute the two alternates for output pivot
  // alternate 1
  OP1[0] = IP[0] + alphabeta[0]*(GP2[0]-IP[0])+alphabeta[1]*(-(GP2[1]-IP[1]));
  OP1[1] = IP[1] + alphabeta[0]*(GP2[1]-IP[1])+alphabeta[1]*(+(GP2[0]-IP[0]));
  // alternate 2
  OP2[0] = IP[0] + alphabeta[0]*(GP2[0]-IP[0])-alphabeta[1]*(-(GP2[1]-IP[1]));
  OP2[1] = IP[1] + alphabeta[0]*(GP2[1]-IP[1])-alphabeta[1]*(+(GP2[0]-IP[0]));
  
  translate(-0.5,-0.95);
  
  stroke(200,50,50);
  drawConnectingRod(0.1, 0.2, 0.2, 0.3, 0.2, 0.2, GP1, IP,false);
  stroke(50,200,250);
  drawConnectingRod(0.1, 0.2, 0.2, 0.3, 0.2, 0.2, IP , OP1,false);
  stroke(50,50,200);
  drawConnectingRod(0.1, 0.2, 0.2, 0.3, 0.2, 0.2, OP1, GP2,false);
  
  if(pdfOutput){
    pdf.nextPage();
  }
   
}

void keyPressed(){
  if (key=='q') {
    if(pdfOutput){
      endRecord();
    }
    exit();
  }
}
