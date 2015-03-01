
//float ppmouseX=pmouseX
//float ppmouseY=pmouseY

int toolred=0;
int toolgreen=0;
int toolblue=0;

void setup() {
  size(400, 400);
  background(255);
  frameRate(240);
}

void draw(){
  noStroke();
  
  //red
  fill(255,0,0);
  rect(0,0,30,30);
  //orange
  fill(255,128,0);
  rect(0,30,30,30);
  //yellow
  fill(255,255,0);
  rect(0,60,30,30);
  //green
  fill(0,255,0);
  rect(0,90,30,30);
  //blue
  fill(0,0,255);
  rect(0,120,30,30);
  //purple
  fill(153,0,153);
  rect(0,150,30,30);
  //black
  fill(0,0,0);
  rect(0,180,30,30);
  //white
  stroke(0);
  strokeWeight(1);
  fill(255,255,255);
  rect(0,210,29,29);
  
  //erase
  stroke(255,0,0);
  strokeWeight(2);
  line(5,395,25,375);
  line(25,395,5,375);
  
  if(mousePressed){
    if((mouseX<30) && ((mouseY<210)||(mouseY>370))){
      noFill();
      noStroke();
    } else {
    fill(toolred,toolgreen,toolblue);
    stroke(toolred,toolgreen,toolblue);
    strokeWeight(7);
    point(mouseX,mouseY);
    strokeWeight(9);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  }
}

void mouseClicked(){
  if ((mouseX<30) && (mouseY<30)){ //red
    toolred=255;
    toolgreen=0;
    toolblue=0;
  }
  if ((mouseX<30) && (30<mouseY) && (mouseY<60)){ //orange
    toolred=255;
    toolgreen=128;
    toolblue=0;
  }
  if ((mouseX<30) && (60<mouseY) && (mouseY<90)){ //yellow
    toolred=255;
    toolgreen=255;
    toolblue=0;
  }
  if ((mouseX<30) && (90<mouseY) && (mouseY<120)){ //green
    toolred=0;
    toolgreen=255;
    toolblue=0;
  }
  if ((mouseX<30) && (120<mouseY) && (mouseY<150)){ //blue
    toolred=0;
    toolgreen=0;
    toolblue=255;
  }
  if ((mouseX<30) && (150<mouseY) && (mouseY<180)){ //purple
    toolred=153;
    toolgreen=0;
    toolblue=153;
  }
  if ((mouseX<30) && (180<mouseY) && (mouseY<210)){ //black
    toolred=0;
    toolgreen=0;
    toolblue=0;
  }
  if ((mouseX<30) && (210<mouseY) && (mouseY<230)){ //white
    toolred=255;
    toolgreen=255;
    toolblue=255;
  }
  if ((mouseX<30) && (370<mouseY) && (mouseY<400)){ //erase
    background(255);
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
  
