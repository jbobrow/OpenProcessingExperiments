
void setup(){
  size(1000,600);
  background(255);
}

void draw(){
  if (mousePressed){
 strokeWeight(random(.9,19));
    stroke(0);
    strokeCap(SQUARE);
    strokeJoin(SQUARE);
    smooth();
    line(pmouseX,pmouseY,mouseX,mouseY);}  
}
void keyPressed() {
    if(key=='s'){
    saveImage();}
    
    
    if(key=='z') {
    strokeWeight(.9);
    stroke(0);
    smooth();
    line(pmouseX,pmouseY,mouseX,mouseY);}
     if(key=='c') {
   noStroke();
   fill(255);
   rect(-1,-1,width+1,height+1);
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


