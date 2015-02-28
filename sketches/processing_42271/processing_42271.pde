
float speedX = 3;

void setup() {
  size(640, 120);
  //smooth();
  noStroke();
}

void draw() {
  // Increase the text speed based on exec time
  speedX+=millis()/1500;
  // Draw the text
  fill(0, 95);
  rect(0, 0, width, height);
  // Load font
  PFont font;
  font = loadFont("Silkscreen-12.vlw"); 
  textFont(font, 48); 
  fill(0, 255, 255);
  text("can you read me?", speedX++, height / 2 + 12);
  // Create the marquee effect
  if (speedX > width) {
    speedX = speedX * -1;
  }
}


