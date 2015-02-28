

//Make an image Flicker

int timeAlpha;

int intervalA = 3000;

int timeBeta;
int intervalB = 1000;

PImage img;


void setup() {
  // record the time at the start of program
  timeAlpha = millis();
  size(640,450);
  smooth();
  background(255);
  img = loadImage("blotch1.jpg");  
}


void draw () {
  // I want to make a image flicker over time
  //so i need to call a function to make the image appear
  // then i need to call a function to re appear
  //then i need it to loop
  if (millis() > timeAlpha+intervalA) {
    flickerOn();
    timeAlpha =millis();
  }
  
  if (millis() > timeBeta+intervalB) {
    flickerOff();
    timeBeta = millis();
     
  }
}
 
 
  void glitchA () {
    image(img, 25, 25, 250, 250); 
  }
  
 
  

void flickerOn () {
  //do the println thing to see if this works
  println("Flicker On!");
  glitchA();
  
  }

 void flickerOff () {
   background(255);

  println("Flicker Off!");
}
                
                
