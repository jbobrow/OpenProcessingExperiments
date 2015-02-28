
PImage img;
PFont font, font2;
float x = 200;
float xb = 40;
float x2 = 31;
float x3 = 31;
float x4 = 31;
float x5 = 31;
float x6 = 31;
float x7 = 31;
float TX = 200;
float TY = 200;
float TX2 = 200;
float TY2 = 200;
float TX3 = 200;
float TY3 = 200;
float TX4 = 200;
float TY4 = 200;
float TX5 = 200;
float TY5 = 200;
float TX6 = 200;
float TY6 = 200;
float TX7 = 200;
float TY7 = 200;

void setup() {
  size(800,600);
  img = loadImage("road.JPG");
  font = loadFont("SweetLeaf-200.vlw");
  font2 = loadFont("Arial-BoldMT-100.vlw");
  image(img,0,0,800,600);
  smooth();
  noStroke();
  frameRate(6); //Speed of moving text
}

void draw() { 
  textFont(font);
  fill(0);
  image(img,0,0,800,600); 
  pushMatrix();
  translate(TX, TY);
  textSize(x);
  text("Leaves", 80, 300);
  textSize(xb);
  text("by Elsie N. Brady", 80, 340);
  popMatrix();
  textFont(font2);
  textSize(x2);
  if (x<80){   //Each if statement is a que for the next line in the poem
    x2-=0.8;
    pushMatrix();
    translate(TX2, TY2);
    text("How silently they tumble down", -30, 400);
    text("And come to rest upon the ground", -30, 425);
    popMatrix();
  } 
  textSize(x3);
  if (x2<10){ 
    x3-=0.8;
    pushMatrix();
    translate(TX3, TY3);
    text("To lay a carpet, rich and rare,", -180, 550);
    text("Beneath the trees without a care,", -180, 575);
    popMatrix();
  }
  textSize(x4);
  if (x3<10){ 
    x4-=0.8;
    pushMatrix();
    translate(TX4, TY4);
    text("Content to sleep, their work well done,", -300, 675);
    text("Colors gleaming in the sun.", -300, 700);
    popMatrix();
  }
  textSize(x5);
  if (x4<10){ 
    x5-=0.8;
    pushMatrix();
    translate(TX5, TY5);
    text("At other times, they wildly fly", -425, 800);
    text("Until they nearly reach the sky.", -425, 825);
    popMatrix();
  }
  textSize(x6);
  if (x5<10){ 
    x6-=0.8;
    pushMatrix();
    translate(TX6, TY6);
    text("Twisting, turning through the air", -575, 950);
    text("Till all the trees stand stark and bare.", -575, 975);
    popMatrix();
  }
  textSize(x7);
  if (x6<10){ 
    x7-=0.8;
    pushMatrix(); 
    translate(TX7, TY7);
    text("Exhausted, drop to earth below", -700, 1075);
    text("To wait, like children, for the snow.", -700, 1100); 
    popMatrix();
  }  
  x-=5;  //Shrink the text size as the words move
  xb-=1;
  TX+=5; //Moving each line along the path
  TY-=5;
  TX2+=5;
  TY2-=5;
  TX3+=5;
  TY3-=5;
  TX4+=5;
  TY4-=5;
  TX5+=5;
  TY5-=5;
  TX6+=5;
  TY6-=5;
  TX7+=5;
  TY7-=5;
  if (x<5){  //Ending the text after it reaches textSize(5)
    x=0;
  } 
  if (xb<5){
    xb=0;
  } 
  if (x2<5){
    x2=0;
  }
  if (x3<5){
    x3=0;
  } 
  if (x4<5){
    x4=0;
  } 
  if (x5<5){
    x5=0;
  } 
  if (x6<5){
    x6=0;
  }  
  if (x7<5){
    x7=0;
  }
}


