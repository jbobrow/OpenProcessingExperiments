
// sam groves
// sketch yo

//declare global variables
float lipSize = 50;
float mouthSize = 30;
float leftEar = 50;
float rightEar = 50;
float pupilSize = 15;
float eyeSize = 30;
float eyEsize = 25;
float noseSize = 0;
float nosEsize = -25;
float hairColor = 198;
float haiRcolor = 30;
float haircOlor = 8;
float faceShape = 150;
float facEshape = 200;
float eyebrowSize = -50;
float eyeBrowsize = -50;
float eyebroWsize = -45;
float lipColor = 180;
float liPcolor = 33;
float lipcOlor = 13;

//runs once
void setup(){
  size(300,300);
  background(74, 138, 231);
  noStroke();
}

void keyPressed(){
 
    lipSize = random(20,45);
    mouthSize = random(20,50); 
    leftEar = random(20,50);
    rightEar = random(20,50);
    pupilSize = random(5,15);
    eyeSize = random(25,40);
    eyEsize = random(25,30);
    nosEsize = random(-30,0);
    hairColor = random(0,255);
    haiRcolor= random(0,255);
    haircOlor= random(0,255);
    faceShape = random(130,150);
    facEshape = random(180,220);
    eyebrowSize = random(-55,-40);
    eyeBrowsize = random(-55,-40);
    eyebroWsize = random(-50,-40);
    lipColor = random(0,255);
    liPcolor = random(0,255);
    lipcOlor = random(0,255);
}
//runs forever
void draw(){
  makeFace();
}
  
void makeFace(){
  background(74, 138, 231);
  translate(150,150);

  //hair
  fill(hairColor,haiRcolor,haircOlor);
  ellipse(-70,0,40,200);
  ellipse(70,0,40,200);
  
  //face
  fill(229,199,156);
  ellipse(0,0,faceShape,facEshape);
  
  //bangs
  fill(hairColor,haiRcolor,haircOlor);
  ellipse(0,-90,160,60);
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
  ellipse(30,-25,eyeSize,eyEsize);
  fill(0,0,0);
  ellipse(25,-19,pupilSize,pupilSize);
  
  //nose
  pushMatrix();
  translate(0,15);
  fill(200,167,119);
  triangle(noseSize,nosEsize,-10,10,10,10);
  popMatrix();
  
  //left eye
  fill(255,255,255);
  ellipse(-30,-25,eyeSize,eyEsize);
  fill(0,0,0);
  ellipse(-25,-20,pupilSize,pupilSize);
  
  //lips
  fill(lipColor,liPcolor,lipcOlor);
  ellipse(0,50,lipSize,mouthSize);
  
  //right eyebrow
  fill(100,19,9);
  triangle(10,eyebrowSize,50,eyebroWsize,20,-60);
  
  //left eyebrow
  fill(100,19,9);
  triangle(-50,eyebrowSize,-10,eyeBrowsize,-20,-60);
}
  
  



