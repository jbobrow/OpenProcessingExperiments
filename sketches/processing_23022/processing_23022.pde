
//sketch 6 for interactive timetable

int page = 1;

//add images

//create an image variable

PImage img1;
PImage img2;
PImage img3;

//declare button variables

//Standard button size is 240 by 80 pixels
 int bW = 240;
 int bH = 80;

//page1
//button A
 int b1Ax = 80;
 int b1Ay = 140;
 

// button B
 int b1Bx = 80;
 int b1By = 260;
 
//button C
 int b1Cx = 80;
 int b1Cy = 380;
 

//button D
 int b1Dx = 80;
 int b1Dy = 500;
 
 //page 2
 
 //List item
 
 int i2Ax = 40;
 int i2Ay = 158;
 int i2Bx = 40;
 int i2By = 198;
 int i2Cx = 40;
 int i2Cy = 238;
 int i2Dx = 40;
 int i2Dy = 278;
 
 // Standard list item size is 320 by 36 pixels
 
 int iW = 320;
 int iH = 36;

//Create a variable to store the font

PFont font;

void setup ()
{
  
  size (400, 800);
  smooth();
  
  //load the font into the font variable
  
  font = loadFont("CenturyGothic-20.vlw");
  
   //load the image into the image variable
   
   img1 = loadImage("android1.png");
   img2 = loadImage("droid2.png");
   img3 = loadImage("home.png");
   
}

void draw (){
  
//create a page

 if (page == 1){
 pageOne();
 }
  else if (page==2) {
    pageTwo();
  }
  else if (page==3) {
    pageThree();
  }
}
  
  //button logic

 boolean overButton (int x, int y, int w, int h){
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
 return true;
 }
 else {
  return false;
 }
}

void mousePressed() {
  if(page==1) {
    if (overButton (b1Ax, b1Ay, bW, bH) == true){
      page=2;}
  }
  
   if(page==1) {
    if (overButton (b1Bx, b1By, bW, bH) == true){
      page=3;}
  }
  
  if(page==2) {
    if (overButton (i2Ax, i2Ay, iW, iH) == true){
      page=1;}
  }

  if(page==3) {
    if (overButton (160, 600, 50, 60) == true){
      page=1;}
  }
}
 
  void pageOne () {
    background(0);
    
    image(img1, 150, 606);
    
    textFont(font);
    textSize(20);
    fill(255);
    text("Home", 140, 90);
    text("Button Menu Page", 110, 730);
    image(img3, 80, 50);
        
     if (overButton (b1Ax, b1Ay, bW, bH) == true) {
  fill(255);
} else {
 fill(128);
}
     rect (b1Ax, b1Ay, bW, bH);
     
     fill(0);
     text("List Page", 160, 205);
 
  if (overButton (b1Bx, b1By, bW, bH) == true) {
  fill(255);
} else {
 fill(128);
}
     rect (b1Bx, b1By, bW, bH);
     
     fill(0);
     text("Text Page", 160, 320);
     
 
  if (overButton (b1Cx, b1Cy, bW, bH) == true) {
  fill(255);
} else {
 fill(128);
}
     rect (b1Cx, b1Cy, bW, bH);
 
  if (overButton (b1Dx, b1Dy, bW, bH) == true) {
  fill(255);
} else {
 fill(128);
}
     rect (b1Dx, b1Dy, bW, bH);
}

void pageTwo(){
 background (255);
  stroke(0);
   strokeWeight(1);
 
 image(img2, 260, 20);
 
 textFont(font);
    textSize(20);
    fill(0);
    text("List Page", 40, 90);
 
 if (overButton (i2Ax, i2Ay, iW, iH) == true) {
  fill(255);
} else {
 fill(100);
}
 rect (i2Ax, i2Ay, iW, iH);
     
    fill(0);
    text("Home", 160, 184);
 
 if (overButton (i2Bx, i2By, iW, iH) == true) {
  fill(255);
} else {
 fill(100);
}
 rect (i2Bx, i2By, iW, iH);
 
 if (overButton (i2Cx, i2Cy, iW, iH) == true) {
  fill(255);
} else {
 fill(100);
}
 rect (i2Cx, i2Cy, iW, iH);
 
 if (overButton (i2Dx, i2Dy, iW, iH) == true) {
  fill(255);
} else {
 fill(100);
}
 rect (i2Dx, i2Dy, iW, iH);
 
}

void pageThree(){
 background (0);
 
 textFont(font);
       
    textSize (30);
    fill(255);
    text("Text Page", 40, 100);
    
    textFont(font);
    
    textSize (20);
    text("Sub-Header", 40, 140);
     image(img2, 260, 60);
     
     stroke(255);
     strokeWeight(5);
     line(20, 166, 380, 166);
     
     //text box
    fill(100);
    text("That’s one small step for man...text box with lots of text in it.  Filling a box on the rest of this page.  Probably brought in as a string variable or ideally through XML", 20, 200, 350, 250);
    
  if (overButton (160, 600, 50, 60) == true) {
  fill(255);
} else {
 fill(0);
}
 noStroke();
 rect (160, 600, 50, 60);
 image(img3, 160, 600, 36, 45);
 
}

