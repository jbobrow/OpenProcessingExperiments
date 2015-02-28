
void setup(){
  size(700,500);
  background(255);
 smooth();
  frameRate(30);
}

void draw(){
 float r = random(6,30);
 if (mousePressed){
 stroke(0);
 strokeWeight(random(.5,5.5));
strokeCap(SQUARE); 
  line(mouseX,mouseY,pmouseX,pmouseY);  
  noStroke();
fill(255,0,0);
  ellipse(mouseX,mouseY,r,r);  
  fill(0,random(55,255));
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


