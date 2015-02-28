
//EMS kaleidoscope

//variables
//SET THESE UP LATER
int angle = 46;

//setup
void setup() {
  size (800, 800);
  background(255);
  smooth();
}

//draw
void draw () {
  
  background(255);
  smooth();

  noStroke();
  fill(185, 185, 185, 10);
  for (int i=0; i<18; i++) {
    arc(width/2, height/2, 400, 400, radians(i+45), map(mouseY, 100, 700, 0, i*radians(angle)));
  }
  
  for (int j=0; j<41; j++){
  PFont font;
  font = loadFont("STKaiti-20.vlw");
  textFont(font);
  fill(0, 0, 0, 100);
  text("round and round and round and round and round and round and round and round and round and round", 0, j*20);
  }
  
}

