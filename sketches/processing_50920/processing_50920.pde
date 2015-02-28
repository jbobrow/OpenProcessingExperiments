
color[] palette=new color[4];
int eyeRX;
int eyeLX;
int eyeY;
int irisSize;
int mouseDistR;
int mouseDistL;
int eyeBoundUp=145;
int eyeBoundDown=262;
int irisClick=5;
float trackRightx;
float trackRighty;
float trackLeftx;
float trackLefty;
float eyebrowPos;

boolean mouseClick=false;

void setup(){
  frameRate(60);
  smooth();
  
  palette[0]=color(0,0,0);
  palette[1]=color(200,0,0);
  palette[2]=color(0,0,150);
  palette[3]=color(100,100,100);
  
  size(750,500);
 
  eyeRX=int(width*.75);
  eyeLX=width/4;
  eyeY=height/2;
  irisSize=80;
}

void mouseClicked() {
  mouseClick=true;
  
  //eyebrows
    eyebrowPos=map(mouseY, 0, height, -86,40);
  //right eye x
    trackRightx=map(mouseX, 0, width, 528+irisSize/2, 663-irisSize/2);
    //left eye x
    trackLeftx=map(mouseX, 0, width, 50+eyeLX-irisSize/2, 219-eyeLX+irisSize/2);
     //right eye y
    trackRighty=map(mouseY, 0, height, eyeBoundUp+irisSize/2, eyeBoundDown-irisSize/2);
     //left eye y
    trackLefty=map(mouseY, 0, height, eyeBoundUp+irisSize/2, eyeBoundDown-irisSize/2);
    
    palette[2]=color(150,0,0);
    
    mouseDistR=int(dist(mouseX, mouseY, trackRightx, trackRighty));
    mouseDistL=int(dist(mouseX, mouseY, trackLeftx, trackLefty));
    
    irisSize=5;
  
}

