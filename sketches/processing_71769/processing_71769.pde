
//Sarah Anderson,seanders
//ems2,hw4e, variable face
//click mouse to change the face/eye/hat color and size
// borrowed from Simple beginning template for variable face
 
float eyeSize = 20; 
float faceWidth = 100; 
float faceHeight = 150; 
color colF,colE,colH;
float hatWidth=80;
float hatHeight=30;

 
void setup(){
  size(300,300); 
  colF=color(random(255),random(255),random(255));
colE=color(random(255),random(255),random(255));
colH=color(random(255),random(255),random(255));
}
 
void draw(){
  background(50);
  fill(colF);
  strokeWeight(8);
  stroke(colF);
  line(width/2,height/2,width/2,height);
  noStroke();
  ellipse (width/2, height/2, faceWidth, faceHeight); 
 
  float eyeLX = width/2 - faceWidth*0.25;
  float eyeRX = width/2 + faceWidth*0.25;
  fill(colE);
  ellipse (eyeLX, height/2, eyeSize, eyeSize); 
  ellipse (eyeRX, height/2, eyeSize, eyeSize); 
  fill(colH);
  ellipse(width/2,(height-faceHeight)/2,hatWidth,hatHeight);
}
 
void mousePressed(){
  faceWidth  = random (75,  150); 
  faceHeight = random (100, 200); 
  eyeSize    = random (10,  30); 
  colE=color(random(255),random(255),random(255));
  colF=color(random(255),random(255),random(255));
  hatWidth=random(50,150);
  hatHeight=random(30,100);
  colH= color(random(255),random(255),random(255));
  
}
