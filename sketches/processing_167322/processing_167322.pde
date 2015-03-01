
/**
 * Pointillism
 * by Daniel Shiffman.
 *
 * Mouse horizontal location controls size of dots.
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image.
 *
 *Thanks to  Georg Fischer (aka Snorpey)  for the original image
 */
  
 
/* @pjs preload="mike and ian.jpg"; */

 
PImage img;
int smallPoint, largePoint;
 
void setup() {
  size(638, 600);
  img = loadImage("mike and ian.jpg");
  smallPoint = 4;
  largePoint = 18;
  imageMode(CENTER);
  noStroke();
  background(255);
  frameRate(120);
}
 
void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 255);
  rect(x, y, pointillize, pointillize);
}
 
void keyPressed(){
   if(key=='s'){
      saveImage();
 }
   if(key=='z'){
  background(255);
}
   if(key=='b'){
filter(BLUR);
}
if(key=='i'){
filter(INVERT);
}
}
    
 void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}
  
String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}




