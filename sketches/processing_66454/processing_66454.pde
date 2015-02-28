
//universals

PFont myFont;
int fontPosX = 50;
int fontPosY = 265;

float counter;

//create canvas size with background colour

void setup() {
    
    size(430, 290);
    background(0);
    smooth();
    noStroke();

//import text type/see texts
    String[] fontList = PFont.list();
    println(fontList);
  
//introduce counter for smoke movement  
    counter = 1;  
  }


//import image of pipe

void draw() {

  PImage myImage = loadImage("pipe2.gif");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  smooth();


//change background colour with mouse movement
  
  background(mouseX, mouseY, mouseX);
  image(myImage, width/2, height/2);
  
  
//when mouse points at large part of pipe original french text comes up
  
  if (mouseX >= 50 && mouseX <= 135 && mouseY >= 70 && mouseY <= 210) {
      myFont = createFont("MamaeQueNosFaz", 35, true);
      textFont(myFont);
      fill(0);
      smooth();
      noStroke();
      text("ceci n'est pas une pipe.", fontPosX, fontPosY);
  }
   
   
//when mouse points at mouth of pipe crass english text comes up and smoke 
  //comes out of pipe
  
   if (mouseX >= 350 && mouseX <= 395 && mouseY >= 70 && mouseY <= 85) {
   myFont = createFont("Teenspirit", 30, true);
     textFont(myFont);
      fill(0);
      smooth();
      noStroke();
      text("that aint no smoke.", fontPosX+ 25, fontPosY+2);
   }
   
   counter *=  -1.04;
   
   if (mouseX >= 350 && mouseX <= 395 && mouseY >= 70 && mouseY <= 85) {
      fill(128, 128, 128);
      ellipse(87, 80/counter, 90*counter/2, 25*counter/2);   
   }
      
    if (counter <= -5) {
      counter = 1;
   }

}


