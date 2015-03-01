
int x=0;
int y=0;
void setup(){
  size(500,500);
  background(255);
   smooth();
  frameRate(25);

}
 
void draw(){
 float r = random(2, 12);
 float w = random(25, 200);
 if (mousePressed){
  ellipse(mouseX,mouseY,r, r); 
  stroke(r);
  fill(mouseX, r, mouseY);
  stroke(0);
  strokeWeight(random(.2,5.5));
 //noStroke();
 }
  

 
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

