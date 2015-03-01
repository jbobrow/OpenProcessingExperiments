
void setup(){
  size(700,500);
  background(100);
 smooth(1);
  frameRate(100);
}
 
void draw(){
 float r = random(.3,.2);
 if (mousePressed){
 stroke(10);
 strokeWeight(random(.5,10));
strokeCap(SQUARE);
  line(mouseY,mouseX,pmouseY,pmouseX); 
  noStroke();
fill(4000,20,2500);
  ellipse(mouseX,mouseY,r,r); 
  fill(16,random(20,255));
   ellipse(pmouseY,pmouseY,r,45);
   
}
 
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



