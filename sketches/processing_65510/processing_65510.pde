
class Cl {
  String message = "Click me" ;

  float x, y; // X and Y coordinates of text
  float hr, vr;  // horizontal and vertical radius of the text
  Cl () {
  }


  void setting() {
    PFont font = loadFont("AmericanTypewriter-24.vlw");
    textFont(font);
    textAlign(CENTER, CENTER);
    this.hr = textWidth(message) / 2;
    this.vr = (textAscent() + textDescent()) / 2;
    this.x = width / 2;
    this.y = height / 2;
  }

  void dp() {
    // instead of clearing the background, fade it by drawing
    // a semi-transparent rectangle on top
   noStroke();
    fill (255,70);
   rect(0,marginX,width, height-2*marginX);
    fill(0);

    // If the cursor is over the text, change the position
    if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
      x += random(-5, 5);
      y += random(-5, 5);
    }
    text(message, x, y);
  }
}


