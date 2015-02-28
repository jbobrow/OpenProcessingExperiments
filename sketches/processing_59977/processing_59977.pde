
void boxFace(int sizeNum, int r, int g, int b) {
   
  rotateX(theta);
   
  rotateY(theta*2);
   
  fill(r,g,b);
  pushMatrix();
  translate(5*sizeNum,5*sizeNum,0);
  box(sizeNum);
  popMatrix();
   
  //eyes
   
  fill(0);
  pushMatrix();
  translate(5*sizeNum-(sizeNum/4),5*sizeNum-(sizeNum/4),(sizeNum/2));
  box((sizeNum/4));
  popMatrix();
   
  pushMatrix();
  translate(5*sizeNum+(sizeNum/4),5*sizeNum-(sizeNum/4),(sizeNum/2));
  box((sizeNum/4));
  popMatrix();
   
}
void cursorType( int counter, PImage cursorImg0, PImage cursorImg1, PImage cursorImg2, PImage cursorImg3 ) {
   
  if( counter < 30 ) {
     
    cursor(cursorImg0, 0,0);
     
  } else if( counter >= 30 && counter < 60 ) {
     
    cursor(cursorImg1, 0,0);
     
  } else if( counter >= 60 && counter < 90 ) {
     
    cursor(cursorImg2, 0,0);
     
  } else {
     
    cursor(cursorImg3, 0,0);
     
  }
   
}void drawCrazies() {
   
  noStroke();
  pushMatrix();
  translate(mouseX,mouseY, 0);
  rotateY(random(5));
  rotateX(-0.4);
  fill(random(255),random(255),random(255));
  box(100);
  popMatrix();
   
  noFill();
  stroke(random(255),random(255),random(255));
  pushMatrix();
  translate(random(wid), mouseY, -200);
  sphere(280);
  popMatrix();
   
   
  stroke(random(255),random(255),random(255));
  noFill();
  pushMatrix();
  translate(200,300,20);
  rotateY(.5);
  rotateX(-.5);
  box(75);
  popMatrix();
   
  noFill();
  stroke(255);
  pushMatrix();
  translate(500,600,mouseY);
  rotateX(mouseX/1000);
  sphereDetail(mouseX / 50);
  sphere(50);
  popMatrix();
   
}
void drawPyramid(int t) {
   
  stroke(0);
   
  fill(255,0,0, 50);
   
  beginShape(TRIANGLES);
  vertex(-t,-t,-t);
  vertex(t,-t,-t);
  vertex(0,0,t);
   
  fill(255,255,255, 50);
  vertex(t,-t,-t);
  vertex(t,t,-t);
  vertex(0,0,t);
   
  fill(0,0,255, 50);
  vertex(t,t,-t);
  vertex(-t,t,-t);
  vertex(0,0,t);
   
  fill(0,255,0, 50);
  vertex(-t,t,-t);
  vertex(-t,-t,-t);
  vertex(0,0,t);
   
  endShape();
   
}
void drawRotateStuff(float theta) {
   
  translate(100,100,0);
   
  rotateX(theta);
  rotateY(theta);
  rotateX(theta);
  rotateY(theta);
    
  drawPyramid(50);
   
  translate(200,200,20);
   
  rotateX(0-theta);
  rotateY(0-theta);
  rotateX(0-theta);
  rotateY(0-theta);
    
  drawPyramid(10);
   
  translate(300,300,-25);
   
  rotateX(theta+random(51));
  rotateY(theta+random(51));
  rotateX(theta+random(51));
  rotateY(theta+random(51));
   
  fill(random(255),random(255),random(255),50);
  sphereDetail(int(random(10,20)));
  sphere(30);
   
  fill(random(255), 50);
  stroke(0);
  pushMatrix();
  translate(-mouseX/5,-mouseY/5,0);
  box(90);
  popMatrix();
   
}
int wid = 900;
int hght = 900;
 
int fps = 15;
 
float theta = 0.0;
float beta = 0.0;
 
int bckGrnd = 255;
 
PImage cursorImg0;
PImage cursorImg1;
PImage cursorImg2;
PImage cursorImg3;
 
int counter = 0;
 
void setup() {
   
  size(wid,hght,P3D);
  background(bckGrnd);
  lights();
  cursorImg0 = loadImage("cursorImg0.jpg");
  cursorImg1 = loadImage("cursorImg1.jpg");
  cursorImg2 = loadImage("cursorImg2.jpg");
  cursorImg3 = loadImage("cursorImg3.jpg");
  frameRate(fps);
   
   
}
 
 
void draw() {
   
  //cursorType(counter, cursorImg0, cursorImg1, cursorImg2, cursorImg3);
   
  theta += random(1);
   
  background(bckGrnd);
   
  lights();
   
  //drawCrazies();
   
  //drawRotateStuff(theta);
   
  //controlledBoxRotation(100, theta);
   
  boxFace(100,20,50,139);
   
  boxFace(50,255,255,255);
   
  boxFace(200,255,255,255);
   
  for(int i = 0; i<220; i+=10) {
     
    //for(int j = 1; j<255; j++) {
      //boxFace(i,j,0,0);
    //}
     
    boxFace(i,(int)random(256),(int)random(256),(int)random(256));
     
  }
   
  println(theta);
   
  counter++;
  if(counter > 119) {
    counter = 0;
  }
   
}



