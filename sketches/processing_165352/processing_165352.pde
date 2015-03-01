
PFont font;

void setup () {
size (480, 480);//size of screen
background(0, 0, 0);//backround
font = loadFont("LiberationSerif-Bold-48.vlw");
}

void draw () {
  fill(200, 200, 200);
  textFont(font, 25);
  text("Lets draw!", 160, 460);
  if(mousePressed) {
  fill(0, random (80), 0);
  }
  else {
    noStroke();
    noFill();
  }
  ellipse(mouseX, mouseY, 20, 20);
    }


void keyPressed () {
 if(key =='s') {
  saveFrame("LetsDraw!-###.jpg");
 }
 if(key == 'd') {
   clear();
 }
} 


