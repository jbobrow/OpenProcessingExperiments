
PImage bdown;
PImage bup;
PImage wdown;
PImage wup;

boolean buttOff, buttOffA, buttOffB, buttOffC;
boolean buttStick, buttStickA, buttStickB, buttStickC;
int buttL, buttR, buttW;
int buttT, buttB, buttH;

void setup() {
  size (650, 300);
  buttOff = true;
  buttOffA = true;
  buttOffB = true;
  buttOffC = true;
  buttStick = true;
  buttStickA = true;
  buttStickB = true;
  buttStickC = true;
  buttT = buttL = 25;
  buttH = buttW = 100;
  buttR = buttL + buttW;
  buttB = buttT + buttH;

  bdown = loadImage ("bdownarrow.png");
  bup = loadImage ("buparrow.png");
  wdown = loadImage ("wdownarrow.png");
  wup = loadImage ("wuparrow.png");
}

//------------------------------------
void mousePressed() {

  //middle
  if ( (mouseX > buttL+125) && (mouseX < buttR+125)  && (mouseY > (buttT+150)) && (mouseY < buttB+150)) {
    buttOff = !buttOff;
  } 
  if ( (mouseX > buttL+250) && (mouseX < buttR+250)  && (mouseY > buttT+150) && (mouseY < buttB+150)) {
    buttOffC = !buttOffC;
  }  

  //rightmost
  if ((mouseX > buttL+375) && (mouseX < buttR+375)  && (mouseY > buttT+150) && (mouseY < buttB+150)) {
    buttStickA =false;
  }  
  if ((mouseX > buttL+500) && (mouseX < buttR+500)  && (mouseY > buttT+150) && (mouseY < buttB+150)) {
    buttStickC = false;
  }
}

//--------------------------------
void mouseReleased() {

  //middle
  if ((mouseX > buttL+125) && (mouseX < buttR+125)  && (mouseY > buttT) && (mouseY < buttB)) {
    buttOffA = !buttOffA;
  } 
  if ((mouseX > buttL+250) && (mouseX < buttR+250)  && (mouseY > buttT) && (mouseY < buttB) ) {
    buttOffB = ! buttOffB;
  }
  
  //rightmost  
    if ((mouseX > buttL+375) && (mouseX < buttR+375)  && (mouseY > buttT) && (mouseY < buttB)) {
    buttStick = false;
  }
  if ((mouseX > buttL+500) && (mouseX < buttR+500)  && (mouseY > buttT) && (mouseY < buttB)) {
    buttStickB = false;
  }
}

//------------------------------------
void draw() {
  noStroke();
  background(128);
  color onColor   = color(255); 
  color offColor  = color(0); 
  color whatColorToUse = (buttOff) ? onColor : offColor; 
  color whatColorToUseA = (buttOffA) ? offColor : onColor; 
  color whatColorToUseB = (buttOffB) ? onColor : offColor;  
  color whatColorToUseC = (buttOffC) ? offColor : onColor;  
  color whatColorToUseD = (buttStick) ? offColor : onColor;  
  color whatColorToUseE = (buttStickA) ? onColor : offColor;
  color whatColorToUseF = (buttStickB) ? onColor : offColor;  
  color whatColorToUseG = (buttStickC) ? offColor : onColor;  

  //--------------------left---------------
  if (mousePressed == true && (mouseX > buttL) && (mouseX < buttR)  && 
    (mouseY > buttT) && (mouseY < buttB)) {
    fill (255);
  } 
  else {
    fill (0);
  }
  rect(buttL, buttT, buttW, buttH); 
  if (mousePressed == true && (mouseX > buttL) && (mouseX < buttR)  && 
    (mouseY > (buttT+150)) && (mouseY < buttB+150)) {
    fill (0);
  } 
  else {
    fill (255);
  }
  rect(buttL, buttT+150, buttW, buttH); 

  //--------------middle---------------------------
  fill (whatColorToUseA);
  rect(buttL+125, buttT, buttW, buttH); 
  fill (whatColorToUse);
  rect(buttL+125, buttT+150, buttW, buttH); 
  //-----------------------------------------
  fill ( whatColorToUseC );
  rect(buttL+250, buttT+150, buttW, buttH); 
  fill ( whatColorToUseB );
  rect(buttL+250, buttT, buttW, buttH); 
  
  //--------------right-------------------------
  fill ( whatColorToUseD );
  rect(buttL+375, buttT, buttW, buttH); 
  fill ( whatColorToUseE );
  rect(buttL+375, buttT+150, buttW, buttH); 
  //-----------------------------------------
   fill ( whatColorToUseF);
  rect(buttL+500, buttT, buttW, buttH);
  fill (whatColorToUseG);
  rect(buttL+500, buttT+150, buttW, buttH); 


  //----------------arrows----------
  //top row
  image (wup, 63, 63);
  image (wdown, 65, 66);

  image (bdown, 308, 63);
  image (bdown, 320, 63);

  image (wdown, 183, 63);
  image (wdown, 195, 63);

  image (wdown, 438, 63);

  image (bdown, 565, 63);

  //bottom row
  image (bup, 63, 215);
  image (bdown, 65, 217);

  image (wup, 308, 215);
  image (wup, 320, 215);

  image (bup, 183, 215);
  image (bup, 195, 215);

  image (bup, 438, 215);

  image (wup, 565, 215);
}


