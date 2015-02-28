
void setup() {
  size(600, 300);                     
  PFont font;
  font = loadFont("Futura-CondensedExtraBold-48.vlw"); 
  textFont(font); 

}

void draw() {

  frameRate(12);
 
  
  String []alphabet = {
    "SOMETHING", " ", "nothing", " ", " ", " ", " ", " ", 
    " "," "," "," "
  };
 

  int m = int(random(12));

  
   if(!mousePressed){ 
 background(0);
 textAlign(CENTER);
  textSize(60);
  String s = alphabet [m];
  float sw = textWidth(s);
  
 fill(255);
text( alphabet[m], width/2, height/2+40);


  
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


