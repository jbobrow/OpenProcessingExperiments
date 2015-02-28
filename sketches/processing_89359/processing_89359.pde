
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25907*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PFont font;
String input = "Napier";
float angle = 0;

void setup() {
  size(1200,600);
  textAlign(CENTER,CENTER);
  font = createFont("Helvetica", 40);
  textFont(font);
  noStroke();
}

void draw() {

  fill(255,0,0,5);//changed background colour to yellow, extra 5 = alpha/transparency
  rect(0,0,width,height);

  fill(255);
  textSize(mouseX+4);

  translate(width/2,mouseY);
  rotate(radians(angle));

  text(input,0,0);

  angle += 1;//changes speed of rotation
}

void mousePressed() {
  fill(random(255));
}

void keyPressed() {
  if (key == BACKSPACE) {
    int lastLetter = input.length()-1;
    if (lastLetter < 0) lastLetter = 0;
    input = input.substring(0, lastLetter);
  }
  else if (key != CODED) {
    input += key;
  }
}





