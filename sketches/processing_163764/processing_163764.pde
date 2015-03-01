
int x=0;
int y=0;
void setup(){
  size(500,500);
  background(220);
   smooth();
  frameRate(45);
 
}
  
void draw(){
  
  
  x = x + (mouseX-x)/25;
  y = y + (mouseY-y)/25;
  

  stroke(150);
  fill(205,205,205);
  ellipse(x+2, y+2, 25, 25);
  noStroke();
  fill(200);
ellipse(x, y, 15, 15);
 
fill(250);
ellipse(x-2, y-2, 15, 15);

 }
   

  

void keyPressed(){
   if(key=='s'){
      saveImage();
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
