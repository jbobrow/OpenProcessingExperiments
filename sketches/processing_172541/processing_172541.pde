
/* @pjs preload="slide0.jpg, slide1.jpg, slide2.jpg, slide3.jpg,
slide4.jpg, slide5.jpg, slide6.jpg, slide7.jpg, slide8.jpg, 
slide9.jpg, slide10.jpg, slide11.jpg, slide12.jpg, slide13.jpg, 
slide14.jpg, slide15.jpg, slide16.jpg, slide17.jpg, slide18.jpg, 
slide19.jpg, slide20.jpg, slide21.jpg, slide22.jpg, slide23.jpg, 
slide24.jpg, slide25.jpg, slide26.jpg, slide27.jpg, slide28.jpg, 
slide29.jpg, slide30.jpg, slide31.jpg, slide32.jpg, slide33.jpg, 
slide34.jpg, slide35.jpg, slide36.jpg, slide37.jpg, slide38.jpg, 
slide39.jpg, slide40.jpg, slide41.jpg, slide42.jpg, slide43.jpg, 
slide44.jpg, slide45.jpg, slide46.jpg, slide47.jpg, slide48.jpg, 
slide49.jpg, slide50.jpg, slide51.jpg, slide52.jpg, slide53.jpg, 
slide54.jpg, slide55.jpg, slide56.jpg, slide57.jpg, slide58.jpg,

q1.jpg, q2.jpg, q3.jpg, q4.jpg, q5.jpg, q6.jpg, q7.jpg, q8.jpg, 
q9.jpg, q10.jpg, q11.jpg, q12.jpg, plane.png" ; */

int myState = 0;
int yesorno = 0;
int ppX = -80;
int ppY = 350;
int ppX2 = -80;
int ppY2 = 350;
PImage slide0; PImage slide1; PImage slide2; PImage slide3;
PImage slide4; PImage slide5; PImage slide6; PImage slide7;
PImage slide8; PImage slide9; PImage slide10; PImage slide11;
PImage slide12; PImage slide13; PImage slide14; PImage slide15;
PImage slide16; PImage slide17; PImage slide18; PImage slide19;
PImage slide20; PImage slide21; PImage slide22; PImage slide23;
PImage slide24; PImage slide25; PImage slide26; PImage slide27;
PImage slide28; PImage slide29; PImage slide30; PImage slide31;
PImage slide32; PImage slide33; PImage slide34; PImage slide35;
PImage slide36; PImage slide37; PImage slide38; PImage slide39;
PImage slide40; PImage slide41; PImage slide42; PImage slide43;
PImage slide44; PImage slide45; PImage slide46; PImage slide47;
PImage slide48; PImage slide49; PImage slide50; PImage slide51;
PImage slide52; PImage slide53; PImage slide54; PImage slide55;
PImage slide56; PImage slide57; PImage slide58;
PImage q1; PImage q2; PImage q3; PImage q4; PImage q5;
PImage q6; PImage q7; PImage q8; PImage q9; PImage q10; 
PImage q11; PImage q12;
PImage plane;

