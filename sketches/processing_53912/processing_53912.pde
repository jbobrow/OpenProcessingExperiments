
String inputText = "DON'T  TELL  ME  WHAT  TO  DO";
char[] letters;
float totalOffset = 0;
PFont font;
 
 
void setup() {
  size(571, 185);
  PImage stars = loadImage("5705353844_843554be66_b-1.jpeg");
  background(stars);
 
  font = loadFont("HoeflerText-BlackItalic-90.vlw");
  textFont(font);
 
 
  letters = inputText.toCharArray();
  textAlign(CENTER);
  fill(255,255,255);
}
 
void draw() {
   PImage stars = loadImage("5705353844_843554be66_b-1.jpeg");
  background(stars);
    
  translate((width-totalOffset)/2, 0);
  totalOffset = 0;
  float firstWidth = (width/letters.length)/4.0;
  translate(firstWidth, 0);
  for (int i = 0; i <letters.length; i++) {
 
    float distance = abs(totalOffset - mouseX);
    distance = constrain(distance, 24, 60);
    textSize(84-distance);
    text(letters[i], 0, height-2);
 
    float letterWidth = textWidth(letters[i]);
    if (i !=letters.length-1) {
      totalOffset = totalOffset +letterWidth;
      translate(letterWidth, 0);
    }
  }
}


