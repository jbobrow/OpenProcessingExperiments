

///////////////////////
///    VARIABLES   ////
///////////////////////


int r= random(0.1,0.6);
int dia= random(20,100);

int r1= int(255);
int g1= int(255);
int b1= int(255);
int trans= int(40);





///////////////////////
///  VOID SETUP    ////
///////////////////////

void setup() {
  background(0);
  size(800,850);
    smooth();

}
 
 
 ///////////////////////
///      DRAW       ///
///////////////////////

 
 
 
void draw() {
  /*try to figure out the best way possible to use for devices- here is a temporary menu screen- even though I'm not a huge fan of it.//
  ///menu bar
  fill(0);
  stroke(160,160,160);
  rect(-1,800,850,50);
  ///block for day
  fill(255);
  noStroke();
  rect(10,815,25,25);

  ///block for night
  fill(150);
  rect(50,815,25,25);
  */
  
///////////////////////
/// MOUSE PRESSED  ////
///////////////////////

    if (mousePressed) {
      noFill();
      stroke(r1,g1,b1,trans);
  float x= random(2,30);
  float y= random(2,30);
ellipse (mouseX, mouseY, dia, dia);
ellipse (mouseY, mouseX, dia, dia);
    }


///////////////////////
//// KEY PRESSED  /////
///////////////////////


    if (keyPressed) {
 if (key=='s') { saveDrawing(); } 
 if (key==' ') {clearScreen();}
 
 ///TRYING TO REVERT BACK TO DAY WITH ONLY THE 'd' KEY PRESSED //
//RIGHT NOW IT ONLY WORKS WITH 'a' KEY//

 if (key=='d') {background(255); r1=0; g1=0; b1=0;}
 if (key=='a') { background(0); r1=255; g1=255; b1=255;}

// else { background(0); r1=255; g1=255; b1=255;}

dia=random(20,100);} 
}





///////////////////////
// CUSTOM FUCNTIONS ///
///////////////////////


function saveDrawing() {
saveFrame("images/Microscope-###.png"); }


void clearScreen(){
   background(0);}


