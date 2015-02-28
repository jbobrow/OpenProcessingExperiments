
//animated word
//VIIRJ.COM,2013

String message = "drunk";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(600, 600);


    // Create the font
    textFont(createFont("helvetica", 80));
  textAlign(CENTER, CENTER);

  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(255);

  rect(0, 0, width, height);

  // If the cursor is over the text, change the rotation
  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {

    rotate(random(x-100));
    rotate(y-100);
   fill(random(50),random(255),random(255));
  }
  
   fill(0);
  text("drunk", x, y);
}



