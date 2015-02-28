
face a;

float faceControl=0;

void setup(){
  size(1024,768);
  a=new face(384);
  rectMode(CENTER);
}
  
void draw(){
  background(0);
  faceControl=mouseX;
  
  a.update(faceControl);
  a.display();
  
}

class face{
 float x;
 float y;
 float squaresize=20;
 float eyesize1=51;
 float eyesize2=80;
 float eyesize3=51;
 float nosesize1=15;
 float nosesize2=17;
 float easing=0.05;
 float redsize=10;
 float angle;
 
 face(float tempx){
   x=tempx;
 }
 
 void update(float m){
   float targetx=map(m,0,width,0,100);
   float targety=map(m,0,width,0,100);
   float targetsquaresize=map(m,0,width,100,150);
   squaresize += (targetsquaresize-squaresize)*easing;
   float targeteyesize1=map(m,0,width,30,140);
   eyesize1 += (targeteyesize1-eyesize1)*easing;
   float targeteyesize2=map(m,0,width,60,140);
   eyesize2 += (targeteyesize2-eyesize2)*easing;
   float targeteyesize3=map(m,0,width,20,100);
   eyesize3 += (targeteyesize3-eyesize3)*easing;
   float targetnosesize1=map(m,0,width,10,20);
   nosesize1 += (targetnosesize1-nosesize1)*easing;
   float targetnosesize2=map(m,0,width,10,50);
   nosesize2 += (targetnosesize2-nosesize2)*easing;
   float targetredsize=map(mouseY,0,width,0,150);
   redsize +=(targetredsize-redsize)*easing;
   float angle = map(m,0,width,0,360);
 }
  
  void display(){
  colorMode(RGB);
  translate(260,0);
  stroke(255);
  noFill();
  strokeWeight(6+mouseY/22);
  arc(85,170-mouseY/10,170,170, HALF_PI+PI, TWO_PI);
  arc(340,170-mouseY/10,170,170,PI,PI+HALF_PI);
  fill(34,mouseX,mouseY,60);
  strokeWeight(4);
  ellipse(85,85-mouseY/10,mouseY/10,mouseY/10);
  ellipse(340,85-mouseY/10,mouseY/10,mouseY/10);   
  pushMatrix();
  translate(85,170);
  rotate(radians(mouseX));
  rect(0,0,squaresize,squaresize);
  noStroke();
  fill(12,mouseX,mouseY,5);
  rect(0,0,squaresize*1.5,squaresize*1.5);
  popMatrix();
  pushMatrix();
  translate(340,170);
  stroke(255);
  fill(34,mouseX,mouseY,60);
  rotate(radians(mouseX));
  rect(0,0,squaresize,squaresize);
  noStroke();
  fill(mouseX,mouseX,mouseY,20);
  rect(0,0,squaresize*1.5,squaresize*1.5);
  popMatrix();//eyebrow
  
  stroke(255);
  fill(34,mouseX,mouseY,60);
  line(85,170,340,170);
  ellipse(85,170,eyesize2,eyesize2);//big
  ellipse(340,170,eyesize2,eyesize2);//big
  ellipse(85,170,eyesize1,eyesize1-20);//middle
  ellipse(340,170,eyesize1,eyesize1-20);//middle
  noStroke();
  fill(0);
  ellipse(85,170,eyesize3,eyesize3);//small
  ellipse(340,170,eyesize3,eyesize3);//small  
  fill(255);
  ellipse(55+eyesize3/1.7,180,8,8);//eye
  ellipse(370-eyesize3/1.7,180,8,8);//eye
  
  stroke(255);
  line(170,170,170-mouseX/8,382.5-mouseY/10);
  line(255,170,255+mouseX/8,382.5-mouseY/10);
  ellipse(170-mouseX/8,382.5-mouseY/10,nosesize2,nosesize2);
  ellipse(255+mouseX/8,382.5-mouseY/10,nosesize2,nosesize2);
  ellipse(170-mouseX/8,382.5-mouseY/10,nosesize1,nosesize1);
  ellipse(255+mouseX/8,382.5-mouseY/10,nosesize1,nosesize1);   //nose

  colorMode(HSB);
  stroke(0,mouseX,30+mouseY);
  strokeWeight(2+nosesize1);
  line(127.5-mouseX/6,467.5-mouseY/10,212.5,467.5);
  line(297.5+mouseX/6,467.5-mouseY/10,212.5,467.6);
  line(127.5-mouseX/6,467.5-mouseY/10,297.5+mouseX/6,467.5-mouseY/10);
//  arc(212.5,467.5,170,119,PI, TWO_PI);
  stroke(255);
  strokeWeight(4);
  ellipse(127.5-mouseX/6,467.5-mouseY/10,25.5,25.5);
  ellipse(297.5+mouseX/6,467.5-mouseY/10,25.5,25.5);  //mouth
  
  
  line(212.5,68,212.5,552.5);
  ellipse(212.5,552.5,34,34);  //jaw
  
  noStroke();
  fill(338,97,mouseY,50);
  ellipse(107.5-redsize/2,300,redsize/2,redsize/2);
  ellipse(317.5+redsize/2,300,redsize/2,redsize/2);
  ellipse(107.5-redsize/2,300,redsize,redsize);
  ellipse(317.5+redsize/2,300,redsize,redsize); //facered
  
  fill(34,mouseX,mouseY,60);
  stroke(255);
  strokeWeight(1);
  line(mouseX-260,mouseY,85,85-mouseY/10);//control 
  line(mouseX-260,mouseY,340,85-mouseY/10);//control
  line(mouseX-260,mouseY,170-mouseX/8,382.5-mouseY/10);//control nose
  line(mouseX-260,mouseY,255+mouseX/8,382.5-mouseY/10);//control nose
  line(mouseX-260,mouseY,127.5-mouseX/6,467.5-mouseY/10);//control mouth
  line(mouseX-260,mouseY,297.5+mouseX/6,467.5-mouseY/10);//control mouth
  
  }
}
