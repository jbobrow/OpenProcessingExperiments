
void setup() {
    size(500,500);
    smooth();
}

void draw() {
  if (mousePressed==true) {
    int dimension = (int)random(40,150);
    moodyJoe(mouseX, mouseY, dimension, dimension,1, false);
  }
}
    
//Function to make moody Joe
void moodyJoe(int px, int py, int w, int h, int emotionNumber, boolean inEmotion) {
  int x = px;
  int y = py;
  fill(253,201,142);
    //Loading Face Images
    //Angry Face
    PImage angryMouth=loadImage("angryMouth.png");
    PImage angryNose=loadImage("angryNose.png");
    PImage angryEye=loadImage("angryEye.png");
    
    //Happy Face
    PImage happyMouth=loadImage("happyMouth.png");
    PImage happyNose=loadImage("happyNose.png");
    PImage happyEye=loadImage("happyEye.png");
    
    //CalmFace
    PImage calmMouth=loadImage("calmMouth.png");
    PImage calmNose=loadImage("calmNose.png");
    PImage calmEye=loadImage("calmEye.png");
    
    //Skin Tone and Face Template
    PImage lightFace=loadImage("faceTemplateLight.png");
    PImage darkFace=loadImage("faceTemplateDark.png");
    PImage brownFace=loadImage("faceTemplateBrown.png");
    
  //Face template and color
  int faceTemplate = (int)random(1,4);
  int faceX = x-w/2;
  int faceY = y-h/2;
  if(faceTemplate == 1) image(lightFace,faceX,faceY,w,h);
  else if(faceTemplate == 2) image(darkFace,faceX,faceY,w,h);
  else if(faceTemplate == 3) image(brownFace,faceX,faceY,w,h);
    
  if(inEmotion == false) {
    emotionNumber = (int)random(1,4);
  }
  //Eye coordinates
  int eW = w/3;
  int eH = h/6;
  int elX = x-eW/2-eW/2;
  int erX = x+eW/2-eW/2;
  int eY = y-eH*2;
  //Making the eyes
  if(emotionNumber == 1) {
      image(angryEye,elX,eY,eW,eH);
      image(angryEye,erX,eY,eW,eH);
  }
  else if(emotionNumber == 2) {
      image(happyEye,elX,eY,eW,eH);
      image(happyEye,erX,eY,eW,eH);
  }
  else {
      image(calmEye,elX,eY,eW,eH);
      image(calmEye,erX,eY,eW,eH);
  }
  
  if(inEmotion == false) {
    emotionNumber = (int)random(1,4);
  }
  //Mouth Coordinates
  int mW = w/2;
  int mH = h/5;
  int mX = x-mW/2;
  int mY = y+h/5;
  //Making the mouth
  if(emotionNumber == 1) image(angryMouth,mX,mY,mW,mH);
  else if(emotionNumber == 2) image(happyMouth,mX,mY,mW,mH);
  else image(calmMouth,mX,mY,mW,mH);
  
  if(inEmotion == false) {
    emotionNumber = (int)random(1,4);
  }
  //Nose Coordinates
  int nW = w/3;
  int nH = h/4;
  int nX = x-nW/2;
  int nY = y-nH/2;
  //Making the mouth
  if(emotionNumber == 1) image(angryNose,nX,nY,nW,nH);
  else if (emotionNumber == 2) image(happyNose,nX,nY,nW,nH);
  else image(calmNose,nX,nY,nW,nH);
}

