
///http://www.openprocessing.org/sketch/19648//
//http://www.openprocessing.org/sketch/8581//

int maxImages = 15;  // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
int savedTime;
int totalTime = 3000;
PImage[] images = new PImage [maxImages]; // The image array
String[] filenames = {"1.jpg", "2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"};

float x; // Horizontal location
int index = 0;
//new one//
PFont font;

float opacityv = 2; //opacity variables
float opacity5 = 0;
float opacityb = 0;
float opacity1 = 0;
float opacityz = 0;
float opacity9 = 0;

 
void setup() {
 size (700,454);
 for (int i = 0; i< filenames.length; i++) {
   images[i] = loadImage(filenames[i]);
 }
 font = loadFont("Candara-48.vlw" ); //futura
  smooth();
}
 
void draw() {
  
 image(images[imageIndex],0,0);  // Display one image 
 int passedTime = millis() - savedTime; // Calculate how much time has passed
 if (passedTime > totalTime) {
  imageIndex++;
  savedTime = millis(); // Save the current time to restart the timer
  if(imageIndex>filenames.length-1) {
    imageIndex = 0; 
   }
  }
   
   //text
   // Display headline at x location
     textFont(font); 
    smooth();
   frameRate(18);
    
  fill(200,10,10, opacityv); //colour
  textSize(50);
  text("G", 400, 125);
  
  fill(200,10,10, opacity5); //colour
  textSize(45);
  text("1", 60,250, 125);
  
  fill(200,10,10, opacityb); //colour
  textSize(80);
  text("2", 530, 100, 125);
  
  fill(200,10,10, opacity1); //colour
  textSize(48);
  text("3", 590, 240, 125);
  
  fill(200,10,10, opacityz); //colour
  textSize(50);
  text("4", 160, 100, 125);
  
  fill(200,10,10, opacity9); //colour
  textSize(65);
  text("G", 120,370, 125);
  
  fill(200,10,10, opacity9); //colour
  textSize(60);
  text("2", 300,370, 125);
  
  fill(200,10,10, opacity1); //colour
  textSize(35);
  text("4", 500, 390, 125);
  
  opacityv += 30; //increasing opacity from 0 at different rates
  opacity5 += 25;
  opacityb += 20;
  opacity1 += 15;
  opacityz += 10;
  opacity9 += 5;
   
  //rates of opacity change because speed of reachign 500 varies
    
  if(opacityv > 500){  //if opacity reaches 500, change back to 0
     opacityv = 0;}
   if(opacity5 > 500){
     opacity5 = 0;}
   if(opacityb > 500){
     opacityb = 0;}
   if(opacity1 > 500){
     opacity1 = 0;}
   if(opacityz > 500){
     opacityz = 0;}
   if(opacity9 > 500){
     opacity9 = 0;}
}



