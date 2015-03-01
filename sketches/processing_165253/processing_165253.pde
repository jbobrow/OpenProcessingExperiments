
int x=0;
int y=0;
float angle = 0.0;
float offset = 500;
float scalar = 200;
float speed = 0.02;
void setup(){
  size(800,900);
  background(255);
   smooth();
  frameRate(15);
 
}
  
void draw(){
 float r = random(2, 12);
 float w = random(25, 200);
 float k = 200 + cos(angle+360) * 70;
float l = 200 + sin(angle-360) * 400; 


 
 if (mousePressed){
  triangle(pmouseX,pmouseY,pmouseX*random(0,50), pmouseY*random(0,50), pmouseX+k, pmouseY+l);

  stroke(255);
  strokeWeight(1);
  fill(mouseX,mouseY,100, 80);

 
 angle-=speed;
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

 
