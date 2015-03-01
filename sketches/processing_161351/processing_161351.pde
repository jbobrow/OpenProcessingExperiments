
float med_mouseX=mouseX;
float med_mouseY=mouseY;
float old_mouseX=0;
float old_mouseY=0;
float red=random(0,255);

void setup() {
  size(400,400);
  background(255);
}

void draw(){
  noStroke();
  med_mouseX=(mouseX+pmouseX)*0.5+random(-50,50);
  med_mouseY=(mouseY+pmouseY)*0.5+random(-50,50);

  if(mousePressed){
    if(old_mouseX==0){
      old_mouseX=mouseX;
    }
    if(old_mouseY==0){
      old_mouseY=mouseY;
    }
    fill(random(0,255),0,0,random(0,255));
    beginShape();
      vertex(mouseX,mouseY);
      vertex(med_mouseX,med_mouseY);
      vertex(pmouseX,pmouseY);
    endShape();
  
  fill(random(0,255),0,0,random(0,255)); 
    beginShape();
      vertex(med_mouseX,med_mouseY);
      vertex(pmouseX,pmouseY);
      vertex(old_mouseX,old_mouseY);
    endShape();
    
    old_mouseX=med_mouseX;
    old_mouseY=med_mouseY;
  }
}

void mouseClicked() {
  med_mouseX=mouseX;
  med_mouseY=mouseY;
  old_mouseX=mouseX;
  old_mouseY=mouseY; 
}

void keyPressed(){
  if(key=='s'){
    saveImage();
  }
  if(key=='x'){
    background(255);
  }
  if(key=='e'){
    filter(ERODE);
    filter(ERODE);
    filter(ERODE);
  }
  if(key=='d'){
    filter(DILATE);
    filter(DILATE);
    filter(DILATE);
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
