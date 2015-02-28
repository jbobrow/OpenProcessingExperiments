
/* a little helper to select a HSB color range, 
   mouseX change saturation, 
   mouseY change brightness, 
   space to switch background (black or white), 
   c to update random tints (16 with current saturation & brightness properties)
   
   emoc / 06/2009
*/

PFont font;
int xOffset = 80;
int yOffset = 80;
color black, white;
color bg;
boolean switchBg = false;
float[] nb = new float[16];

void setup() {
  colorMode(HSB);
  black = color(0,0,0);
  white = color(0,0,255); // white in HSB
  size(800, 800); 
  font = createFont("arial", 8);
  textFont(font);
  bg = black;
  updateRandomTints();
}

void draw() {
  background(bg);
  float x = map(mouseX, 0, width, 0, 255); // map mouseX to saturation
  float y = map(mouseY, 0, height, 0, 255); // map mouseY to brightness
  
  // draw all tints with these saturation & brightness properties
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {

      fill( i + (16 * j), x, y);
      rect( i*40 + xOffset, j*40 + yOffset, 40, 40);
      stroke(bg);
      fill( i + (16 * j), 0, (y + 128)%255 );
      text("H " + (i+(16*j)), (i*40) + xOffset + 2, 14 + j*40 + yOffset);
      text("S " + (int)x, (i*40) + 2 + xOffset, 26 + j*40 + yOffset);
      text("B " + (int)y, (i*40) + 2 + xOffset, 38 + j*40 + yOffset);
    }
  }
  // 16 random colors with these saturation & brightness properties
  
  for(int i = 0; i < 16; i++) {
    fill( nb[i], x, y);
    rect ( i*40 + xOffset, 740, 40, 40);
  }
}


void keyPressed() {
  if (key == ' ') {
    if (switchBg) {
      switchBg = false;
      bg = black;
    } else {
      switchBg = true;
      bg = white;
    }
  }
  if ((key == 'c') || (key == 'C')) updateRandomTints();
}

void updateRandomTints() {
  for (int i = 0; i < 16; i++) {
    nb[i] = random(0, 255);
  }
}


