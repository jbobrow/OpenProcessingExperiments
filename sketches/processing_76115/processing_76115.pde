
//Conditionals assignment #2

float dir=.01; //establish direction as float 
float i=0; // and assign increment value
void setup(){
  size(2000,2000); //screen size
  background(0); //background color is black
  colorMode(HSB,360,100,100); // establish color mode as HSB giving it the full range of colors

}

void draw(){
 circleK(mouseX,mouseY,i); //apply function circleK 
 i+=dir;
  if (millis()>=1000){
     dir=-.01;
  
 
   }
   } 


void circleK(float posX, float posY, float iSize){
 noFill();
 float colorS=map(posX,0, width, 0,360);
 println(colorS);
 //last two arguments are the desired range of screen
 //map() function says use last two points and apply range to entire screen
 
  stroke(colorS, 100,50);
  ellipse(posX+1, posY+1, iSize+1,iSize);

}


