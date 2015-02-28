
int x = 9999999;
float easing = 0.2;
void setup() {
  size(600, 600);
}
void draw() {
  float randr = random(0, 255);
   float randg = random(0, 255);
   float randb = random(0, 255);
  if(mousePressed) {
    background(randr * .1, randg * .4, randb *.9);
   } else {
    background(0);
  }
   int targetX = mouseX;
 x += (targetX - x) * easing;
fill(randr, randg, randb);
textSize(50);
text("Hammer Time", 150, 300);
rect(x - 105, 50, 240, 110);
rect(x, 160, 30, 330);
ellipse(x + 15, 505, 50, 50);
}



