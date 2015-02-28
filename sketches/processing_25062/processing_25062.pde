
PImage img;
PFont font;

  
void setup(){
  noStroke();
  smooth();
  size (500,500);
  img = loadImage ("cat.jpg");
  font=loadFont ("font.vlw");
  textFont(font, 60);
}

void draw(){
   image (img, 0,0);
 
  
  //EYES
   fill(234,172,47);
   ellipse(270,246,70,70);
   ellipse(440,226,70,70);
  
  // map (value/data, actual min, actual max, target min, target max)
  //float values for left eye
  float m = map(mouseX, 0, width, 285 - 25, 255+25);
  float n = map(mouseY, 0, height, 260 - 25, 232+25);
  
  //float values for right eye
  float o = map(mouseX, 0, width, 455 - 25, 425+25);
  float p = map(mouseY, 0, height, 240 - 25, 213+25);
  
  
  fill(0);
  ellipse(m,n,50,50); //left eyes
  ellipse(o,p,50,50); //right eye
  
  //eyehighlights
  fill(255, 100);
  ellipse( 260,233,25,25);
  ellipse( 430,210,25,25);
  
   //TEXT 
   fill(255);
   rotate(PI/22);
   text("Meow?", 250, 420);
   
}


