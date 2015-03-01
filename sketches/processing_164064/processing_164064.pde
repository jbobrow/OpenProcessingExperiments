
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
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 
//@pjs preload="lincoln-glitch.jpg"; 
PImage img;
int smallPoint, largePoint;

void setup() {
  size(638, 742);
  img = loadImage("lincoln-glitch.jpg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
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



