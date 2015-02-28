
PImage img;
PFont font;
String zoo = "e s c a p e";
String zum = "open sesame";
  
void setup(){
  size(600,450);
  img = loadImage("DSC00080_01.jpg");

}
  
  
void draw(){
    font = loadFont ("Rockwell-Italic-48.vlw");
    smooth ();
  textFont (font, 48);
  image (img, 0,0);
   fill (255);
   text(zoo,random(width),random(height));
   fill (200,10,20);
    textFont (font, 33);
   text(zum,400,360);
  }




