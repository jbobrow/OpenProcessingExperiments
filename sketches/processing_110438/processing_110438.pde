
int value=0;
color b = color(50, 55, 200);
int x, y;
  float colorR, colorG, colorB, alpha;

void setup() {
  size(380,380);
  background(0);
frameRate(8);
smooth();
}

void draw() {
  noStroke();
  fill(0, 20);
  ellipse(200, 200, width, height);
  
x = floor(random(width));
y = floor(random(height));
colorR = random(225);
colorG = random(225);
colorB = random(225);
alpha = random(225);
stroke(colorR, colorG, colorB, alpha);

strokeWeight(1.5); // the lines become thicker
int num = 50;
int[] diameters = new int[num];
for (int i = 0; i < num; i++) {
  diameters[i] = int(random(800));
  ellipse(300, 300, diameters[i], diameters[i]);
}
  
  int dx = 30, dy = 30;
  for (int y = 10; y <= height-10; y = y + dy) {
    for (int x = 10; x <= width-10; x = x + dx) {
      ellipse(x,y,40,40);
    }
  }
  
  stroke(204, 102, 0); //color of the lines of the squares
  strokeWeight(3);
  fill(value); // all squares are in black
  rect(25, 25, 25, 25);
  rect(75, 75, 25, 25);
  rect(125, 125, 25, 25);
  rect(175, 175, 25, 25);
  rect(225, 225, 25, 25);
  rect(275, 275, 25, 25);
  rect(325, 325, 25, 25);
  rect(375, 375, 25, 25);
  }

// when you click on the canvas, the squares will turn blue 
void mouseClicked() {
  if (value == 0) {
    value = color(50, 55, 200);
  } else {
    value = 0;
  }
}



