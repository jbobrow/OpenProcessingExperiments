
PImage img;
int smallPoint, largePoint;
 
void setup() {
  size(500, 558);
  img = loadImage("sad man.jpeg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  background(255);
}
 
void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 150);
  strokeWeight(random(.5,2));
  ellipse(x, y, pointillize, pointillize);    

    
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



