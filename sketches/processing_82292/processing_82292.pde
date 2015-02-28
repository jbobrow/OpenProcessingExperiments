

  
PImage img;
PImage img2;
PFont font; 

  
String [] firstWords = {
  "Dany!", "Come Back!","Where'd you go!!","Dany!!!", ":(", "Oh no.."};
  
 
  
void setup(){
  size(600,400);
 
  img = loadImage("pic3.jpg");
  
  font = loadFont("CamphorPro-ThinItalic-32.vlw");
  textFont(font);
  noLoop();
}
  
void draw(){
    
  background(img);

    
String t = "P.js";
  fill(225);
    
  String word1 = firstWords[int(random(firstWords.length))];
 
    
  text(word1,300,200);
  
  
  String output = firstWords[int(random(firstWords.length))] ;
  // joining the Strings together (with a space)
  
  println (output);
  // orubt the result
  
}
  
void mouseReleased(){
 redraw();
}

