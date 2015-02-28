
boolean   bool1=true, bool2=true, bool3=true, bool4 = true, bool5=true, bool6=true, bool7=true, bool8=true, bool9=true, bool10=true, bool11=true, bool12=true, bool13=true, bool14=true, bool15=true, bool16=true, bool17=true, bool18=true, bool19=true, bool20=true;
int buttL, buttR, buttW;
int buttT, buttB, buttH;
float x, y, x1, y1, x2, y2;

float d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20;
//------------------------------------
void setup() {
  size(680, 600);
  buttT = buttL = 50;
  buttH = buttW = 100;
  buttR = buttL + buttW;
  buttB = buttT + buttH;
  smooth();
  noStroke();
}


void mousePressed() {
  //circle1
  d1=dist(60, 150, mouseX, mouseY);
  if ((d1<=buttW/2)&&(bool1=bool1)) {
    fill(0);
    bool1 = !bool1;
  }
  else if ((d1<=buttW/2)&&(bool1=!bool1)) {
    fill(255);
    bool1=bool1;
  }
  //circle2
  d2=dist(200, 150, mouseX, mouseY);
  if ((d2<=buttW/2)&&(bool2=bool2)) {
    fill(0);
    bool2 = !bool2;
  }
  //circle6
  d6=dist(60, 450, mouseX, mouseY);
  if ((d6<=buttW/2)&&(bool6=bool6)) {
    fill(255);
    bool6 =! bool6;
  }
  else if ((d6<=buttW/2)&&(bool6=!bool6)) {
    fill(0);
    bool6=bool6;
  }
  //circle7
  d7=dist(200, 450, mouseX, mouseY);
  if ((d7<=buttW/2)&&(bool7=bool7)) {
    fill(0);
    bool7 = !bool7;
  }
  //arrows1
  d11=dist(60, 150, mouseX, mouseY);
  if ((d11<=buttW/2)&&(bool11=bool11)) {
    fill(0);
    bool11 = !bool11;
  }
  else if ((d11<=buttW/2)&&(bool11=!bool11)) {
    fill(255);
    bool11=bool11;
  }
  //arrows2
  d12=dist(200, 150, mouseX, mouseY);
  if ((d12<=buttW/2)&&(bool12=bool12)) {
    fill(0);
    bool12 = !bool12;
  }
  //arrows6
  d16=dist(60, 450, mouseX, mouseY);
  if ((d16<=buttW/2)&&(bool16=bool16)) {
    fill(0);
    bool16 = !bool16;
  }
  else if ((d16<=buttW/2)&&(bool16=!bool16)) {
    fill(255);
    bool16=bool16;
  }
   //arrows7
  d17=dist(200, 450, mouseX, mouseY);
  if ((d17<=buttW/2)&&(bool17=bool17)) {
    fill(255);
    bool17 = !bool17;
  }
}
//-------------
void mouseReleased() {
  //circle 3
  d3=dist(340, 150, mouseX, mouseY);
  if ((d3<=buttW/2)&&(bool3=bool3)) {
    fill(0);
    bool3 = !bool3;
  }
  else if ((d3<=buttW/2)&&(bool3=!bool3)) {
    fill(255);
    bool3=bool3;
  }
  //circle4
  d4=dist(480, 150, mouseX, mouseY);
  if ((d4<=buttW/2)&&(bool4=bool4)) {
    fill(0);
    bool4 = !bool4;
  }
  //circle8
  d8=dist(320, 450, mouseX, mouseY);
  if ((d8<=buttW/2)&&(bool8=bool8)) {
    fill(0);
    bool8 =! bool8;
  }
  else if ((d8<=buttW/2)&&(bool8=!bool8)) {
    fill(255);
    bool8=bool8;
  }
    //circle9
  d9=dist(480, 450, mouseX, mouseY);
  if ((d9<=buttW/2)&&(bool9=bool9)) {
    fill(0);
    bool9 = !bool9;
  }
  //arrows3
  d13=dist(340, 150, mouseX, mouseY);
  if ((d13<=buttW/2)&&(bool13=bool13)) {
    fill(0);
    bool13 = !bool13;
  }
  else if ((d13<=buttW/2)&&(bool13=!bool13)) {
    fill(255);
    bool13=bool13;
  }
  //arrows4
  d14=dist(480, 150, mouseX, mouseY);
  if ((d14<=buttW/2)&&(bool14=bool14)) {
    fill(0);
    bool14 = !bool14;
  }
   //circle 8
  d18=dist(340, 450, mouseX, mouseY);
  if ((d18<=buttW/2)&&(bool18=bool18)) {
    fill(0);
    bool18 = !bool18;
  }
  else if ((d18<=buttW/2)&&(bool18=!bool18)) {
    fill(255);
    bool18=bool18;
  }
  //arrow9
   d19=dist(480, 450, mouseX, mouseY);
  if ((d19<=buttW/2)&&(bool19=bool19)) {
    fill(0);
    bool19 = !bool19;
  }
}

