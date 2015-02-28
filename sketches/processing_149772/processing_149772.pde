
int toggle = 0;
int numImages = 2;  
PImage[] myImages = new PImage[numImages];


float timer = 0.00;
float x= 0;

 
 
void setup()
{
  size(800,600);
  cursor(HAND);
  myImages[0] = loadImage ("hamster.jpg");
  myImages[1] = loadImage ("hamster2.jpg");
}


 
void draw()
{
  background(0);
  x= x + 1;
  timer = timer + (1.0/30);
  
   image(myImages[toggle%numImages], 0, 0);
  
 
  fill(#FAB1F9);
  textSize(32);
  text("Adorable",(510 - x),150);
     
  fill(#93E4F7);
  textSize(24);
  text("Tiny",(530-x), 250);
 
  fill(#FAB1F9);
  textSize(18);
  text("Fuzzy", (570 - x), 450);
   
  fill(#93E4F7);
  textSize(18);
  text("EatsCarrots", (600 - x), 50);
   
  fill(#FAB1F9);
  textSize(52);
  text("SQUEE", (700 - x), 250);
   
  fill(#93E4F7);
  textSize(42);
  text("Pudgy", (800 - x), 375);
   
  fill(#FAB1F9);
  textSize(26);
  text("Widdle", (900 - x), 150);
   
  fill(#93E4F7);
  textSize(23);
  text("BigEyes", (875 - x), 75);
   
  fill(#FF0000);
  textSize(34);
  text("OW", (925 - x), 200);
   
  fill(#93E4F7);
  textSize(29);
  text("AAWW", (670 - x), 350);
   
  fill(#AD0202);
  textSize(52);
  text("911", (950 - x), 470);
   
  fill(#FF0000);
  textSize(25);
  text("MEDIC", (930 - x), 275);

  

  fill(#FF0000);
  textSize(52);
  text("OUCH", (1000 - x), 150);
  
  fill(#AD0202);
  textSize(24);
  text("THATHURT",(1050-x), 250);
 
  fill(#FF0000);
  textSize(18);
  text("JERK", (1090 - x), 450);
   
  
}


void mousePressed() {
  toggle++;
}



