
int CS;
int count;
PImage myChar;

void setup() {
  
  size(512, 512);
  frameRate(60);

  CS = 16;
  count = 0;
  myChar = loadImage("girl.png");
  
}

void draw() {
  
  background(128);
  
  image(myChar, width/2, height/2, CS*2*4, CS*4);
  
  copy(myChar, (floor(count/16)%2)*CS, 0, CS, CS, mouseX, mouseY, CS*4, CS*4);

  count++;
}

