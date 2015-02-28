
String message = "The quick brown fox jumps over the lazy dog";
String words[];
PFont font;
float x;
float y;
float fs;

void setup() {
   size(300, 300); 
   textAlign(CENTER, CENTER); 
   
   x = width/2;
   y = height/2;
   
   // this is different from createFont().
   // loadFont() allows you to package fonts with your program.. For instance,
   // you probably don't have the "Bebas" font installed on your computer. 
   // To use loadFont(), first create a font file using Tools -> Create Font
   font = loadFont("Bebas-96.vlw");
   fs = 96;
   textFont(font);
   words = message.split(" ");
}

void draw() {
  background(255);
  fill(0);
  
  // calculate a rolling index using 'frameCount'. 
  // the modulo operator (%) will keep the index looping between 0 and words.length-1
  int index = frameCount % words.length;   
  textSize(fs);
  text(words[index], x, y);
  
  // change the frameRate based on the mouse position
  frameRate(map(mouseX, 0, width, 2, 30));
}

void keyPressed() {
  // when we find that key == CODED, we can look into 'keyCode' to detect 
  // special key presses like the arrow keys
  // the reason things are done this way is because arrow keys don't have an ascii 
  // code  
  if (key == CODED) {
    if (keyCode == UP) fs += 10;
    if (keyCode == DOWN) fs -= 10;
  }  
}

