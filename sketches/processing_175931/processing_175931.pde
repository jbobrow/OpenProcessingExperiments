
//This is the part where all of the variables are defined\\
String testmessage = "Your mouse X is ";
String testmessage2 = " and your mouse Y is ";
String FirstRow = "You clicked the first row";
String SecondRow = "You Clicked the second row";
String ThirdRow = "You Clicked the third row";
String FourthRow = "You Clicked the fourth row";
int reset = 20;
boolean firstRowClicked = false;
boolean secondRowClicked = false;
boolean thirdRowClicked = false;
boolean fourthRowClicked = false;
float R = 255;
float B = 255;
float G = 255;
float Rb = 255;
float Bb = 255;
float Gb = 255;
float Rc = 255;
float Bc = 255;
float Gc = 255;
float Rd = 255;
float Bd = 255;
float Gd = 255;
float Rl = 255;
float Bl = 255;
float Gl = 255;
float BCCR = 0.003;
float RandomVariableOne = 20;
float RandomVariableTwo = 20;
float RandomVariableThree = 20;
float RandomVariableFour = 20;
//End of variable defining\\

//This part is basically void setup\\
void setup () {
size (1000,1000);
background (255);
}
//End of void setup\\

//This part is basically void draw\\
void draw () {
//Making a reset code for R,G,B\\
if (R < 0) {
  R = 0;
}

if (G < 0) {
  G = 0;
}

if (B < 0) {
  B = 0;
}
//Ending the reset code for R,G,B\\

//Making an unnoticable background change\\
background (Rl,Gl,Bl);
Rl = Rl - BCCR;
BCCR = random(0.0005, 0.02);
Bl = Bl - BCCR;
BCCR = random(0.0005, 0.02);
Gl = Gl - BCCR;
BCCR = random(0.0005, 0.02);

//Making the first row of Diamonds\\
if (firstRowClicked == true) {
RandomVariableOne = random(0, 11);
firstRowClicked = false;
RandomVariableTwo = reset;
RandomVariableThree = reset;
RandomVariableFour = reset;
}
if (RandomVariableOne >= 0 && RandomVariableOne <= 3) {
if (R < 255) {
R = R + 1;
B = B - 1;
G = G - 1;
} else {
R = R - 1;
B = B - 1;
G = G - 1;
}
}
if (RandomVariableOne >= 4 && RandomVariableOne <= 7) {
if (B < 255) {
B = B + 1;
R = R - 1;
G = G - 1;
} else {
R = R - 1;
B = B - 1;
G = G - 1;
}
}
if (RandomVariableOne >= 8 && RandomVariableOne <= 11) {
if (G < 255) {
G = G + 1;
B = B - 1;
R = R - 1;
} else {
G = G - 1;
B = B - 1;
R = R - 1;
}
}




//~A huge line of diamonds~\\
fill (R,G,B);
stroke (0);
quad (0, 120, 50, 70, 100, 120, 50, 170);
quad (60, 180, 110, 130, 160, 180, 110, 230);
quad (60, 60, 110, 10, 160, 60, 110, 110);
quad (120, 120, 170, 70, 220, 120, 170, 170);
quad (180, 180, 230, 130, 280, 180, 230, 230);
quad (180, 60, 230, 10, 280, 60, 230, 110);
quad (240, 120, 290, 70, 340, 120, 290, 170);
quad (300, 180, 350, 130, 400, 180, 350, 230);
quad (300, 60, 350, 10, 400, 60, 350, 110);
quad (360, 120, 410, 70, 460, 120, 410, 170);
quad (420, 180, 470, 130, 520, 180, 470, 230);
quad (420, 60, 470, 10, 520, 60, 470, 110);
quad (480, 120, 530, 70, 580, 120, 530, 170);
quad (540, 180, 590, 130, 640, 180, 590, 230);
quad (540, 60, 590, 10, 640, 60, 590, 110);
quad (600, 120, 650, 70, 700, 120, 650, 170);
quad (660, 180, 710, 130, 760, 180, 710, 230);
quad (660, 60, 710, 10, 760, 60, 710, 110);
quad (720, 120, 770, 70, 820, 120, 770, 170);
quad (780, 180, 830, 130, 880, 180, 830, 230);
quad (780, 60, 830, 10, 880, 60, 830, 110);
quad (840, 120, 890, 70, 940, 120, 890, 170);
quad (900, 180, 950, 130, 1000, 180, 950, 230);
quad (900, 60, 950, 10, 1000, 60, 950, 110);
//Ending the first row of Diamonds\\

//Making the second row of Diamonds\\
if (secondRowClicked == true) {
RandomVariableTwo = random(0, 11);
secondRowClicked = false;
RandomVariableOne = reset;
RandomVariableThree = reset;
RandomVariableFour = reset;
}
if (RandomVariableTwo >= 0 && RandomVariableTwo <= 3) {
if (Rb < 255) {
Rb = Rb + 1;
Bb = Bb - 1;
Gb = Gb - 1;
} else {
Rb = Rb - 1;
Bb = Bb - 1;
Gb = Gb - 1;
}
}
if (RandomVariableTwo >= 4 && RandomVariableTwo <= 7) {
if (Bb < 255) {
Bb = Bb + 1;
Rb = Rb - 1;
Gb = Gb - 1;
} else {
Rb = Rb - 1;
Bb = Bb - 1;
Gb = Gb - 1;
}
}
if (RandomVariableTwo >= 8 && RandomVariableTwo <= 11) {
if (Gb < 255) {
Gb = Gb + 1;
Bb = Bb - 1;
Rb = Rb - 1;
} else {
Gb = Gb - 1;
Bb = Bb - 1;
Rb = Rb - 1;
}
}


//~A huge line of diamonds~\\
fill(Rb,Gb,Bb);
stroke(0);
quad (-60, 300, -10, 250, 40, 300, -10, 350);
quad (0, 360, 50, 310, 100, 360, 50, 410);
quad (0, 240, 50, 190, 100, 240, 50, 290);
quad (60, 300, 110, 250, 160, 300, 110, 350);
quad (120, 360, 170, 310, 220, 360, 170, 410);
quad (120, 240, 170, 190, 220, 240, 170, 290);
quad (180, 300, 230, 250, 280, 300, 230, 350);
quad (240, 360, 290, 310, 340, 360, 290, 410);
quad (240, 240, 290, 190, 340, 240, 290, 290);
quad (300, 300, 350, 250, 400, 300, 350, 350);
quad (360, 360, 410, 310, 460, 360, 410, 410);
quad (360, 240, 410, 190, 460, 240, 410, 290);
quad (420, 300, 470, 250, 520, 300, 470, 350);
quad (480, 360, 530, 310, 580, 360, 530, 410);
quad (480, 240, 530, 190, 580, 240, 530, 290);
quad (540, 300, 590, 250, 640, 300, 590, 350);
quad (600, 360, 650, 310, 700, 360, 650, 410);
quad (600, 240, 650, 190, 700, 240, 650, 290);
quad (660, 300, 710, 250, 760, 300, 710, 350);
quad (720, 360, 770, 310, 820, 360, 770, 410);
quad (720, 240, 770, 190, 820, 240, 770, 290);
quad (780, 300, 830, 250, 880, 300, 830, 350);
quad (840, 360, 890, 310, 940, 360, 890, 410);
quad (840, 240, 890, 190, 940, 240, 890, 290);
quad (900, 300, 950, 250, 1000, 300, 950, 350);
quad (960, 360, 1010, 310, 1060, 360, 1010, 410);
quad (960, 240, 1010, 190, 1060, 240, 1010, 290);
//Ending the second row of Diamonds\\

//Making the third row of Diamonds\\
if (thirdRowClicked == true) {
RandomVariableThree = random(0, 11);
thirdRowClicked = false;
RandomVariableOne = reset;
RandomVariableTwo = reset;
RandomVariableFour = reset;
}
if (RandomVariableThree >= 0 && RandomVariableThree <= 3) {
if (Rc < 255) {
Rc = Rc + 1;
Bc = Bc - 1;
Gc = Gc - 1;
} else {
Rc = Rc - 1;
Bc = Bc - 1;
Gc = Gc - 1;
}
}
if (RandomVariableThree >= 4 && RandomVariableThree <= 7) {
if (Bc < 255) {
Bc = Bc + 1;
Rc = Rc - 1;
Gc = Gc - 1;
} else {
Rc = Rc - 1;
Bc = Bc - 1;
Gc = Gc - 1;
}
}
if (RandomVariableThree >= 8 && RandomVariableThree <= 11) {
if (Gc < 255) {
Gc = Gc + 1;
Bc = Bc - 1;
Rc = Rc - 1;
} else {
Gc = Gc - 1;
Bc = Bc - 1;
Rc = Rc - 1;
}
}




//~A huge line of diamonds~\\
fill (Rc,Gc,Bc);
stroke (0);
quad (0, 480, 50, 530, 100, 480, 50, 430);
quad (60, 540, 110, 590, 160, 540, 110, 490);
quad (60, 420, 110, 470, 160, 420, 110, 370);
quad (120, 480, 170, 530, 220, 480, 170, 430);
quad (180, 540, 230, 590, 280, 540, 230, 490);
quad (180, 420, 230, 470, 280, 420, 230, 370);
quad (240, 480, 290, 530, 340, 480, 290, 430);
quad (300, 540, 350, 590, 400, 540, 350, 490);
quad (300, 420, 350, 470, 400, 420, 350, 370);
quad (360, 480, 410, 530, 460, 480, 410, 430);
quad (420, 540, 470, 590, 520, 540, 470, 490);
quad (420, 420, 470, 470, 520, 420, 470, 370);
quad (480, 480, 530, 530, 580, 480, 530, 430);
quad (540, 540, 590, 590, 640, 540, 590, 490);
quad (540, 420, 590, 470, 640, 420, 590, 370);
quad (600, 480, 650, 530, 700, 480, 650, 430);
quad (660, 540, 710, 590, 760, 540, 710, 490);
quad (660, 420, 710, 470, 760, 420, 710, 370);
quad (720, 480, 770, 530, 820, 480, 770, 430);
quad (780, 540, 830, 590, 880, 540, 830, 490);
quad (780, 420, 830, 470, 880, 420, 830, 370);
quad (840, 480, 890, 530, 940, 480, 890, 430);
quad (900, 540, 950, 590, 1000, 540, 950, 490);
quad (900, 420, 950, 470, 1000, 420, 950, 370);
//Ending the third row of Diamonds\\

//Making the fourth row of Diamonds\\
if (fourthRowClicked == true) {
RandomVariableFour = random(0, 11);
fourthRowClicked = false;
RandomVariableOne = reset;
RandomVariableTwo = reset;
RandomVariableThree = reset;
}
if (RandomVariableFour >= 0 && RandomVariableFour <= 3) {
if (Rd < 255) {
Rd = Rd + 1;
Bd = Bd - 1;
Gd = Gd - 1;
} else {
Rd = Rd - 1;
Bd = Bd - 1;
Gd = Gd - 1;
}
}
if (RandomVariableFour >= 4 && RandomVariableFour <= 7) {
if (Bd < 255) {
Bd = Bd + 1;
Rd = Rd - 1;
Gd = Gd - 1;
} else {
Rd = Rd - 1;
Bd = Bd - 1;
Gd = Gd - 1;
}
}
if (RandomVariableFour >= 8 && RandomVariableFour <= 11) {
if (Gd < 255) {
Gd = Gd + 1;
Bd = Bd - 1;
Rd = Rd - 1;
} else {
Gd = Gd - 1;
Bd = Bd - 1;
Rd = Rd - 1;
}
}


//~A huge line of diamonds~\\
fill(Rd,Gd,Bd);
stroke(0);
quad (-60, 660, -10, 610, 40, 660, -10, 710);
quad (0, 720, 50, 670, 100, 720, 50, 770);
quad (0, 600, 50, 550, 100, 600, 50, 650);
quad (60, 660, 110, 610, 160, 660, 110, 710);
quad (120, 720, 170, 670, 220, 720, 170, 770);
quad (120, 600, 170, 550, 220, 600, 170, 650);
quad (180, 660, 230, 610, 280, 660, 230, 710);
quad (240, 720, 290, 670, 340, 720, 290, 770);
quad (240, 600, 290, 550, 340, 600, 290, 650);
quad (300, 660, 350, 610, 400, 660, 350, 710);
quad (360, 720, 410, 670, 460, 720, 410, 770);
quad (360, 600, 410, 550, 460, 600, 410, 650);
quad (420, 660, 470, 610, 520, 660, 470, 710);
quad (480, 720, 530, 670, 580, 720, 530, 770);
quad (480, 600, 530, 550, 580, 600, 530, 650);
quad (540, 660, 590, 610, 640, 660, 590, 710);
quad (600, 720, 650, 670, 700, 720, 650, 770);
quad (600, 600, 650, 550, 700, 600, 650, 650);
quad (660, 660, 710, 610, 760, 660, 710, 710);
quad (720, 720, 770, 670, 820, 720, 770, 770);
quad (720, 600, 770, 550, 820, 600, 770, 650);
quad (780, 660, 830, 610, 880, 660, 830, 710);
quad (840, 720, 890, 670, 940, 720, 890, 770);
quad (840, 600, 890, 550, 940, 600, 890, 650);
quad (900, 660, 950, 610, 1000, 660, 950, 710);
quad (960, 720, 1010, 670, 1060, 720, 1010, 770);
quad (960, 600, 1010, 550, 1060, 600, 1010, 650);
//Ending the fourth row of Diamonds\\

}
//End of void draw\\

//This part is basically void mousePressed\\
void mousePressed () {
  print(testmessage);
  println(mouseX);
  print(testmessage2);
  println(mouseY);
  
if (mouseY >= 10 && mouseY <= 230) {
  println(FirstRow);
if (firstRowClicked == false) {
firstRowClicked = true;
}
}


else if (mouseY > 230 && mouseY <= 410) {
  println(SecondRow);
if (secondRowClicked == false) {
secondRowClicked = true;
} 
}


else if (mouseY > 410 && mouseY <= 630) {
  println(ThirdRow);
if (thirdRowClicked == false) {
thirdRowClicked = true;
}
} 

else {
if (fourthRowClicked == false) {
  println(FourthRow);
fourthRowClicked = true;
} 
}

}
//End of void mousePressed part\\
