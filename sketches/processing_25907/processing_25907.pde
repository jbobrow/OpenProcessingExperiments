
PFont font;
String input = "Type";
float angle = 0;

void setup() {
  size(400,400);
  textAlign(CENTER,CENTER);
  font = createFont("Helvetica", 60);
  textFont(font);
  noStroke();
}

void draw() {

  fill(255,5);
  rect(0,0,width,height);

  fill(0);
  textSize(mouseX+4);

  translate(width/2,mouseY);
  rotate(radians(angle));

  text(input,0,0);

  angle += 1;
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




