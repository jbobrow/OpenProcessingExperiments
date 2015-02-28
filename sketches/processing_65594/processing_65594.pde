
void setup() {
  size(500, 400);                     
  PFont font;
  font = loadFont("Futura-CondensedExtraBold-48.vlw"); 
  textFont(font); 

}

void draw() {

  frameRate(15);
 
  
  String []alphabet = {
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", 
    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
  };
 

  int m = int(random(26));
 int n = int(random(26));
 int o = int(random(26));
  
   if(!mousePressed){ 
 background(255,0,0);
 textAlign(CENTER);
  textSize(380);
  String s = alphabet [m];
  float sw = textWidth(s);
  
   // fill(255,0,0);
 // text( alphabet[m], width/2, height/2+350);
   fill( 0);
  text( alphabet[n], width/2, height/2+130);
    fill(255);
  text( alphabet[o], width/2, height/2+130);
  
   }
}

void keyPressed() {
  if (key== 's') {  
    saveImage();
  }
}


