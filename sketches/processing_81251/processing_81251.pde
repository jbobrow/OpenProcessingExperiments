
//source from: http://www.openprocessing.org/sketch/4921
/* @pjs font="AdobeHeitiStd-Regular.otf","16.jpg"; */
PFont font;
float x = 170;
float y = 300;
String popup = "Hello?"; 

 
void setup(){
  size(450, 337);
  smooth();
  background(0);
  font = loadFont("SansSerif-48.vlw");
  textFont(font);
   img= loadImage("16.jpg");
  
}

//draws the animation
void draw(){
}
  
  //when mouse is pressed
void mousePressed(){
   image(img,0,0);
  //text font at the size that appears
  textFont(font,50);
  //fill on click (random colors)
  fill( random(255), random(255), random(255), random(255));
  //smoothing
  
  smooth();
  //the string value popup word "hello?"
  text(popup,random(255),random(255));
   
}
PImage img; 




