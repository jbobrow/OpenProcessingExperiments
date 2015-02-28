
//Hi this is Evan Batson's Mondrian Processing thing for Code Day2 homework!

//measurements
int full = 500;
int topH = 10;
int topV = 53;
int topmidV = 120;
int midV = 375;

//colors
int whiteR = 248;
int whiteG = 242;
int whiteB = 221;
int yellowR = 244;
int yellowG = 202;
int yellowB = 99;
int redR = 225;
int redG = 48;
int redB = 35;
int blueR = 34;
int blueG = 8;
int blueB = 153;

void setup () {
  size (500,500);
  background (000);
}

void draw () {
  noStroke ();
  
  //top border

  fill(whiteR, whiteG, whiteB);
  rect (0, 0, 500, topH);
  fill(yellowR, yellowG, yellowB);
  rect (308, 0, 172, topH);
  
  //right border
  
  fill(whiteR, whiteG, whiteB);
  rect (480, 0, 20, midV);
  fill(redR, redG, redB);
  rect (480, midV, 20, 175);
  
  //bottom border
  
  fill(yellowR, yellowG, yellowB);
  rect (0, 490, 60, 10); 
  fill(whiteR, whiteG, whiteB);
  rect(60, 490, 408, 10);
  fill(redR, redG, redB);
  rect(468, 495, 33, 10);
  
  //left border
  
  fill(whiteR, whiteG, whiteB);
  rect (0, 0, topH, midV);
  fill(yellowR, yellowG, yellowB);
  rect (0, midV, topH, 175);
  
  //top row
  
  fill(whiteR, whiteG, whiteB);
  rect(0, topH, 115, topV);
  translate(topH + 115, 0);
  rect(0, topH, 183, topV);
  translate(topH + 183, 0);
  fill(yellowR, yellowG, yellowB);
  rect(0, topH, 154, topV);
  
  //top mid row
  
   translate(-323, 65+topH);
   fill(whiteR, whiteG, whiteB);
   rect (0, 0, 43, 120);
   translate(43 + topH, 0);
   fill(redR, redG, redB);
   rect (0, 0, 260, 250);
   fill(yellowR, yellowG, yellowB);
   translate (260 + topH, 0);
   rect (0, 0, 153, 120);
   
   //mid top row
   
   translate (-308, 130);
   fill (whiteR, whiteG, whiteB);
   rect (0, 0, 28, 185);
   translate (308,0);
   rect (0, 0, 70, 120);
   translate (70 + topH, 0);
   rect (0, 0, 70, 120);

  //mid bottom row
 
   fill (whiteR, whiteG, whiteB);
   translate (-80, 120 + topH); 
   rect (0, 0, 150, 50);
   translate (-160, 0); 
   rect (0, 0, 150, 50);
   
   //bottom mid row
   
   translate (0, 50 + topH); 
   rect (0, 0, 150, 50);
   fill (blueR, blueG, blueB);
   translate (160, 0); 
   rect (0, 0, 150, 85);
   
   //bottom
   
   translate (-330,5);
   fill(yellowR, yellowG, yellowB);
   rect (0, 0, 50, 120);
   fill (whiteR, whiteG, whiteB);
   translate (60,50);
   rect (0, 0, 100, 60);
}
