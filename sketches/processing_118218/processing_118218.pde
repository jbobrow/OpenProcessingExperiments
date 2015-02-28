
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/64692*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup() {
  size(400, 300);                     
  PFont font;
  font = loadFont("StoneSansITCTT-Bold-48.vlw"); 
  textFont(font); 

}

void draw() {

  frameRate(30);
  textAlign(CENTER);

  
  String []objects = { 
    "Paper",
    "Scissors",
    "Rock"
    
  };
  int l = int(random(3));
 
   if(!mousePressed){ 
 background(0);
  textSize(43);

  fill(255);
  text( objects[l], width/2, height/2+30);

  
   }
}

void keyPressed() {
  if (key== 's') {  
    saveImage();
  }
}

void saveImage() {
  String fileName = timeStamp()+".jpeg";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}

String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}


