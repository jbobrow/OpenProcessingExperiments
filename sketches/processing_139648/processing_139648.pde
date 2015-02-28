
// sam groves
// sketch yo

//declare global variables
int lipSize;
int mouthSize;
int eyebrowSize;
int eyeBrowsize;
int eyeballSize;
int eyeBallsize;
int pupilSize;
int eyebroWsize;
int eyebrOwsize;
int leftEye;
int lefteYe;
int rightEar;
int leftEar;
int leftPupil;
int bangsSize;
int bangSsize;
int haiRcolor;
int hairColor;
int haircOlor;
boolean clicked =false;

//runs once
void setup(){
  size(300,300);
  background(74, 138, 231);
  noStroke();
}

void keyPressed(){
  background(74, 138, 231);
  clicked =!   clicked;
}
//runs forever
void draw(){
  
  if (clicked == false){
    lipSize = 50;
  }
  if (clicked == true){
    lipSize = 70;
  }
  if (clicked == false){
    mouthSize = 30;
  }
  if (clicked == true){
    mouthSize = 50;
  }
  if (clicked == false){
    eyebrowSize = -20;
  }
  if (clicked == true){
    eyebrowSize =-20;
  }
  if (clicked == false){
    eyeBrowsize = -60;
  }
  if (clicked == true){
    eyeBrowsize = -80;  
  }
  if (clicked == false){
    eyeballSize = 30;
  }
  if (clicked == true){
    eyeballSize= 20;
  }
  if (clicked == false){
    eyeBallsize = 25;
  }
  if (clicked == true){
    eyeBallsize = 15;
  }
  if (clicked == false){
    pupilSize = 15;
  }
  if (clicked == true){
    pupilSize= 5;
  } 
  if (clicked == false){
    eyebroWsize= 10;
  }
  if (clicked == true){
    eyebroWsize= 20;
  }
  if (clicked == false){
    eyebrOwsize= -50;
  }
  if (clicked == true){
    eyebrOwsize= -30;
  }
  if (clicked == false){
    leftEye= 30;
  }
  if (clicked == true){
    leftEye= 50;
  }
  if (clicked == false){
    lefteYe= 25;
  }
  if (clicked == true){
    lefteYe= 40; 
  }
  if (clicked == false){
    rightEar= 50;
  }
  if (clicked == true){
    rightEar= 70;
  }
  if (clicked == false){
    leftEar= 50;
  }
  if (clicked == true){
    leftEar= 80;
  }
  if (clicked == false){
    leftPupil= 15;
  }
  if (clicked == true){
    leftPupil= 25;
  }
  if (clicked == false){
    bangsSize= 160;
  }
  if (clicked == true){
    bangsSize= 200;
  }
  if (clicked == false){
    bangSsize= 60;
  }
  if (clicked == true){
    bangSsize= 80;
  }
  if (clicked == false){
    haiRcolor= 198;
  }
  if (clicked == true){
    haiRcolor= 62;
  }
  if (clicked == false){
    hairColor= 30;
  }
  if (clicked == true){
    hairColor= 237;
  }
  if (clicked == false){
    haircOlor= 8;
  }
  if (clicked == true){
    haircOlor= 217;
  }
    translate(150,150);

  //hair
  fill(haiRcolor,hairColor,haircOlor);
  ellipse(-70,0,40,200);
  ellipse(70,0,40,200);
  
  //face
  fill(229,199,156);
  ellipse(0,0,150,200);
  
  //bangs
  fill(haiRcolor,hairColor,haircOlor);
  ellipse(0,-90,bangsSize,bangSsize);
  fill(229,199,156);
  triangle(0,-60,10,-60,-10,-80);
  
  //left ear
  fill(229,199,156);
  ellipse(-70,10,leftEar,leftEar);
  
  
  //right ear
  fill(229,199,156);
  ellipse(70,10,rightEar,rightEar);
  
  //right eye
  fill(255,255,255);
  ellipse(30,-25,eyeballSize,eyeBallsize);
  fill(0,0,0);
  ellipse(25,-19,pupilSize,pupilSize);
  
  pushMatrix();
  translate(0,15);
  fill(200,167,119);
  triangle(0,-25,-10,10,10,10);
  popMatrix();
  
  //left eye
  fill(255,255,255);
  ellipse(-30,-25,leftEye,lefteYe);
  fill(0,0,0);
  ellipse(-25,-20,leftPupil,leftPupil);
  
  //lips
  fill(180,33,13);
  ellipse(0,50,lipSize,mouthSize);
  
  //right eyebrow
  fill(100,19,9);
  triangle(eyebroWsize,eyebrOwsize,50,-45,20,-60);
  
  //left eyebrow
  fill(100,19,9);
  triangle(-50,-50,-10,-50,eyebrowSize,eyeBrowsize);
}
  
  
  



