
int startX = 700; // Initial x-coordinate
int stopX = 800; // Final x-coordinate
int startY = 120; // Initial y-coordinate
int stopY = 120; // Final y-coordinate
float r = startX; // Current x-coordinate
float y = startY; // Current y-coordinate
float step = 0.06; // Size of each step (0.0 to 1.0)
float pct = 0.0; // Percentage traveled (0.0 to 1.0)
int radius = 40;
float x = -radius;
float speed = 2.0;
float angle = 0.0;

void setup() {
  size(1000,600);
  smooth();
  fill(0);
  img=loadImage("Untitled-1.png");
  myFont = loadFont("GearedSlab.ttf");
  textFont(myFont);
}

void draw(){
  background(255);

    if (mousePressed == true) {
r = startX + ((stopX-startX) * pct);
y = 120;
pct += step;
} 
  if (x > width+radius) { 
x = -radius; 
  }
ellipse(r, y, 20, 20);
image(img,50,100);
fill(100);
translate(mouseX, mouseY);
scale(sin(angle) + 0.5);
rotate(angle);
line(-15, -15, 30, 30);
angle += 0.1;
  fill(0);
}


