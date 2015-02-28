
   // Example 06-01 from "Getting Started with Processing"
// by Reas & Fry. O'Reilly / Make 2010
  
PImage img;
PFont font;
 
void setup() {
  font = loadFont("AcademyEngravedLetPlain-50.vlw");
  textFont(font);
  size(300, 300);
  img = loadImage("vampires-nosferatu.jpg");
}
  
void draw() {
  image(img, 0, 0);
  text("I'm Cute", 25, 60);
}        
                                
