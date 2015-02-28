
String message = "random";
float x, y;
PFont randomFont;

float r;


void setup() {
  size(600, 600);
  smooth();
  background(255);
  textSize(20);



  randomFont = loadFont("DIN-Medium-48.vlw");


  //textSize(random(50,100));


  noStroke();

  x = 7500;
  y = 7500;
}

void draw() {

  fill(random(255), random(255), random(255));

  text("R", random(x+8), random(y));
  text("a", random(x+3), random(y));
  text("N", random(x+4), random(y));
  text("d", random(x+5), random(y));
  text("O", random(x+6), random(y));
  text("m", random(x+10), random(y));
}



