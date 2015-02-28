
float angle = 0.0;
float offset;


PImage orange_violet;
PImage L;
PImage red_orange;
PImage A;
PImage red_green;
PImage N;
PImage green;
PImage blue_green;
PImage D;





 
void setup() {
 
  size(800,800);
  background(255);
 
  
 
  //call images 

  


  orange_violet = loadImage("orange_violet.png");
  L = loadImage("L.png");
  red_orange = loadImage("red_orange.png");
  A = loadImage("A.png");
  red_green = loadImage("red_green.png");
  N = loadImage("N.png");
  green = loadImage("green.png");
  blue_green = loadImage("blue_green.png");
  D = loadImage("D.png");
}
  
void draw() {
    
  filter(ERODE);
  frameRate(50);
  angle+=0.09;
  
  float sinVal = sin(angle) * 500;
  
  translate(20,20);
  
image(L, 200+sinVal,100+sinVal,width/3,height/3);
image(red_orange, 50+sinVal,200+sinVal, width/3,height/3);
image(A, sinVal+50,400+sinVal, width/3,height/3);
image(red_green, 20+sinVal,sinVal, width/3,height/3);
image(N, 300+sinVal,300+sinVal, width/3,height/3);
image(green, sinVal,+600, width/3,height/3);
image(blue_green, 475,sinVal, width/3,height/3);
image(D, sinVal,150, width/3,height/3);
image(orange_violet, 250,sinVal, width/3,height/3);
tint(255,255 * mouseX/width);

//smooth();



  }






