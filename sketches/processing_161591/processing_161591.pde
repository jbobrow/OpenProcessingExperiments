
void setup(){
  size(700,500);
  background(225);
  frameRate(75);
}
 
void draw(){
 float r = random(6,30);
 if (mousePressed){
 stroke(0);
 fill(255,255,255);   
 strokeWeight(random(.1,10.5));
strokeCap(SQUARE);
  rect(mouseX,mouseY,pmouseX,pmouseY); 
  //noStroke();
//fill(255,255,255);   
}
 
}
 
 
 
void keyPressed(){
   if(key=='s'){
      saveImage();
 }
   if(key=='z'){
  background(225);
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
