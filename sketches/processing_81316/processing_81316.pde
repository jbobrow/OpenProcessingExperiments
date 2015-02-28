
/* RESOURCE: http://www.openprocessing.org/sketch/11721 - Patrick Stein
*/
 
 /* @pjs font="Arial.ttf"; */

PImage img; 
 
String [] firstWords = {
  "n0m", "N0m","nOm","noM", "N0M", "NoM"};
 
PFont tondu;

 
void setup(){
  size(433,700);

  img = loadImage("kat2edd.jpg");
 
  textFont(createFont("Tondu",45));
  noLoop();
}
 
void draw(){
   
  background(0);
  image(img ,0 ,0);
   
String t = "P.js";
  fill(225);
   
  String word1 = firstWords[int(random(firstWords.length))];

   
  text(word1,250,500);
 
 
  String output = firstWords[int(random(firstWords.length))] ;
  // joining the Strings together (with a space)
 
  println (output);
  // orubt the result
 
}
 
void mouseReleased(){
 redraw();
}


