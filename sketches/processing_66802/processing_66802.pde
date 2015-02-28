
PFont Font01;
PFont Font02;
int n;


void setup() {

  size(400, 490);
  noStroke();
  smooth();
  background(255);



  Font01 = loadFont("HelveticaNeue-Bold-60.vlw");
  Font02 = loadFont("HelveticaNeue-UltraLight-24.vlw");
}

void draw() {


  fill(173, 173, 183);
  textFont(Font02);
  text("press A for color changing", 20, 380);
  text("click to change the background", 20, 410);
}
// mouse



void keyPressed() {
  if (key == 'a') {
    fill(random(255), random(255), random(255));
    textFont(Font01);
    Font01 = loadFont("HelveticaNeue-Bold-60.vlw");
    text("A B C D E ", 20, 80);
    text("F G H I J", 20, 130);
    text("K L M N O", 20, 180);
    text("P Q R S T", 20, 230);
    text("U V W Z Y Z", 20, 280);
  }
}

void mousePressed () {
  background(n);
  if (n == 0) {
    n = 255;
  }
  else {
    n = 0;
  }
}


