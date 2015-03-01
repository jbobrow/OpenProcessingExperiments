
PFont myFont;      // STEP 1: the font to be used
float xSize = 10;

void setup() {
  size(800, 600);

  String [] fonts = PFont.list();
  println("Fonts available:");
  println(fonts);

  // STEP 2: create the font object and reference it to myFont
  // Using the Arial font, 16 point with antialiasing (smoothing)
  myFont = createFont("Arial", 16, true); 

  // STEP 3: use myFont at size 24
  textFont(myFont, 24);

  // set the fill colour to white
  fill(255);
}

void draw() {
  // clear the screen to black
  background(0);

  // get the current mouse position as a string in the form "(x,y)"
  String mousePosition = "(" + str(mouseX) + "," + str(mouseY) + ")";

  // STEP 4: display the mousePosition string at the current mouse location
  if (mouseX >= 700) {
  text(mousePosition, (mouseX-100), mouseY);
  }
  else {
  text(mousePosition, mouseX, mouseY);
  }
  if (mouseY <= 50) {
  text(mousePosition, mouseX, (mouseY+20));
  }
  else {
  text(mousePosition, mouseX, mouseY);
  }
  if (mouseY <= 50 && mouseX >= 700) {
  text(mousePosition, (mouseX-100), (mouseY+20));
  }
  else {
  text(mousePosition, mouseX, mouseY);
  }
  // draw the red '+' at the mouse location
  stroke(255, 0, 0);
  line(mouseX - xSize, mouseY, mouseX + xSize, mouseY);
  line(mouseX, mouseY - xSize, mouseX, mouseY + xSize);
}

