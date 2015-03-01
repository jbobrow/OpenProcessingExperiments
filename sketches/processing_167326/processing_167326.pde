
/* @pjs preload="hood_mixtape_3 copy.jpg"; */

 
PImage img;
int smallPoint, largePoint;
 
void setup() {
  size(638, 637);
  img = loadImage("hood_mixtape_3 copy.jpg");
  smallPoint = 4;
  largePoint = 18;
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




