
int weight = 0;
int blue = 0;

void setup() {
size (600, 600);
background(255);
frameRate(15);
}

void draw() {
  
int x1 = random(175, 200);
int y1 = random(175, 200);
int x2 = random(180, 200);
int y2 = random(200, 250);
int x3 = random(100, 150);
int y3 = random(200,250);
int x4 = mouseX;
int y4 = mouseY;
int red = random(25, 175);


if (mousePressed) {  
smooth();
noFill();
stroke(red, 0, blue);
strokeWeight(weight);
bezier(x1, y1, x2, y2, x3, y3, x4, y4);
bezier(x1, y1, 200, 150, 250, 150, 265, 150);
}
}

void mouseClicked() {
  blue = blue + 10;
}







