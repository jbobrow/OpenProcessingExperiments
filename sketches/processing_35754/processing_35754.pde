
void setup() {
  smooth();
  size(300, 300);
  colorMode(HSB);
}

int x = 80;
int y = 50;
int z = 15;

void draw() {
  //Color Background
  background(mouseX, 150, 255);

  //Tofu
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(mouseX, (height/2)-z, 2*z, 2*z);
  fill(0);
  ellipse(mouseX+8, height/2, z/3, z/3);
  ellipse(mouseX+20, height/2, z/3, z/3);
  stroke(1);
  line(mouseX+8, (height/2)+5, mouseX+20, (height/2)+5);
  
  //EAT TOFU
  PFont font;
  font = loadFont("Helvetica-16.vlw");
  textFont(font);
  text("EAT TOFU!", mouseX-25, 125);
  
  
  //Frame
  noStroke();
  fill(255);
  rect(0, 0, y, height);
  rect(0, 0, width, x);
  rect(width-y, 0, y, height);
  rect(0, height-x, width, x);
  
  //TV
  fill(0);
  rect(y, x, width-2*y, z);
  rect(y, x, z, height-2*x);
  rect(y, height-x-z, width-2*y, z);
  rect(width-y-z, x, z, height-2*x);
  
  rectMode(CENTER);
  rect(width/2, 240, width/3, 10);
  rect(width/2, 225, 10, 20);
}

