
PFont myFont;
PImage numbers[] = new PImage[6];
import ddf.minim.*;    // for sounds
Minim minim;           // for sounds
AudioPlayer sound;     // for sounds

void setup() {
  int i;
  String filename;
  size(480, 480);
  background(255, 255, 255);
  fill(0, 0, 0);
  smooth();
  noStroke();
  frameRate(24);
  myFont = createFont("MS Gothic", 24, true);
  textFont(myFont);
  for(i = 0; i < 6; i++) {     // loads the images
    filename = "images/" + str(i + 1) + ".png";
    numbers[i] = loadImage(filename);
  }
  minim = new Minim(this);
  sound = minim.loadFile("se_maoudamashii_se_switch01.wav");   // loads the sound
}

int r1 = 0;  // random number
int r2 = 0;  // random number
int rollButtonX = 200;
int rollButtonY = 400;
int rollButtonW = 80;
int rollButtonH = 30;
int buttonRed = 0;          // button color
int buttonGreen = 0;        // button color
int buttonBlue = 255;       // button color
int buttonTextColor = 255;
boolean checkBox1 = true;      // checkBox status

void draw() {
  background(200);
  text("単位数",350,440);
  image(numbers[r1], 50, 50, 150, 150);
  image(numbers[r2], 250, 50, 150, 150);
  drawButton(rollButtonX, rollButtonY,
             rollButtonW, rollButtonH,
             "roll");
  drawCheckBox1(100, 250);
  stroke(0);
  text(r1 + r2 + 2, 440, 440);
}
  
void mouseReleased() {
  if(mouseX >= rollButtonX && mouseX <= rollButtonX + rollButtonW &&
     mouseY >= rollButtonY && mouseY <= rollButtonY + rollButtonH) {
    r1 = floor(random(0, 6));
    r2 = floor(random(0, 6));
  }
}

void mousePressed() {
  if(mouseX >= rollButtonX && mouseX <= rollButtonX + rollButtonW &&
     mouseY >= rollButtonY && mouseY <= rollButtonY + rollButtonH) {
    sound.rewind();
    sound.play();
  }
}

void drawCheckBox1(int x, int y) {
  fill(255);
  stroke(0);
  rect(x, y, 30, 30);
  if(checkBox1) {
    fill(0);
    text("✓", x + 4, y + 24);
  }
}

void drawButton(int x, int y, int w, int h, String s) {
  if(mousePressed == true &&
     mouseX >= rollButtonX && mouseX <= rollButtonX + rollButtonW &&
     mouseY >= rollButtonY && mouseY <= rollButtonY + rollButtonH) {
    fill(255);
    stroke(0);
    rect(x, y, w, h, 7);
    fill(0);
  }
  else {
    fill(buttonRed, buttonGreen, buttonBlue);
    stroke(0);
    rect(x, y, w, h, 7);
    fill(buttonTextColor);
  }
  text(s, x + 15, y + 23);
}


