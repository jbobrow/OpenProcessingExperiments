
float eyeWidth = 100;
float eyeHeight = 80;
float pupilWidth = 20;
float pupilHeight = 50;
float eyeTop = 160;
float leyeHeight = 240;
float reyeHeight = 360;

float mEyeWidth = 15;
float mPupilWidth = 5;

int i = 0;

boolean goRight = true;

void setup () {
  size (600, 500);
}

void draw ()  {



background (240, 128, 128);
smooth ();
stroke (205, 92, 92);
strokeWeight (80);
line (100, 0, 100, 500);
line (250, 0, 250, 500);
line (400, 0, 400, 500);
line (550, 0, 550, 500);
//wallpaper
noStroke ();
fill (105, 105, 105);
triangle (250, 100, 200, 300, 120, 70);
fill (000, 000, 000);
triangle (250, 110, 210, 290, 135, 80);
//left ear
fill (105, 105, 105);
triangle (480, 80, 400, 300, 350, 100);
fill (000, 000, 000);
triangle (465, 90, 395, 290, 340, 110);
//right ear
fill (105, 105, 105);
ellipse (width/2, 500, 300, 700);
fill (000, 000, 000);
ellipse (width/2, 480, 280, 680);
//body
fill (255, 255, 153);
ellipse (width/2, 500, 180, 700);
fill (255, 255, 255);
ellipse (width/2, 480, 160, 680);
//chest fur
fill (255, 0, 51);
ellipse (width/2, 250, 250, 220);
fill (153, 102, 0);
ellipse (width/2, 380, 70, 70);
fill (255, 204, 51);
ellipse (width/2, 375, 55, 55);
fill (153, 102, 0);
ellipse ((width/2)-15, 395, 10, 20);
ellipse ((width/2)+15, 395, 10, 20);
//collar
fill (105, 105, 105);
ellipse (width/2, 200, 300, 250);
fill (000, 000, 000);
ellipse (width/2, 195, 280, 230);
//head
fill (255, 255, 153);
ellipse (width/2, 300, 100, 80);
fill (255, 255, 255);
ellipse (width/2, 295, 80, 60);
//chin
fill (255, 255, 153);
ellipse (250, 270, 90, 80);
fill (255, 255, 255);
ellipse (250, 265, 75, 65);
stroke (105, 105, 105);
strokeWeight (5);
line (245, 250, 205, 240);
line (230, 255, 190, 255);
line (245, 260, 205, 270);
//left jowl
noStroke ();
fill (255, 255, 153);
ellipse (340, 270, 90, 80);
fill (255, 255, 255);
ellipse (340, 265, 75, 65);
strokeWeight (5);
stroke (105, 105, 105);
line (355, 250, 395, 240);
line (370, 255, 410, 255);
line (355, 260, 395, 270);

//right jowl


noStroke ();
fill (255, 192, 203);
triangle (295, 270, 260, 230, 330, 230);
fill (255, 228, 225);
triangle (295, 260, 267, 234, 324, 234);
//nose
fill (255, 255, 255);
ellipse (270, 250, 20, 20);
ellipse (320, 250, 20, 20);
//nostrils
fill (255, 255, 153);
ellipse (width/3, height, 120, 80);
fill (255, 255, 255);
ellipse (width/3, 495, 100, 60);
//foot one
fill (255, 255, 153);
ellipse (400, height, 120, 80);
fill (255, 255, 255);
ellipse (400, 495, 100, 60);
//foot two
fill (204, 255, 102);
ellipse (240, 160, 100, 80);
ellipse (360, 160, 100, 80);
//eyeballs
float mousePercentX = (mouseX/float(width));
float LpupilX = (-1*(eyeWidth/2))+(leyeHeight)+(pupilWidth/2)+(80*mousePercentX);
float pupilY = ((-1*(eyeHeight/2)+eyeTop)+(pupilHeight/2)+(30*(mouseY/float(height))));
float RpupilX = (-1*(eyeWidth/2))+(reyeHeight)+(pupilWidth/2)+(80*mousePercentX);
fill (000, 000, 000);
ellipse (LpupilX, pupilY, pupilWidth, pupilHeight);
ellipse (RpupilX, pupilY, pupilWidth, pupilHeight);
//pupil









fill (102, 51, 0);
ellipse ((mouseX)-20, (mouseY)+35, 30, 20);
ellipse ((mouseX)+20, (mouseY)+35, 30, 20);
//feet

noFill ();
stroke (102, 51, 0);
strokeWeight (5);
bezier (mouseX, (mouseY)+20, (mouseX)+90, (mouseY)-30, (mouseX)+50, (mouseY)-50, (mouseX)+60, (mouseY)-70);
//tail

fill (102, 51, 0);
noStroke ();
ellipse (mouseX, mouseY, 70, 80);
fill (153, 102, 51);
ellipse (mouseX, (mouseY)-5, 60, 70);
//body

fill (102, 51, 0);
ellipse ((mouseX)-20, (mouseY)-65, 35, 35);
fill (153, 102, 51);
ellipse ((mouseX)-20, (mouseY)-65, 25, 25);
//left ear

fill (102, 51, 0);
ellipse ((mouseX)+20, (mouseY)-65, 35, 35);
fill (153, 102, 51);
ellipse ((mouseX)+20, (mouseY)-65, 25, 25);
//right ear

fill (102, 51, 0);
ellipse (mouseX, (mouseY)-40, 60, 50);
fill (153, 102, 51);
ellipse (mouseX, (mouseY)-42, 55, 40);
//head

fill (000, 000, 000);
ellipse ((mouseX)-10, (mouseY)-45, 15, 15);
ellipse ((mouseX)+10, (mouseY)-45, 15, 15);
//eyes
float cheesePercentX = (i/float(width));
float percentDifference = cheesePercentX-mousePercentX;
if ( percentDifference  > 0.50 ) {
  percentDifference = 0.50;
} else if ( percentDifference < -0.50 ) {
  percentDifference = -0.50;
}
fill (255, 255, 255);
//ellipse ((-1*(mEyeWidth/2))+(mouseX)+(-1*(mPupilWidth/2))-5, (mouseY)-42, 5, 5);
//ellipse ((mouseX)+10, (mouseY)-42, 5, 5);
float mouseLeftEyeBegin = (((-1*10)+mouseX)+(10*(percentDifference)));
//println ("multiplier" + (15*(i/float(width))));
ellipse (mouseLeftEyeBegin, (mouseY)-42, 5, 5);

//ellipse (((mEyeWidth/2)+10)+(mouseX)+((mPupilWidth/2)-5), (mouseY)-42, 5, 5);
float mouseRightEyeBegin = (((mouseX)+10)+(10*(percentDifference)));
ellipse (mouseRightEyeBegin, (mouseY)-42, 5, 5);
//pupils

/*((-1*(mEyeWidth/2))+(mouseX)+(-1*(mPupilWidth/2))-5)+*/

//ellipse (-1*(mEyeWidth/2)+(width/2)+mPupilWidth/2, height/2, 5, 5);
//ellipse ((mEyeWidth/2)+(width/2)-mPupilWidth/2, height/2, 5, 5);

/*float mPupilX = (-1*mEyeWidth/2); //far left position
+mEyeWidth+  //width of the eye
(mPupilWidth/2)+  //width of the pupil
(15*(mouseX/float(width))))  //percent of the screen the pupil is moving in
*/

//println ( "mouseX: " + mouseX);
//println ((mouseX)+(-1)*(mEyeWidth/2)

fill (255,153, 153);
ellipse (mouseX, (mouseY)-30, 10, 5);
//nose

fill (102, 51, 0);
ellipse ((mouseX)-15, (mouseY), 20, 25);
fill (153, 102, 51);
ellipse ((mouseX)-15, (mouseY)-5, 15, 20);
//left paw

fill (102, 51, 0);
ellipse ((mouseX)+15, (mouseY), 20, 25);
fill (153, 102, 51);
ellipse ((mouseX)+15, (mouseY)-5, 15, 20);
//right paw

if ( goRight == true ) {
  i++;
  if ( i == 500 ) {
    goRight = false;
  }
} else {
  i--;
  if (i == 0) {
    goRight = true;
  }
}
//for (int i = 0; i<600; i++) {
  fill (255, 204, 51);
rect (i, 430, 100, 70);
fill (204, 153, 0);
triangle (0+i, 430, i+100, 430, i+70, 420);
fill (153, 102, 0);
ellipse (i+15, 450, 20, 17);
fill (204, 153, 00);
ellipse (i+12, 445, 17, 13);
fill (153, 102, 0);
ellipse (i+50, 480, 35, 25);
fill (204, 153, 00);
ellipse (i+45, 475, 30, 20);
fill (153, 102, 0);
ellipse (i+70, 470, 17, 15);
fill (204, 153, 00);
ellipse (i+67, 467, 14, 13);
fill (153, 102, 51);
ellipse (i+60, 425, 20, 5);
fill (204, 153, 00);
ellipse (i+60, 424, 16, 3);
//}
//cheese
}
    
