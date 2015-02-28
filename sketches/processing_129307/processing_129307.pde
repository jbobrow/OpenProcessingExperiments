
/*
Katie Manduca
 
 Bubbles dependent on text content, location, and size.
 */

String[] lines;

// set up the canvas and load the text file
void setup() {
  size(600, 600);
  background(0);
  noStroke();
  noLoop();

  PFont papyrus;
  papyrus = loadFont("Papyrus-14.vlw");
  textFont(papyrus);
  lines = loadStrings("shadow_of_the_wind.txt");
}


// draw the bubbles based on the content of the text
void draw() {
  float x = random(width/4);
  float y = random(50, 150);
  float r, s;

  // read each line
  for (String line : lines) {
    pushMatrix();
    translate(x, y);

    // read each character
    for (int i = 0; i < line.length(); i++) {
      char c = line.charAt(i);
      s = random(5);

      // change behavior based on the character
      switch(c) {
      case ' ':
        translate(s * textWidth(c), 0);
        r = random(2);
        if (r == 0)
          rotate(PI/4);
        else
          rotate(-PI/4);
        break;
      case ',':
        translate(s * textWidth(c), 0);
        r = random(2);
        if (r == 0)
          rotate(PI/3);
        else
          rotate(-PI/3);
        break;
      case '.':
        translate(s * textWidth(c), 0);
        r = random(2);
        if (r == 0)
          rotate(PI/2);
        else
          rotate(-PI/2);
        break;
        //      case 'a':
        //        fill(0, random(255), random(255));
        //        ellipse(0, 0, textWidth(c), textWidth(c));
        //        translate(textWidth(c), 0);
        //        fill(255);
        //        break;
      default:
        //    text(c, 0, 0);
        fill(0, random(255), random(255), 50);
        ellipse(0, 0, s * textWidth(c), s * textWidth(c));
        translate(s * textWidth(c), 0);
      }
    }
    popMatrix();
    x = random(width/4);
    y = random(height);
  }
}



