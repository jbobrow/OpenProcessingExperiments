
void setup(){
  size(700,500);
  background(600);
 smooth(1);
  frameRate(100);
}
 
void draw(){
 float r = random(25,33.2);
 if (mousePressed){
 stroke(.75);
 strokeWeight(random(1,5.5));
strokeCap(SQUARE);
  line(mouseY,mouseX,pmouseY,pmouseX); 
  noStroke();
fill(800,400,201);
  ellipse(mouseX,mouseY,r,r); 
  fill(1,random(55,255));
   ellipse(pmouseX,pmouseY,r,45);
   
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

