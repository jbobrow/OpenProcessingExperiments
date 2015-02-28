
void setup() {
  size(600, 600,P3D);
  noStroke();
}

void draw() {
  background(30);
  float rad = radians(frameCount);
  float rad2= sin(radians(6*frameCount));
  float rad3= cos(radians(6*frameCount));
  color eye = color(255,255,255);
  float eyeHeight = 1;
  translate(width/2, height/2);
  rotateY(radians(-mouseX));
  rotateX(radians(-mouseY));
  //body
  pushMatrix();
  scale(1,1.7,0.7);
  fill(150,0,0,150);
  box(100);
  popMatrix();
  
  
  //head
  pushMatrix();
  translate(0,-110);
  fill(180,200);
  box(50);
  pushMatrix();
  translate(-13,-10,27);
     if((sin(radians(frameCount)) > 0.99) || (sin(radians(frameCount)) < -0.99)){
    eye = color(0,200);
    eyeHeight = 0.1;
    }else{
      eye = color(200,0,0,200);
      eyeHeight = 1;
    }
  fill(eye);
  scale(1,eyeHeight,1);
  box(5);
  popMatrix();
    pushMatrix();
  translate(13,-10,27);
  fill(eye);
  scale(1,eyeHeight,1);
  box(5);
  popMatrix();
  popMatrix();
  
  
  //Right arm
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
  fill(180,200);
  box(30);
  popMatrix();
  scale(1,2.5,1);
  box(30);
  popMatrix();
  
  
  //Left arm
  pushMatrix();
  translate(-65,-90);
  rotateX(rad2);
  translate(0,45);
  rotateZ(radians(20));
  pushMatrix();
  translate(0, 32);
  rotateX(rad2+1);
  translate(0, 25);
  scale(1,2.5,1);
  box(30);
  popMatrix();
  scale(1,2.5,1);
  box(30);
  popMatrix();
  
  
  //Right leg
  pushMatrix();
  translate(30,50);
 rotateX(rad2);
 rotateZ(radians(-3));
   pushMatrix();
  translate(0, 80);
  rotateX(-rad3-1);
  translate(0, 25);
  scale(1,2.5,1);
  box(30);
  popMatrix();
  translate(0,60);
  scale(1,2,1);
  box(30);
  popMatrix();
  
  
  //Left leg
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



