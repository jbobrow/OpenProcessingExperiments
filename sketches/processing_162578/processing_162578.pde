
/* @pjs preload="hbird.png"; */

size (500, 500);
background (0);
PImage img= loadImage ("hbird.png");
for (int i=0; i<500; i+=5){
  float r= i+random (500);
  float offset= (r*0.5);
  tint (r, offset, r-i);
  image (img, r, i-offset, 100, 100);
  image (img, r*2, i-offset, 100, 100);
} 
  PFont font= loadFont ("AvenirNext-DemiBoldItalic-70.vlw");
  textFont (font);
  text ("Zing", width/2, 400);
  


