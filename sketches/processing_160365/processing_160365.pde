
void setup(){
  size(700,500);
  background(255);
 smooth(2);
  frameRate(15);
}
 
void draw(){
 float r = random(1,10);
 if (mousePressed){
 stroke(1);
 strokeWeight(random(0,0));
strokeCap(TRIANGLE);
  line(mouseX,mouseY,pmouseX,pmouseY); 
  noStroke();
fill(0,0,0);
  ellipse(mouseX,mouseY,r,r); 
  fill(140,random(40,52));
   ellipse(pmouseX,pmouseY,r,r);
   
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
