
int xPos = 0;
int increment =4;

PFont myFont;

String[] oneSyllable = {
  "the", "a", "you", "for", "when",  "all", "space", "is", "days", "is", "why", "here", "to",  "see", "do", "flag", "light", "rain", "fall", "flow", 
};
String[] twoSyllable = {
  "today", "never", "always", "conjure", "final", "weather", "winter", "sunset", "ocean", "eyesore", "briges", "river", "matter", "alias",  
};
String[] threeSyllable = {
  "forever", "eternal", "atmosphere", "processing", "planetary", "paradox", "horizon", "discover", "nocturnal",  "adventure", 
};
boolean haiku = true;
String firstLine;
String secondLine;
String thirdLine;
PImage img; 
void setup () {
  size (710, 710);
  img = loadImage ("tesseract710.jpg");
}
void draw () {
  
  image(img, 0, 0); 
  myFont = loadFont("AdobeDevanagari-Regular-32.vlw");
  textFont(myFont); 
  if (haiku ==  true) {
  firstLine = oneSyllable[(int)random(oneSyllable.length)] + " " + threeSyllable[(int)random(threeSyllable.length)] + " " + oneSyllable[(int)random(oneSyllable.length)]; 
  secondLine = threeSyllable[(int)random(threeSyllable.length)] + " " + twoSyllable[(int)random(threeSyllable.length)] + " " + twoSyllable[(int)random(twoSyllable.length)];
  thirdLine = twoSyllable[(int)random(twoSyllable.length)] + " " + threeSyllable[(int)random(threeSyllable.length)];
  haiku = false;} 
  text(firstLine,width/10,height/3);
  text(secondLine, width/10, height/3+50);
  text(thirdLine, width/10, height/3+100);
  println (firstLine);
  println (secondLine);
  println (thirdLine);
 
fill(64, 63, 190);
ellipse(xPos, height/1.5, 50, 50);
 xPos = xPos + increment;
 
 if(xPos + 25 > width){
   increment = increment * -1;
 }
 if(xPos < 0) {
   increment = increment * -1;
 }
 
}
void mousePressed() {haiku = true;}





