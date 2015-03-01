
void setup() {
  size(600, 600,P3D);
  noStroke();
  
}
 
void draw() {
  background(#9AD1FA);
  fill(#F5B323);
  ellipse(100,100,100,100);
  if(mouseX>width/2){
    background(#0A1E64);
    fill(#EDF523);
    ellipse(100,100,100,100);
  }
  fill(#348E43);
  rect(0,450,600,150);
  float rad = radians(7*frameCount);
  float rad2= sin(radians(7*frameCount));
  float rad3= cos(radians(7*frameCount));
  color eye = color(#F4F528);
  float eyeheight = 2;
  translate(width/2, height/2);
 rotateY(radians(mouseX));
  //rotateX(radians(mouseY));
  //body
  pushMatrix();
  scale(1,1.7,0.7);
  fill(#F51183,200);
  box(80);
  popMatrix();
   
   
 //head
  pushMatrix();
  translate(0,-110);
  fill(#F9FCE8,200);
  sphere(30);
  pushMatrix();
  translate(-13,-10,27);
     if((sin(radians(frameCount)) > 0.99) || (sin(radians(frameCount)) <-0.99)){
    eye = color(0,200);
    eyeheight = 0.1;
    }else{
      eye = color(#0F0F0B,200);
      eyeheight = 1;
    }
  fill(eye);
  scale(1,eyeheight,1);
  box(7);
  popMatrix();
    pushMatrix();
  translate(13,-10,27);
  fill(eye);
  scale(1,eyeheight,1);
  box(7);
  popMatrix();
  popMatrix();
   
   
  //R arm
  pushMatrix();
  translate(65,-90);
  rotateX(-rad2);
  translate(0,45);
  rotateZ(radians(-20));
  pushMatrix();
  translate(0, 32);
  rotateX(-rad2+1);
  translate(0, 25);
  scale(1,2.5,1);
  fill(#F9FCE8,200);
  box(25);
  popMatrix();
  scale(1,3,1);
  box(25);
  popMatrix();
   
   
  //L arm
  pushMatrix();
  translate(-65,-90);
  rotateX(rad2);
  translate(0,45);
  rotateZ(radians(20));
  pushMatrix();
  translate(0, 32);
  rotateX(rad2+1);
  translate(0, 25);
  scale(1,3,1);
  box(25);
  popMatrix();
  scale(1,3,1);
  box(25);
  popMatrix();
   
   
  //R leg
  pushMatrix();
  translate(30,50);
 rotateX(rad2);
 rotateZ(radians(-3));
   pushMatrix();
  translate(0, 80);
  rotateX(-rad3-1);
  translate(0, 25);
  scale(1,3,1);
  box(25);
  popMatrix();
  translate(0,60);
  scale(1,3,1);
  box(25);
  popMatrix();
   
   
  //L leg
  pushMatrix();
  translate(-30,50);
 rotateX(-rad2);
 rotateZ(radians(3));
   pushMatrix();
  translate(0, 80);
  rotateX(rad3-1);
  translate(0, 25);
  scale(1,2.5,1);
  box(30);
  popMatrix();
  translate(0,60);
  scale(1,2,1);
  box(30);
  popMatrix();
 
  
}

