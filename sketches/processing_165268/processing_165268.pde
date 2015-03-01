
PImage img;
PImage img2;
int smallPoint, largePoint;
 
void setup() {
  size(500, 660);
  img = loadImage("SEu2a.jpg");
  img2 = loadImage("Obama.jpg");
  smallPoint = 4;
  largePoint = 20;
  imageMode(CENTER);
  noStroke();
  background(255);
}
 
void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  float pointillize2 = map(mouseX, 0, width, smallPoint, largePoint);
  
  int x = int(random(280,img.width));
  int y = int(random(img.height));
  int x2 = int(random(0,img2.width-220));
  int y2 = int(random(img2.height));
  color pix = img.get(x, y);
  color pix2 = img2.get(x2,y2);

  fill(pix, 255);
  ellipse(x, y, pointillize, pointillize);
  

  fill(pix2,255);
  ellipse(x2, y2, pointillize2, pointillize2);
  
  
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



