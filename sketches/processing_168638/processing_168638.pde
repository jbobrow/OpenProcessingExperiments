
PFont font;
String word = "Trouble   Makers  All  Over!   Run, Run, Run!!!";
Letter[] letters;
 
void setup() {
 font= createFont ("Helvetica", 90, true);
 size(800, 600);
 smooth ();
 textFont(font, 28);
 translate (0, -20);
 letters = new Letter[word.length()];
 int x = 16;
 for (int i = 0; i < word.length(); i++) {
   letters[i] = new Letter(x,100,word.charAt(i));
   x += textWidth(word.charAt(i));
 }
}
 
void draw() {
 background(0);
 for (int i = 0; i < letters.length; i++) {
   letters[i].display();
   if (mousePressed) {
     letters[i].shake();
   } else {
     letters[i].back();
   }
 }
}
 
class Letter {
 char letter;
 float basex,basey;
 float x,y;
 
 Letter (float x1, float y1, char letter1) {
   basex = x = x1;
   basey = y = y1;
   letter = letter1;
 }
 
 
 void display() {
   fill(255);
   textAlign(CENTER);
   text(letter,x,y);
 }
 
 
 void shake() {
   x += random((PI-3)*10, (PI-2)*10);
   y += random((PI-3)*10, (PI-2)*10);
 }
 
 void back() {
  x = (basex+x*10)/11;
y = (basey+y*10)/11;
}
 }




