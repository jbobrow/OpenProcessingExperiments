

void setup() {
  size(700, 700);
 // noStroke();
background(255);


/*********BODY*********/
//Turning On Wheatley
//Chris Hong
//Processiong PUDT1203
//FEB2013

//Wheatley whole body
fill(240);
ellipse(350, 350, 400, 400);

//Wheatley first circle (Grey)
fill(150);
ellipse(350, 350, 300, 300);
fill(240);
ellipse(350, 350, 283, 283);

/*********CENTER LINES ENTIRE BODY******/
//Far Right line
line(358, 550, 358, 150);

//Far left line
fill(255);
line(348, 550, 348, 150);

//Left Shadow (1 px)
fill(255);
line(349, 550, 349, 150);

//Left Shadow 2 (1px)
fill(255);
line(350, 550, 350, 150);

//Left Shadow 3 (1px)
fill(255);
line(351, 550, 351, 150);

/***********FACE***********/
//Wheatley first circle (Grey)
fill(150);
ellipse(350, 350, 300, 300);

//Wheatley first circle (Grey)
fill(100);
ellipse(350, 350, 300, 300);
fill(0);

//These are black shadows To create depth in the face
ellipse(350, 350, 283, 283);
fill(0);
ellipse(350, 350, 282, 282);
fill(0);
ellipse(350, 350, 281, 281);
fill(240);
ellipse(350, 350, 279, 279);


//Face
fill(100);
ellipse(350, 350, 200, 200);
fill(0);
ellipse(355, 350, 200, 200);

//Line going through center of face
line(350, 490, 350, 210);

//Line going through center of face 2 (Thicker 2px)
line(351, 490, 351, 210);

/*************TOP ARMS**************/

//Arm Attachment 1 (My left)
fill(50);
rect(185, 120, 15, 120);

//Arm Attachment 1 (My right)
fill(50);
rect(500, 120, 15, 120);

//Arm Attachment 2 (My left)
fill(230);
rect(180, 120, 80, 15);

//Arm Attachment 2 (My right)
fill(230);
rect(440, 120, 80, 15);

//Arm 1 (Top)
fill(50);
rect(240, 115, 220, 25);

/***********BOTTOM ARMS************/

//Arm Attachment 1 (My left)
fill(50);
rect(185, 450, 15, 120);

//Arm Attachment 1 (My right)
fill(50);
rect(500, 450, 15, 120);

//Arm Attachment 2 (My left)
fill(230);
rect(180, 560, 80, 15);

//Arm Attachment 2 (My right)
fill(230);
rect(440, 560, 80, 15);

//Arm 1 (Top)
fill(50);
rect(240, 555, 220, 25);

/**********DETAILS*************/
//top dot
fill(80);
ellipse(247, 392, 10, 10);

//mid dot
fill(80);
ellipse(255, 411, 10, 10);

//Bottom Dot
fill(80);
ellipse(270, 426, 10, 10);


//Dot on face (For Depth)
fill(0);
ellipse(364, 465, 15, 16);

//Dot on face (like his mole)
fill(240);
ellipse(365, 465, 15, 15);
}



/**********EYE************/

void draw() {
  
/**************float for large, medium, small, higlight***********/
  float wheatleyLarge;
  wheatleyLarge = map(mouseX, 280, 740, 0, 255);
  println(wheatleyLarge);
  
  float wheatleyMedium;
  wheatleyMedium = map(mouseX, 400, 700, 0, 255);
  println(wheatleyMedium);
  
  float wheatleySmall;
  wheatleySmall = map(mouseX, 480, 740, 0, 255);
  println(wheatleySmall);
  
  float wheatleyHigh;
  wheatleyHigh = map(mouseX, 0, 440, 0, 255);
  println(wheatleyHigh);
  
//Eye (Iris) (Large)
  fill(wheatleyLarge*0,wheatleyLarge*0,wheatleyLarge);
ellipse(355, 350, 150, 150);

//Eye (Pupil 1) (Medium)
fill(wheatleyMedium*0, wheatleyMedium*0.5, wheatleyMedium);
ellipse(355, 350, 100, 100);

//Eye (Pupil 2) (Small)
  fill(wheatleySmall*0, wheatleySmall*0.5, wheatleySmall);
ellipse(355, 350, 50, 50);

//Eye (Highlight)
  fill(wheatleyHigh*0.5, wheatleyHigh*0.5, wheatleyHigh*2);
ellipse(355, 350, 10, 10);
}


