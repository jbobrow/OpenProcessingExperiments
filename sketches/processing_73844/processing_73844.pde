
//T-Rex <3 T-Bone

PImage imgA;
PImage imgB;
PImage imgC;
int oneThird = 200;
int twoThird = 400;
import ddf.minim.*;
boolean isplayingA = false;
boolean isplayingB = false;
boolean isplayingC = false;
boolean isplayingD = false;

Minim minim;
AudioPlayer playerA;
AudioPlayer playerB;
AudioPlayer playerC;
AudioPlayer playerD;

void setup(){
  size(600, 600);
  background(0);
  smooth();
  imgA = loadImage ("background.png"); 
  imgB = loadImage ("t-rex.png");
  imgC = loadImage ("TBone.png");
  
  minim = new Minim(this);
  playerA = minim.loadFile("Roar_1.wav");
  playerB = minim.loadFile("Roar_2.wav");
  playerC = minim.loadFile("Roar_3.wav");
  playerD = minim.loadFile("happyTRex.wav");
  playerA.play();
  playerB.play();
  playerC.play(); 
  playerD.play(); 
}

void draw(){
  background(0);
  image (imgA, 0, 0);
  image (imgB, -200, 400);
  image (imgC, mouseX-30, mouseY-30);

//--- first row -----------------------------------

    if (mouseX >= twoThird && mouseY <= oneThird){
      isplayingA = false;
      isplayingB = true;
      isplayingC = false;
      isplayingD = false;
      playerB.play();
    }
    if (mouseX >= oneThird && mouseX < twoThird && mouseY <= oneThird){
      isplayingA = true;
      isplayingB = false;
      isplayingC = false;
      isplayingD = false;
    }
    if (mouseX < oneThird && mouseY <= oneThird){
      isplayingA = false;
      isplayingB = false;
      isplayingC = true;
      isplayingD = false;
    }
   
//-----second row --------------------------------
    
    if (mouseX < oneThird && mouseY >= oneThird && mouseY < twoThird){
      isplayingA = false;
      isplayingB = false;
      isplayingC = true;
      isplayingD = false;
    }
    if (mouseX  >= oneThird && mouseX < 600 && mouseY >= oneThird && mouseY < twoThird){
      isplayingA = false;
      isplayingB = false;
      isplayingC = false;
      isplayingD = false;
    }
    if (mouseX >= twoThird && mouseY >= oneThird && mouseY < twoThird){
      isplayingA = false;
      isplayingB = false;
      isplayingC = false;
      isplayingD = false;
    }
    
//TRex eats-----------------------------------------    

    if (mouseX < oneThird && mouseY >= twoThird){
      isplayingA = false;
      isplayingB = false;
      isplayingC = false;
      isplayingD = true;
      playerD.play(); 
    }
    
//--- rest of last row -----------------------------

    if (mouseX >= oneThird && mouseX < 600 && mouseY > twoThird){
      isplayingA = true;
      isplayingB = false;
      isplayingC = false;
      isplayingD = false;    
    }
    if (mouseX > twoThird && mouseY > twoThird){
      isplayingA = false;
      isplayingB = true;
      isplayingC = false;
      isplayingD = false;
    }  
//    
//    stop(isplayingA);
//    stop(isplayingB);
//    stop(isplayingC);
//    stop(isplayingD);
}

void stop(){
  if (isplayingA == true){
    playerA.play();
  }
  else{
    playerA.rewind();
    playerA.pause();
  }
  
  if (isplayingB == true){
    playerB.play();
  }
  else{
    playerB.rewind();
    playerB.pause();
  }
  
  if (isplayingC == true){
    playerC.play();
  }
  else{
    playerC.rewind();
    playerC.pause();
  }
  
  if (isplayingD == true){
    playerD.play();
  }
  else{
    playerD.rewind();
    playerD.pause();
  }
}


