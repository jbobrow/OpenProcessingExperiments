

void setup() {
  size(400, 400);
  smooth(); 
  noStroke();
  rectMode(CENTER);
}

void draw() {
  PFont font = loadFont("Rockwell-Bold-72.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  String s = "PINK MINK";
  float sw = textWidth(s); //width of the text
  float sh = textAscent() + textDescent(); //height in pixels of the text (

  background(255);

  translate(width/2, height/2); //places everything in the center of the screen

  for (int i = 0; i < 18; i++) { //repeats 20 times
    fill(255, 32, 127, 128); //the pink colour of the rectangle bordering the letter
    rect(0, 0, sw, sh);

    fill(255, 128); //the fill of the text
    text(s, 0, 0);

    if (mousePressed) {
      rotate(PI/12);
    }
    else {
      rotate(0);
    }
    scale(0.95);
  }
}


