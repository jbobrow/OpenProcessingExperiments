
float speedX = 10;
float c= 100;
PFont font;

void setup() {
  size(400, 400);
  smooth();
  font = loadFont("Courier-48.vlw"); 
  textFont(font, 48); 
  fill(177, 213, 250);
  rect(0, 0, width, height);
}

void draw() {
  fill(177, 213, 250, c);
  rect(0, 0, width, height);

  fill(75, 113, 152);
  text("I'm a text", speedX++, height / 2 + 12);

  if (speedX > width) {
    speedX = speedX * -1;
    c = c-20;
  }
  
  speedX = speedX + 3;
}