void setup() {
  size(600, 400);
  plane = loadImage("plane.png") ;
  slide0 = loadImage("slide0.jpg") ;
  slide1 = loadImage("slide1.jpg") ;
  slide2 = loadImage("slide2.jpg") ;
  slide3 = loadImage("slide3.jpg") ;
  slide4 = loadImage("slide4.jpg") ;
  slide5 = loadImage("slide5.jpg") ;
  slide6 = loadImage("slide6.jpg") ;
  slide7 = loadImage("slide7.jpg") ;
  slide8 = loadImage("slide8.jpg") ;
  slide9 = loadImage("slide9.jpg") ;
  slide10 = loadImage("slide10.jpg") ;
  slide11 = loadImage("slide11.jpg") ;
  slide12 = loadImage("slide12.jpg") ;
  slide13 = loadImage("slide13.jpg") ;
  slide14 = loadImage("slide14.jpg") ;
  slide15 = loadImage("slide15.jpg") ;
  slide16 = loadImage("slide16.jpg") ;
  slide17 = loadImage("slide17.jpg") ;
  slide18 = loadImage("slide18.jpg") ;
  slide19 = loadImage("slide19.jpg") ;
  slide20 = loadImage("slide20.jpg") ;
  slide21 = loadImage("slide21.jpg") ;
  slide22 = loadImage("slide22.jpg") ;
  slide23 = loadImage("slide23.jpg") ;
  slide24 = loadImage("slide24.jpg") ;
  slide25 = loadImage("slide25.jpg") ;
  slide26 = loadImage("slide26.jpg") ;
  slide27 = loadImage("slide27.jpg") ;
  slide28 = loadImage("slide28.jpg") ;
  slide29 = loadImage("slide29.jpg") ;
  slide30 = loadImage("slide30.jpg") ;
  slide31 = loadImage("slide31.jpg") ;
  slide32 = loadImage("slide32.jpg") ;
  slide33 = loadImage("slide33.jpg") ;
  slide34 = loadImage("slide34.jpg") ;
  slide35 = loadImage("slide35.jpg") ;
  slide36 = loadImage("slide36.jpg") ;
  slide37 = loadImage("slide37.jpg") ;
  slide38 = loadImage("slide38.jpg") ;
  slide39 = loadImage("slide39.jpg") ;
  slide40 = loadImage("slide40.jpg") ;
  slide41 = loadImage("slide41.jpg") ;
  slide42 = loadImage("slide42.jpg") ;
  slide43 = loadImage("slide43.jpg") ;
  slide44 = loadImage("slide44.jpg") ;
  slide45 = loadImage("slide45.jpg") ;
  slide46 = loadImage("slide46.jpg") ;
  slide47 = loadImage("slide47.jpg") ;
  slide48 = loadImage("slide48.jpg") ;
  slide49 = loadImage("slide49.jpg") ;
  slide50 = loadImage("slide50.jpg") ;
  slide51 = loadImage("slide51.jpg") ;
  slide52 = loadImage("slide52.jpg") ;
  slide53 = loadImage("slide53.jpg") ;
  slide54 = loadImage("slide54.jpg") ;
  slide55 = loadImage("slide55.jpg") ;
  slide56 = loadImage("slide56.jpg") ;
  slide57 = loadImage("slide57.jpg") ;
  slide58 = loadImage("slide58.jpg") ;
  q1 = loadImage("q1.jpg") ;
  q2 = loadImage("q2.jpg") ;
  q3 = loadImage("q3.jpg") ;
  q4 = loadImage("q4.jpg") ;
  q5 = loadImage("q5.jpg") ;
  q6 = loadImage("q6.jpg") ;
  q7 = loadImage("q7.jpg") ;
  q8 = loadImage("q8.jpg") ;
  q9 = loadImage("q9.jpg") ;
  q10 = loadImage("q10.jpg") ;
  q11 = loadImage("q11.jpg") ;
  q12 = loadImage("q12.jpg") ;
}

