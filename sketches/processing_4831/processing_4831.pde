
/**
 Further riffing off of Shiffman's Exercise 6-5. This time,
 I wanted to have a fixed number of lines that start off squashed
 at the top, and then expand to fill the window so that it looked
 like Venetian blinds lowering. I want this effect to happen
 slowly, but I still want smooth animation of the moving dot.
 Therefore, I use the mod operator (%) and frameCount to only
 increase the line spacing on certain frames.
*/
int spacing;  // spacing in a series of lines
int bx;         // x value of moving dot

void setup() {
  size(200, 200);
  stroke(255);
  fill(255);
  frameRate(30);
  
  spacing = 1;
  bx = 0;
}

void draw() {
  background(0);

  // Draw a series of 10 lines starting at the top, spaced 
  // according to incrememnt.
  int y = 0;
  for (int i = 0; i < 10; i++) {
    line(0, y, width, y);
    y += spacing;
  }
  
  // draw the dot
  ellipse(bx, 40, 5, 5);
  
  // Increase the y value spacing on every third frame.
  if (frameCount % 3 == 0 && spacing < 20) {
    ++spacing;
  }
  bx += 2;
}

