
void setup(){
  size(700,500);
  background(255);
 smooth();
  frameRate(20);
}
 
void draw(){
 if (mousePressed){
noStroke();
fill(255);
  rect(mouseX,0,10,500); 
 } else {
   stroke(0);
   strokeWeight(8);
   if(key=='y'){fill(255,255,0);
   }
   if(key=='b'){fill(0,0,255);
   }
   if(key=='r'){fill(255,0,0);
   }
   if(key=='g'){fill(0,255,0);
   }
   if(key=='p'){fill(255,0,255);
   }
   ellipse(random(0,700),mouseY,random(0,100),random(0,100));
 

}
} 
 
 
void keyPressed(){
   if(key=='s'){
      saveImage();
 }
   if(key=='z'){
  background(255);
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



