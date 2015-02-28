
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/66302*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Lavie Sak
//Time-based lab

float xpos, ypos;    // Starting position of shape    
float diff, size;  //Calulates the distance between rings
float speed = 2.8;  // Speed of the shape
int colorCode = 1;  //key for color of fireworks

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

void setup() {
  size(800, 600);
  frameRate(30);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
} 

void draw() {
  background(255);
  smooth();
  noFill();
  strokeWeight(5);

  //The guts
  size_init();
  bounce();
  drawOlympicRings(xpos, ypos, size);
  drawFireworks();
  writeVictory();
}

//Sets the size of rings
void size_init() {
  // Width of the shape
  size = 150*noise(xpos*.05,ypos*.05);          
  diff = 10*(size/50);
}

//Sets the bounce parameters
void bounce() {
  // Update the position of the shape
  xpos = xpos + ( speed * xdirection );
  ypos = ypos + ( speed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }
}

//Draws olympic rings with precise olympic colors
void drawOlympicRings(float x, float y, float dim) {
  //Blue
  stroke(0, 41, 140);
  arc(x, y, dim, dim, 0, TWO_PI);
  //Yellow
  stroke(255, 239, 8);
  arc(x+2*diff, y+4*diff, dim, dim, 0, TWO_PI);
  //Black
  stroke(0, 0, 0);
  arc(x+4*diff, y, dim, dim, 0, TWO_PI);
  //Green
  stroke(8, 123, 57);
  arc(x+6*diff, y+4*diff, dim, dim, 0, TWO_PI);
  //Red
  stroke(222, 24, 24);
  arc(x+8*diff, y, dim, dim, 0, TWO_PI);
}

//Draw background "fireworks" randomly using the olympic colors
void drawFireworks() {
  int r = 0, g = 0, b = 0;
  colorCode = (int)random(1, 6);
  if (colorCode == 1) {
    r = 0;
    g = 41;
    b = 140;
  }
  else if (colorCode == 2) {
    r = 255;
    g = 239;
    b = 9;
  }
  else if (colorCode == 3) {
    r = 0;
    g = 0;
    b = 0;
  }
  else if (colorCode == 4) {
    r = 8;
    g = 128;
    b = 57;
  }
  else if (colorCode == 5) {
    r = 222;
    g = 24;
    b = 24;
  }
  fill(r, g, b);
  stroke(r, g, b);

  for (int x=0; x<500; x++) {
    ellipse(random(0, width), random(0, width), random(0, 3), random(0, 3));
  }
}

void writeVictory() {
  PFont font;
  font = loadFont("Chalkduster-120.vlw"); 
  textFont(font); 
  text("VICTORY!", 75, 20, 700, 500);
}


