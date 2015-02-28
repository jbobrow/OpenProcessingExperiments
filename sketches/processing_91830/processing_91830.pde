
float eyesize = 30;

void setup(){
  size(600,600,P3D);
  noFill();
  background(255);
  smooth();
}
 
void draw(){
  int seconds = millis()/300;
  println(frameCount);
  background(255);
  lights();
  translate(width/2,height/2,0);
  rotateY(radians(((mouseX/(float)width)*180)-90));
  rotateX(radians(((mouseY/(float)height)*180)-90));
   
  //body
  ellipse(0,0,2,2);
  pushMatrix();
  scale(1.3,1,1);
  fill(255);
  box(50);
  popMatrix();
   
  //head
  translate(0,-75);
  //ellipse(0,0,2,2);
  pushMatrix();
  scale(2,2,1);
  //fill(185, 171, 242);
  box(50);
  popMatrix();
   
  //arm
  translate(25,90);
  //ellipse(0,0,2,2);
  pushMatrix();
  translate(15,0);
  //rotateZ(-20);
  scale(.5,.3,.5);
  box(50);
  //translate(-30,0);
  popMatrix();
   
  translate(-50,0);
  //ellipse(0,0,2,2);
  pushMatrix();
  //translate(30,0);
  translate(-15,0);
  //float rads = radians(frameCount/2);
  rotate(radians(20*sin(20/100.0)-1));
//  if (rads>90){
//  }
  //rotateZ(20);
  scale(.5,.3,.5);
  box(50);
  translate(30,0);
  popMatrix();
   
  //legs
 translate(30,20);
  //ellipse(0,0,2,2);
  pushMatrix();
  translate(15,0);
  //rotateZ(-20);
  scale(.3,.5,.5);
  box(50);
  //translate(-30,0);
  popMatrix();
   
   translate(-40,0);
  //ellipse(0,0,2,2);
  pushMatrix();
  translate(15,0);
  //rotateZ(-20);
  scale(.3,.5,.5);
  box(50);
  //translate(-30,0);
  popMatrix();
   
  //eyes
  translate(0,-120,22);
  //ellipse(0,0,2,2);
  pushMatrix();
  translate(15,0);
  //rotateZ(-20);
  scale(.3,.5,.5);
  box(eyesize);
  //translate(-30,0);
  popMatrix();
   
  translate(40,0,0);
  //ellipse(0,0,2,2);
  pushMatrix();
  translate(15,0);
  //rotateZ(-20);
  scale(.3,.5,.5);
  box(eyesize);
  //translate(-30,0);
  popMatrix();
  
   if (frameCount 0==0) {
  eyesize = 15;
  }
  if (frameCount 2==0) {
  eyesize = 30;
  }
 
}

