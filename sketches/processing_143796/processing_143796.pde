
//Devon Nitz -  Art 348 - Processing Interactive Drawing Tool

///////////////////////
///    VARIABLES   ////
///////////////////////

int mainCircle = 60;
//int dia= random(20,100); //diameter of ellipse change
int trans= 40; //transparency 

int r1= 0; //color darker blue 
int g1= 123; //color darker blue
int b1= 218; //color darker blue

int r2=188; //color light blue
int g2=226; //color light blue
int b2=255; //color light blue


///////////////////////
///  VOID SETUP    ////
///////////////////////

void setup() {
  background(0);
  size(800,860);
}
 
 
 ///////////////////////
///      DRAW       ///
///////////////////////
 
void draw() {
 drawBorder();
 drawButtons();
fill(200);
noStroke();
ellipse(415,32,25,25);
ellipse(570,32,25,25);


if(mouseX>20 && mouseX<780 && mouseY>60 && mouseY<860) { 
if (mousePressed) { drawEllipse();} 
}

if (mouseX>270 && mouseX<435 && mouseY>0 && mouseY<60) {
shrinkEllipse();
}

if (mouseX>440 && mouseX<585 && mouseY>0 && mouseY<60) {
growEllipse();
}


if ( keyPressed && key=='=') {
  growEllipse();
}

if ( keyPressed && key=='-') {
 shrinkEllipse();
}



}



//RESET
void mouseClicked() {
if (mouseX>15 && mouseX<200 && mouseY>0 && mouseY<60) {
resetEllipse();}


//CLEARS
if (mouseX>590 && mouseX<690 && mouseY>0 && mouseY<60) {
  clearScreen();
  drawBorder();
  drawButton();
}
//SAVE
  if (mouseX>695 && mouseX<770 && mouseY>0 && mouseY<60) {
  drawBorder();
  saveDrawing();
  }
}
//KEYBOARDING FUN
void keyPressed() {
  if (key=='f') {layerFade();}     // F for Fade Layer
  if (key=='s') {drawBorder(); saveDrawing();} // S key for Save
  if (key==' ') {clearScreen();}   //Clear Screen Spacebar
  if (key=='r') {resetEllipse();} //Resets to orginal size
  if (key=='c') {colorColor();} //C is for color change
}



///////////////////////
// CUSTOM FUCNTIONS ///
///////////////////////


void clearScreen(){
   background(0);} //clear background function
   
void layerFade(){ 
  noStroke();
  fill(15,15,15,30);
  rect(0,0,800,800);
} //layer fade function


void drawEllipse() {
  float x= random(2,30);
  float y= random(2,30);
      noFill();
      stroke(r1,g1,b1,trans);
ellipse (mouseX, mouseY, mainCircle, mainCircle);
      stroke(r2,g2,b2,trans);
ellipse (mouseY, mouseX, mainCircle, mainCircle);
}  //draw the ellipses and symmetry function


void growEllipse() {
mainCircle++;
}

void shrinkEllipse() { 
mainCircle--;

}

void resetEllipse() {
mainCircle=70;
}


void drawBorder() {
 fill(0);
 noStroke();
  rect(0, 0, width, 60);
}

void drawButtons() {
  textSize(21);
  fill(65, 188, 251);
  text("INTERACTIVE BLUE", 20, 38);
   
  textSize(12);
  fill(190);
  text(" Press to to make small", 270, 38);
  
  textSize(12);
  fill(190);
  text(" Press to make grow", 440, 38);
   
  textSize(16);
  fill(150, 217, 252);
  text("CLEAR", 610, 38);
  
  textSize(16);
  fill(150, 217, 252);
  text("SAVE", 710, 38);
}

void saveDrawing() {
saveFrame("images/Microscope_###.png");
} //Save function




