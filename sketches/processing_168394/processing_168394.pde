
PFont font;
String word = "balloon";
char [] letters;
float[] y;
int currentLetter = 0;
float angle = 0.0;

void setup() {
  size(300,300);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  letters= word.toCharArray();
  y= new float[letters.length];
  for (int i = 0; i < letters.length; i++) {
    y[i] = 300;
  }
  fill(250,200, 10);
}

void draw() {
  background(10, 100, 100);
 if (y[currentLetter] > 35) {
   y[currentLetter] -= 3;
 } else {
   if (currentLetter < letters.length-1) {
     currentLetter++;
 }
 }
 float x = (width - textWidth(word))/2;
 for (int i=0; i< letters.length; i++) {
  // text(letters[i], x, y[i]);
   x += textWidth(letters[0]);
   angle += 0.02;
  pushMatrix();
  translate(x,y[i]);
  rotate((y[i]-33)/100.0);
  if(i==0)println( y[i] );
  text(letters[i], 0 ,0);
  popMatrix();
 }
}


