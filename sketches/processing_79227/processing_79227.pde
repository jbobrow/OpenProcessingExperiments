
// Code reference: Gonzalo Oaxaca Bermejo - http://www.openprocessing.org/sketch/69236
PImage img;

int a;
  void setup(){
  frameRate(4);
 img = loadImage("nomnom.jpg");
   
size(500,700);
a=1;
}
 
PFont miFont;
//println(PFont.list());
 
void draw(){
  image(img,0,0);
  fill(255);
String[] letras=PFont.list();
println(letras);
 
 
miFont=createFont (letras [a],50);
 
textFont(miFont);
text("NOM",200 ,height/2);
a=a+1;
}



