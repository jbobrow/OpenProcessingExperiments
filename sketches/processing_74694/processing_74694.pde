
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;


int d=20;
float r=0;

void setup() {
  background(255);
  size (1280, 720);
  smooth();
  noFill();
  
  minim=new Minim(this);
in=minim.getLineIn(Minim.MONO,512);  
}

void draw() {




  float m=0;
  for (int i=0;i<in.bufferSize()-1;i++){
    if (abs(in.mix.get(i))>m){
     m=abs(in.mix.get(i));
    }
  }
   
 //  pushMatrix();
 //  rectMode(CENTER);
  // translate(width/2,height/2);
//rotate(r);
//rect(0,0,m*1000,m*1000);
//popMatrix();

    pushMatrix();
//translate(width/2,height/2);
 

//scale (.25);

noFill();
   stroke(0,255,255,m*800);
 strokeWeight(5+m*10);
 
  float x1 = bezierPoint (818,818,738,640, m*10);
  float y1 = bezierPoint (360,262,182,182, m*10);
  bezier (width/2,height/2,x1-150,y1+150,x1-50,y1-50,x1,y1);
  
  float x12 = bezierPoint (640,738,818,818, m*10);
  float y12 = bezierPoint (182,182,262 ,360,m*10);
  bezier (width/2,height/2,x12-150,y12+150,x12-50,y12-50,x12,y12);
  
  float x2 = bezierPoint (818,818,738,640, m*10);
  float y2 = bezierPoint (360,458,537,537, m*10);
bezier (width/2,height/2,x2-150,y2+150,x2-50,y2-50,x2,y2);
  
   float x22 = bezierPoint (640,738,818,818, m*10);
  float y22 = bezierPoint (537,537,458,360, m*10);
 bezier (width/2,height/2,x22-150,y22+150,x22-50,y22-50,x22,y22);
  
  float x3 = bezierPoint (462,462,542,640, m*10);
  float y3 = bezierPoint (360,458,537,537, m*10);
 bezier (width/2,height/2,x3-150,y3+150,x3-50,y3-50,x3,y3);
  
  float x32 = bezierPoint (640,542,462,462, m*10);
  float y32 = bezierPoint (537,537,458,360, m*10);
  bezier (width/2,height/2,x32-150,y32+150,x32-50,y32-50,x32,y32);
  
  float x4 = bezierPoint (462,462,542,640, m*10);
  float y4 = bezierPoint (360,262,182,182, m*10);
  bezier (width/2,height/2,x4-150,y4+150,x4-50,y4-50,x4,y4);
  
  float x42 = bezierPoint (640,542,462,462, m*10);
  float y42 = bezierPoint (182,182,262,360, m*10);
  bezier (width/2,height/2,x42-150,y42+150,x42-50,y42-50,x42,y42);
  
  d=20+int(m*50);
  
  fill(0,255,255,m*1000);
   stroke(0,255,255,m*800);
 strokeWeight(5+m*10);
 
   ellipse(x1,y1, d,d);
  ellipse(x42,y42,d,d);
   ellipse(x4,y4, d,d);
     ellipse(x32,y32, d,d);
       ellipse(x3,y3, d,d);
        ellipse(x22,y22, d,d);
         ellipse(x2,y2,d,d);
         ellipse(x12,y12,d,d);
         
  
  
  popMatrix();
  
  pushMatrix();
translate(width/4,height/4);
  scale(.5);
   ellipse(x1,y1, d,d);
  ellipse(x42,y42,d,d);
   ellipse(x4,y4, d,d);
     ellipse(x32,y32, d,d);
       ellipse(x3,y3, d,d);
        ellipse(x22,y22, d,d);
         ellipse(x2,y2,d,d);
         ellipse(x12,y12,d,d);
  popMatrix();
  
  pushMatrix();
translate(-width/4,-height/4);
  scale(1.5);
   ellipse(x1,y1, d,d);
  ellipse(x42,y42,d,d);
   ellipse(x4,y4, d,d);
     ellipse(x32,y32, d,d);
       ellipse(x3,y3, d,d);
        ellipse(x22,y22, d,d);
         ellipse(x2,y2,d,d);
         ellipse(x12,y12,d,d);
  popMatrix();
  
    pushMatrix();
translate(-width/2,-height/2);
  scale(2.0);
   ellipse(x1,y1, d,d);
  ellipse(x42,y42,d,d);
   ellipse(x4,y4, d,d);
     ellipse(x32,y32, d,d);
       ellipse(x3,y3, d,d);
        ellipse(x22,y22, d,d);
         ellipse(x2,y2,d,d);
         ellipse(x12,y12,d,d);
  popMatrix();
  
    pushMatrix();
translate(-width,-height);
  scale(3.0);
   ellipse(x1,y1, d,d);
  ellipse(x42,y42,d,d);
   ellipse(x4,y4, d,d);
     ellipse(x32,y32, d,d);
       ellipse(x3,y3, d,d);
        ellipse(x22,y22, d,d);
         ellipse(x2,y2,d,d);
         ellipse(x12,y12,d,d);
  popMatrix();
  
  //r=r+.1;
pushMatrix();  
 fill(0,0,0,15);
 stroke(255);
 strokeWeight(m*10);
    ellipseMode(CENTER);
 ellipse (width/2, height/2, m*10000, m*10000);
 

    popMatrix();

 noStroke();
 fill(255,1);
 rect (0,0,1280,720);  
  
  
}