void draw() {
  
  //println(myState);
  
  switch(myState) {
    case 0:
    image(slide0, 0, 0);
    break;
    
    case 1:
    image(slide1, 0, 0);
    break;
    
    case 2:
    image(slide2, 0, 0);
    break;
    
    case 3:
    image(slide3, 0, 0);
    break;
    
    case 4:
    image(slide4, 0, 0);
    break;
    
    case 5:
    image(slide5, 0, 0);
    break;
    
    case 6:
    image(slide6, 0, 0);
    if (yesorno > 0) {
      image(q1, 0, 0);
    }
    yesorno--;
    break;
    
    case 7:
    image(slide7, 0, 0);
    break;
    
    case 8:
    image(slide7, 0, 0);
    break;
    
    case 9:
    image(slide8, 0, 0);
    break;
    
    case 10:
    image(slide9, 0, 0);
    break;
    
    case 11:
    image(slide10, 0, 0);
    if (yesorno > 0) {
      image(q2, 0, 0);
    }
    yesorno--;
    break;
    
    case 12:
    image(slide11, 0, 0);
    break;
    
    case 13:
    image(slide11, 0, 0);
    break;
    
    case 14:
    image(slide12, 0, 0);
    break;
    
    case 15:
    image(slide13, 0, 0);
    break;
    
    case 16:
    image(slide14, 0, 0);
    if (yesorno > 0) {
      image(q3, 0, 0);
    }
    yesorno--;
    break;
    
    case 17:
    image(slide15, 0, 0);
    break;
    
    case 18:
    image(slide15, 0, 0);
    break;
    
    case 19:
    image(slide16, 0, 0);
    break;
    
    case 20:
    image(slide17, 0, 0);
    break;
    
    case 21:
    image(slide18, 0, 0);
    if (yesorno > 0) {
      image(q4, 0, 0);
    }
    yesorno--;
    break;
    
    case 22:
    image(slide19, 0, 0);
    break;
    
    case 23:
    image(slide19, 0, 0);
    break;
    
    case 24:
    image(slide20, 0, 0);
    break;
    
    //plane
    case 25:
    image(slide21, 0, 0);
    image(plane, ppX, ppY);
    ppX=(ppX+4);
    ppY=(ppY-2);
    break;
    
    case 26:
    image(slide22, 0, 0);
    break;
    
    case 27:
    image(slide23, 0, 0);
    break;
    
    case 28:
    image(slide24, 0, 0);
    if (yesorno > 0) {
      image(q5, 0, 0);
    }
    yesorno--;
    break;
    
    case 29:
    image(slide25, 0, 0);
    break;
    
    case 30:
    image(slide25, 0, 0);
    break;
    
    case 31:
    image(slide26, 0, 0);
    break;
    
    case 32:
    image(slide27, 0, 0);
    break;
    
    case 33:
    image(slide28, 0, 0);
    if (yesorno > 0) {
      image(q6, 0, 0);
    }
    yesorno--;
    break;
    
    case 34:
    image(slide29, 0, 0);
    break;
    
    case 35:
    image(slide29, 0, 0);
    break;
    
    case 36:
    image(slide30, 0, 0);
    break;
    
    case 37:
    image(slide31, 0, 0);
    break;
    
    case 38:
    image(slide32, 0, 0);
    if (yesorno > 0) {
      image(q7, 0, 0);
    }
    yesorno--;
    break;
    
    case 39:
    image(slide33, 0, 0);
    break;
    
    case 40:
    image(slide33, 0, 0);
    break;
    
    case 41:
    image(slide34, 0, 0);
    break;
    
    case 42:
    image(slide35, 0, 0);
    break;
    
    case 43:
    image(slide36, 0, 0);
    if (yesorno > 0) {
      image(q8, 0, 0);
    }
    yesorno--;
    break;
    
    case 44:
    image(slide37, 0, 0);
    break;
    
    case 45:
    image(slide37, 0, 0);
    break;
    
    case 46:
    image(slide38, 0, 0);
    break;
    
    //plane
    case 47:
    image(slide39, 0, 0);
    image(plane, ppX2, ppY2);
    ppX2=(ppX2+4);
    ppY2=(ppY2-2);
    break;
    
    case 48:
    image(slide40, 0, 0);
    break;
    
    case 49:
    image(slide41, 0, 0);
    break;
    
    case 50:
    image(slide42, 0, 0);
    if (yesorno > 0) {
      image(q9, 0, 0);
    }
    yesorno--;
    break;
    
    case 51:
    image(slide43, 0, 0);
    break;
    
    case 52:
    image(slide43, 0, 0);
    break;
    
    case 53:
    image(slide44, 0, 0);
    break;
    
    case 54:
    image(slide45, 0, 0);
    break;
    
    case 55:
    image(slide46, 0, 0);
    if (yesorno > 0) {
      image(q10, 0, 0);
    }
    yesorno--;
    break;
    
    case 56:
    image(slide47, 0, 0);
    break;
    
    case 57:
    image(slide47, 0, 0);
    break;
    
    case 58:
    image(slide48, 0, 0);
    break;
    
    case 59:
    image(slide49, 0, 0);
    break;
    
    case 60:
    image(slide50, 0, 0);
    if (yesorno > 0) {
      image(q11, 0, 0);
    }
    yesorno--;
    break;
    
    case 61:
    image(slide51, 0, 0);
    break;
    
    case 62:
    image(slide51, 0, 0);
    break;
    
    case 63:
    image(slide52, 0, 0);
    break;
    
    case 64:
    image(slide53, 0, 0);
    break;
    
    case 65:
    image(slide54, 0, 0);
    if (yesorno > 0) {
      image(q12, 0, 0);
    }
    yesorno--;
    break;
    
    case 66:
    image(slide55, 0, 0);
    break;
    
    case 67:
    image(slide55, 0, 0);
    break;
    
    case 68:
    image(slide56, 0, 0);
    break;
    
    case 69:
    image(slide57, 0, 0);
    break;
    
    case 70:
    image(slide58, 0, 0);
    break;
  }
}

