
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/25907*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PFont font;
String input = "Turn";
float angle = 0;
PImage turn;
void setup() {
  size(600,600);
  turn = loadImage("turn.png");
  textAlign(CENTER,CENTER);
  font = createFont("Helvetica", 200);
  textFont(font);
  noStroke();
}

void draw() {
  image(turn,0,0);
  fill(255,5);
  rect(0,0,width,height);

  fill(mouseX+200,mouseX+10,mouseX);
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




