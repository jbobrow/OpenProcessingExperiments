
int counter;

void setup() {  //setup function called initially, only once
  size(900, 400);
  background(random(120),120,100,40);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  frameRate(20);
}

void draw() {  //draw function loops 
  counter++;
  background(random(250),120,100);
  noStroke();
  fill(random(100),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/3, height/2, 400*sin(counter), 80*sin(counter));
    fill(255);
    ellipse(width/3, height/2, 100*sin(counter), 100*sin(counter));
  
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
 