void mouseReleased() {
 
  if (myState < 6) {
  myState = (myState+1);
  }
  
  if (myState > 6 && myState < 11) {
  myState = (myState+1);
  }
  
  if (myState > 11 && myState < 16) {
  myState = (myState+1);
  }
  
  if (myState > 16 && myState < 21) {
  myState = (myState+1);
  }
  
  if (myState > 21 && myState < 28) {
  myState = (myState+1);
  }
  
  if (myState > 28 && myState < 33) {
  myState = (myState+1);
  }
  
  if (myState > 33 && myState < 38) {
  myState = (myState+1);
  }
  
  if (myState > 38 && myState < 43) {
  myState = (myState+1);
  }
  
  if (myState > 43 && myState < 50) {
  myState = (myState+1);
  }
  
  if (myState > 50 && myState < 55) {
  myState = (myState+1);
  }
  
  if (myState > 55 && myState < 60) {
  myState = (myState+1);
  }
  
  if (myState > 60 && myState < 65) {
  myState = (myState+1);
  }
  
  if (myState > 65) {
  myState = (myState+1);
  }
  
}

void mousePressed() {
  
  //1
  if (myState == 6) {
    if (mouseX >= 400 && mouseY >= 300 && mouseY <= 345) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //2
  if (myState == 11) {
    if (mouseX >= 400 && mouseY >= 250 && mouseY <= 295) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //3
  if (myState == 16) {
    if (mouseX >= 400 && mouseY >= 350 && mouseY <= 395) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //4
  if (myState == 21) {
    if (mouseX >= 400 && mouseY >= 250 && mouseY <= 295) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //5
  if (myState == 28) {
    if (mouseX >= 400 && mouseY >= 200 && mouseY <= 245) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //6
  if (myState == 33) {
    if (mouseX >= 400 && mouseY >= 350 && mouseY <= 395) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //7
  if (myState == 38) {
    if (mouseX >= 400 && mouseY >= 250 && mouseY <= 295) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //8
  if (myState == 43) {
    if (mouseX >= 400 && mouseY >= 350 && mouseY <= 395) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //9
  if (myState == 50) {
    if (mouseX >= 400 && mouseY >= 300 && mouseY <= 345) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //10
  if (myState == 55) {
    if (mouseX >= 400 && mouseY >= 200 && mouseY <= 245) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //11
  if (myState == 60) {
    if (mouseX >= 400 && mouseY >= 300 && mouseY <= 345) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
  //12
  if (myState == 65) {
    if (mouseX >= 400 && mouseY >= 250 && mouseY <= 295) {
    myState = (myState+1);
    }
    else{
      yesorno = 120;
    }
  }
  
}

/*

6, 10, 14, 18, 24, 28, 32, 36, 42, 46, 50, 54

A: (mouseX >= 400 && mouseY >= 200 && mouseY <= 245)

B: (mouseX >= 400 && mouseY >= 250 && mouseY <= 295)

C: (mouseX >= 400 && mouseY >= 300 && mouseY <= 345)

D: (mouseX >= 400 && mouseY >= 350 && mouseY <= 395)

*/


