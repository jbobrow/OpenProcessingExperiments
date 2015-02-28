
//paddy field in summer afternoon : a smell of hometown, a smell of childhood memory, a smell of nostalgia. Do you smell that?
// Chang, Kuo-ping  department of industrial design
int div=5;
void setup(){
  size(800,500);
  frameRate(4);
  //noLoop();
}



void draw(){
  background(225);
  
  /*
  for(int k=20;k<=450;k+=2){
  wiggle_line(k,500,k-13,300,150,50,200,130);
  }
  */
  lightcircle();
  
  for(int j=-5;j<=800;j+=1){
  wiggle_line(j,500,j+13,370,90,50,80,30);
  }
  
  for(int k=-5;k<=300;k+=1){
  wiggle_line(k,500,k+10,300,130,90,150,60);
  }
  
  for(int l=450;l<=850;l+=1){
  wiggle_line(l,500,l-15,200,150,100,180,70);
  }
  
  spot(254,251,151,8,8);
  spot(255,255,150,10,10);
  spot(255,172,11,6,6);
  
  drawbird1();
  drawbird2();
  drawbird3(122,117);
  drawbird3(103,85);

}

void wiggle_line(float sx, float sy, float ex, float ey, int c1, int c2, int c3, int c4){
//draw the standard line
/*
strokeWeight(2);
stroke(0,30);
line(sx,sy,ex,ey);
*/
strokeWeight(random(3));
//
float xstep=(ex-sx)/div;
float ystep=(ey-sy)/div;
float lastx=sx;
float lasty=sy;
float y=sy;
float x=sx;
for(int i=0; i<div;i++){
  x=x+xstep;
  x=x+random(10)-5;
  y=y+ystep;
  y=y+random(20)-5;
  stroke(c1,random(c2,c3),c4);
  line(x,y,lastx,lasty);
  lastx=x;
  lasty=y;
  }
}

void lightcircle(){
 noStroke();
 for(int i=2100; i>=0; i-=10){
 //fill(225-(i/10));
 fill(210,210,210-(i/10));
 ellipse(400,0,i,i);
 }
}

void spot(int a, int b, int c, int d, int e){
 noStroke();
 fill(a,b,c);
 ellipse(random(width),500-random(300),d,e);
}

void drawbird1(){
  noStroke();
  fill(10,90);
  beginShape();
  curveVertex(221,116);
  curveVertex(221,116);
  curveVertex(204,102);
  curveVertex(189,96);
  curveVertex(188,101);
  curveVertex(202,108);
  curveVertex(212,119);
  curveVertex(212,127);
  curveVertex(217,125);
  curveVertex(226,120);
  curveVertex(235,111);
  curveVertex(249,106);
  curveVertex(248,103);
  curveVertex(235,108);
  curveVertex(235,108);
  endShape();
}

void drawbird2(){
  noStroke();
  fill(10,75);
  beginShape();
  curveVertex(184,112);
  curveVertex(184,112);
  curveVertex(175,107);
  curveVertex(165,109);
  curveVertex(167,112);
  curveVertex(181,115);
  curveVertex(184,120);
  curveVertex(187,121);
  curveVertex(188,115);
  curveVertex(204,106);
  curveVertex(193,105);
  curveVertex(193,105);
  endShape();
}

void drawbird3(int X, int Y){
  noStroke();
  fill(10,50);
  beginShape();
  curveVertex(X,Y);
  curveVertex(X,Y);
  curveVertex(X-4,Y-2);
  curveVertex(X-10,Y-1);
  curveVertex(X-2,Y+3);
  curveVertex(X-3,Y+5);
  curveVertex(X+1,Y+3);
  curveVertex(X+9,Y+4);
  curveVertex(X+5,Y-1);
  curveVertex(X+5,Y-1);
  endShape();
}