void draw(){
  background(255);
  stroke(2);
  
  if(mouseClick){
    irisSize+=5;
    if(irisSize>100){
      mouseClick=false;
      palette[2]=color(0,0,150);
      irisSize=80;
    }
    
  }
  else{
    
    //track mouse movement
    //eyebrows
    eyebrowPos=map(mouseY, 0, height,-86,40);
    //right eye x
    trackRightx=map(mouseX, 0, width, 528+irisSize/2, 663-irisSize/2);
    
    trackLeftx=map(mouseX, 0, width, 50+eyeLX-irisSize/2, 219-eyeLX+irisSize/2);
     //right eye y
    trackRighty=map(mouseY, 0, height, eyeBoundUp+irisSize/2, eyeBoundDown-irisSize/2);
     //left eye y
    trackLefty=map(mouseY, 0, height, eyeBoundUp+irisSize/2, eyeBoundDown-irisSize/2);
  
    mouseDistR=int(dist(mouseX, mouseY, trackRightx, trackRighty));
    mouseDistL=int(dist(mouseX, mouseY, trackLeftx, trackLefty));
    
  }
   
   //rightEye, under eye lines 
   strokeWeight(3);
   noFill();
   beginShape();
   vertex(466,214);
   curveVertex(466,214);
   curveVertex(479,221);
   curveVertex(492,233);
   curveVertex(501,249);
   vertex(501,249);
   curveVertex(501,249);
   curveVertex(517,286);
   curveVertex(555,329);
   curveVertex(573,336);
   vertex(573,336);
   curveVertex(573,336);
   curveVertex(601,337);
   curveVertex(624,330);
   curveVertex(650,317);
   vertex(650,317);
   endShape();
   
   beginShape();
   vertex(466,214);
   curveVertex(466,214);
   curveVertex(501,228);
   curveVertex(510,239);
   curveVertex(526,259);
   vertex(526,259);
   curveVertex(526,259);
   curveVertex(545,273);
   curveVertex(598,294);
   curveVertex(667,273);
   vertex(667,273);
   endShape(); 
   
    //leftEye, under eye lines 
   strokeWeight(3);
   noFill();
   beginShape();
   vertex(276,214);
   curveVertex(276,214);
   curveVertex(264,221);
   curveVertex(251,233);
   curveVertex(241,249);
   vertex(241,249);
   curveVertex(241,249);
   curveVertex(225,286);
   curveVertex(203,329);
   curveVertex(188,336);
   vertex(188,336);
   curveVertex(188,336);
   curveVertex(169,337);
   curveVertex(141,330);
   curveVertex(93,317);
   vertex(93,317);
   endShape();
   
   beginShape();
   vertex(276,214);
   curveVertex(276,214);
   curveVertex(242,228);
   curveVertex(233,239);
   curveVertex(216,259);
   vertex(216,259);
   curveVertex(216,259);
   curveVertex(198,273);
   curveVertex(145,294);
   curveVertex(76,273);
   vertex(76,273);
   endShape(); 
   
   //right eye
   //turn reddder closer mouse is to right eye
   fill(palette[1],100-(mouseDistR/10));
   
   strokeWeight(4);
   beginShape();
   vertex(466,214);
   curveVertex(466,214);
   curveVertex(485,211);
   curveVertex(495,214);
   curveVertex(510,224);
   vertex(510,224);
   curveVertex(510,224);
   curveVertex(548,252);
   curveVertex(588,264);
   curveVertex(636,254);
   curveVertex(709,187);
   vertex(709,187);
   curveVertex(709,187);
   curveVertex(630,141);
   curveVertex(551,141);
   curveVertex(521,161);
   vertex(521,161);
   vertex(466,214);
   endShape(CLOSE); 
   
    //left eye
    //turn red closer mouse is to left eye
   fill(palette[1],100-(mouseDistL/10));
   
   beginShape();
   vertex(276,214);
   curveVertex(276,214);
   curveVertex(257,211);
   curveVertex(247,214);
   curveVertex(232,224);
   vertex(232,224);
   curveVertex(232,224);
   curveVertex(194,252);
   curveVertex(154,264);
   curveVertex(107,254);
   curveVertex(66,225);
   curveVertex(34,187);
   vertex(34,187);
   curveVertex(34,187);
   curveVertex(113,141);
   curveVertex(192,141);
   curveVertex(221,161);
   vertex(221,161);
   vertex(276,214);
   endShape(CLOSE); 
   
    //Iris
    fill(palette[2]);
    //left
    ellipse(trackLeftx, trackLefty, irisSize-(mouseDistL/10), irisSize-(mouseDistL/10));
    //right
    ellipse(trackRightx, trackRighty, irisSize-(mouseDistR/10), irisSize-(mouseDistR/10));
    
    //Pupil
    fill(palette[0]);
    //left
    ellipse(trackLeftx, trackLefty, irisSize/2-(mouseDistL/10), irisSize/2-(mouseDistL/10));
    //right
    ellipse(trackRightx, trackRighty, irisSize/2-(mouseDistR/10), irisSize/2-(mouseDistR/10));
    
    //Pupil
    noStroke();
    fill(255);
    //left
    ellipse(trackLeftx+10, trackLefty-10, irisSize/4, irisSize/8);
    //right
    ellipse(trackRightx+10, trackRighty-10, irisSize/4, irisSize/8);
    
    pushMatrix();
    translate(0,eyebrowPos);
    
    stroke(4);
    fill(0);
    //eyebrow right
   beginShape();
   vertex(436,113);
   vertex(632,50);
   vertex(740,144);
   curveVertex(740,144);
   curveVertex(643,106);
   curveVertex(551,106);
   curveVertex(436,113);
   vertex(436,113);
   endShape(CLOSE); 
    
    //eyebrow left
   beginShape();
   vertex(304,113);
   vertex(108,50);
   vertex(0,144);
   curveVertex(0,144);
   curveVertex(98,106);
   curveVertex(189,106);
   curveVertex(304,113);
   vertex(304,113);
   endShape(CLOSE); 
   
   popMatrix();
}