//-------------
void draw() {
  //circle1
  background(128);
  color onColor1   = color(255);  
  color offColor1  = color(0, 0, 0);     
  color whatColorToUse1 = (bool1) ? offColor1 : onColor1; 
  fill (whatColorToUse1); 
  ellipse(60, 150, buttW, buttH);
  //circle2
  color onColor2   = color(255);  
  color offColor2  = color(0, 0, 0);     
  color whatColorToUse2 = (bool2) ? offColor2 : onColor2; 
  fill (whatColorToUse2); 
  ellipse(200, 150, buttW, buttH);
  //circle3
  color onColor3   = color(255);  
  color offColor3  = color(0, 0, 0);     
  color whatColorToUse3 = (bool3) ? offColor3 : onColor3; 
  fill (whatColorToUse3); 
  ellipse(340, 150, buttW, buttH);
  //circle4
  color onColor4   = color(255);  
  color offColor4  = color(0, 0, 0);     
  color whatColorToUse4 = (bool4) ? offColor4 : onColor4; 
  fill (whatColorToUse4); 
  ellipse(480, 150, buttW, buttH);
  //circle5
  d5= dist (620, 150, mouseX, mouseY);
  if ((d5<=buttW/2) & (mousePressed))
  {
    fill(255);
  }
  else
  {
    fill(0);
  }
  ellipse(620, 150, buttW, buttH);
  //circle6
  color onColor6   = color(0);  
  color offColor6  = color(255);     
  color whatColorToUse6 = (bool6) ? offColor6 : onColor6; 
  fill ( whatColorToUse6 ); 
  ellipse(60, 450, buttW, buttH);
  //circle7
  color onColor7   = color(0);  
  color offColor7  = color(255);     
  color whatColorToUse7 = (bool7) ? offColor7 : onColor7; 
  fill (whatColorToUse7); 
  ellipse(200, 450, buttW, buttH);
  //circle8
  color onColor8   = color(0);  
  color offColor8  = color(255);     
  color whatColorToUse8 = (bool8) ? offColor6 : onColor6; 
  fill ( whatColorToUse8 ); 
  ellipse(340, 450, buttW, buttH);
  //circle9
  color onColor9  = color(0);  
  color offColor9  = color(255);     
  color whatColorToUse9 = (bool9) ? offColor9 : onColor9; 
  fill ( whatColorToUse9 ); 
  ellipse(480, 450, buttW, buttH);
  //circle10
  d10= dist (620, 450, mouseX, mouseY);
  if ((d10<=buttW/2) & (mousePressed))
  {
    fill(0);
  }
  else
  {
    fill(255);
  }
  ellipse(620, 450, buttW, buttH);
  //arrows1
  color onColor11   = color(0);  
  color offColor11  = color(255);     
  color whatColorToUse11 = (bool11) ? offColor11 : onColor11; 
  fill (whatColorToUse11); 
  arrowDown(55, 130);
  arrowDown(65, 130);
  //arrows2
  color onColor12   = color(0);  
  color offColor12  = color(255);     
  color whatColorToUse12 = (bool12) ? offColor12 : onColor12; 
  fill (whatColorToUse12); 
  arrowDown(197, 130);
  //arrows3
  color onColor13   = color(0);  
  color offColor13  = color(255);     
  color whatColorToUse13 = (bool13) ? offColor13 : onColor13; 
  fill (whatColorToUse13); 
  arrowUp(335, 140);
  arrowUp(345, 140);
  //arrows4
  color onColor14   = color(0);  
  color offColor14  = color(255);     
  color whatColorToUse14 = (bool14) ? offColor14 : onColor14; 
  fill (whatColorToUse14); 
  arrowUp(480, 140);
  //arrow5
  d15= dist (620, 150, mouseX, mouseY);
  if ((d15<=buttW/2) & (mousePressed))
  {
    fill(0);
  }
  else
  {
    fill(255);
  }
  arrowUD(620, 135);
  //arrows6
  color onColor16   = color(255);  
  color offColor16  = color(0);     
  color whatColorToUse16 = (bool16) ? offColor16 : onColor16; 
  fill (whatColorToUse16); 
  arrowDown(55, 430);
  arrowDown(65, 430);
   //arrows7
  color onColor17   = color(255);  
  color offColor17  = color(0);     
  color whatColorToUse17 = (bool17) ? offColor17 : onColor17; 
  fill (whatColorToUse17); 
  arrowDown(197, 430);
    //arrows8
  color onColor18   = color(255);  
  color offColor18  = color(0);     
  color whatColorToUse18 = (bool18) ? offColor18 : onColor18; 
  fill (whatColorToUse18); 
  arrowUp(335, 440);
  arrowUp(345, 440);
   //arrows9
  color onColor19   = color(255);  
  color offColor19  = color(0);     
  color whatColorToUse19 = (bool19) ? offColor19 : onColor19; 
  fill (whatColorToUse19); 
  arrowUp(480, 440);
  //arrow10
  d20= dist (620, 450, mouseX, mouseY);
  if ((d20<=buttW/2) & (mousePressed))
  {
    fill(255);
  }
  else
  {
    fill(0);
  }
  arrowUD(620, 435);
}
void arrowUp(float x, float y) {
  rect(x, y, 5, 30);
  triangle((x-3), y, (x+2.5), (y-10), (x+8), y);
}
void arrowUD(float x1, float y1) {
  rect(x1, y1, 5, 30);
  triangle((x1-3), y1, (x1+2.5), (y1-10), (x1+8), y1);
  triangle((x1-3), (y1+30), (x1+2.5), (y1+40), (x1+8), (y1+30));
}
void arrowDown(float x2, float y2) {
  rect(x2, y2, 5, 30);
  triangle((x2-3), (y2+30), (x2+2.5), (y2+40), (x2+8), (y2+30));
}

