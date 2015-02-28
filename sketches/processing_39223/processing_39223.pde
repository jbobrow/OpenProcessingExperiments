
PFont[] typos = new PFont[4];
char alph[] = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };


void setup() {
  
  // set window parameters
  size(800, 670);
  background(255);
  
  // Disable redrawing at screen refresh
  noLoop();
  
  noFill();
  noStroke();
  randomFillColour();
  
  typos[0] = loadFont("SohoBold.vlw");
  typos[1] = loadFont("Caslon.vlw");
  typos[2] = loadFont("Helvetica.vlw");
  typos[3] = loadFont("ATyp.vlw");

  textAlign(CENTER);
}

// Redraw when mouse is clicked/hold
void mouseDragged() {
  redraw();
}


// Function to define a random colour every time
void randomFillColour() {
  int r = floor(random(30, 200));
  int g = floor(random(30, 200));
  int b = floor(random(30, 200));

  fill(r,g,b, 180);
  //print("R " + r + ", G " + g + ", B" + b);
}

 
void draw() {
  randomFillColour();
  int diameter = floor(random(8, 24));
  
  
  // Set the font and its size (in units of pixels)
  textFont(typos[floor(random(0,3))], floor(random(18, 32)));
  
  
  text(alph[floor(random(0,25))], mouseX + random(-13, 12), mouseY + random(-12, 10));
  
  //ellipse(mouseX + random(-8, 8), mouseY + random(-8, 8), diameter, diameter);
  //line(mouseX, mouseY, pmouseX, pmouseY);
}

void keyPressed() {
  int keyIndex = -1;

  if (key >= 'a' && key <= 'z') {
  	keyIndex = (key - 'a') * 10;
  	print(key + " - " + keyIndex);
  	
  	
  	redraw();
  	background(keyIndex);
  }
}

