
//STARTED WITH Processing example

String message = "OVERLOAD";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(600, 600);
  smooth();
  PFont font = loadFont("Knockout-HTF71-FullMiddlewt-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  
  x = 400;
  y = 400;
  
}

void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  
  fill(204, 120);
  //rect(0, 0, width, height);
  
  fill(0);
  
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-4, 4);
    y += random(-4, 4);
    
  text("O", random(x), y);
  text("V", random(x+12), random(y));
  text("E", random(x+24), random(y));
  text("R", random(x+36), random(y));
  text("L", random(x+48), random(y));
  text("O", random(x+60), random(y));
  text("A", random(x+72), random(y));
  text("D", random(x+84), random(y));
}else{
  text("O", (x), y);
  text("V", (x+12), (y));
  text("E", (x+24), (y));
  text("R", (x+36), (y));
  text("L", (x+48), (y));
  text("O", (x+60), (y));
  text("A", (x+72), (y));
  text("D", (x+84), (y));
}
}


