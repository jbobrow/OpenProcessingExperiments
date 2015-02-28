
PFont font;
String txt = "The Processing Language has been designed";
int move=-1300;


void setup() {
  size(600, 100);

  font= loadFont("AkzidenzGrotesk-Light-20.vlw");
  textFont(font);
}

void draw() {


  background(246,250,139);


  textSize(70);

  fill(5,97,165);
  text(txt, move, 70, 500);

  move=move+ 1 + mouseY*5;

  if (move>= width) {
    move=-1300;
  }
}



