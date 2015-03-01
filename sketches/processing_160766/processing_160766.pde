
void setup(){
  size(700,500);
  background(180);
 smooth(200);
  frameRate(30);
}

void draw(){
 float r = random(6,30);
 if (mousePressed){
 stroke(0);
 rect(mouseX,mouseY,r,r);
 ellipse(mouseX,mouseY,r,r); 
 triangle(mouseY,mouseX,r,r,mouseY,mouseX);
     fill(150,0,80);
 strokeWeight(random(.5,5.5));
strokeCap(SQUARE); 
  line(mouseY,mouseX,pmouseX,pmouseY);  
  rect(mouseX,mouseY,r,r);
  noStroke();
fill(250,0,30);
fill(130,0,250);
 rect(mouseX,mouseY,r,r); 
  rect(mouseX,mouseY,r,r); 
  ellipse(mouseX,mouseY,r,r); 
  fill(0,50,250);
   ellipse(pmouseX,pmouseY,r,r);
   fill(150,255,10);
   stroke(255,10,45);
  
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
