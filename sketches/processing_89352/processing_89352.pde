
int numBubbles = 500;
Bubble[] bubbles;

void setup() {
  size (700, 700);

  PFont font;
  font = createFont ("Lily UPC Bold Italic", 48);
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  bubbles = new Bubble[numBubbles];
  for (int i = 0; i < numBubbles; i++) {
    bubbles[i] = new Bubble();
  }
}

void draw() {
  background (39, 21, 17);
  

  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].update();
    bubbles[i].render();
    if ( bubbles[i].loc.y < mouseY) {
      bubbles[i].reset();
    }
  }

  fill (135, 207, 255, 255);
  rect (0, 0, 700, mouseY);
    fill (0, 93, 0);
  rectMode(CENTER);
  rect (350, 363, 300, 50);
  rectMode(CORNER);
  fill (232, 53, 0);
  text("ROOTBEER", 350, 363);
}

class Bubble
{
  PVector loc;
  float speed;
  float radius;

  Bubble()
  {
    loc = new PVector (random (width), random(height));
    speed = random(0.5, 4);
    radius = random(2, 10);
  }

  void update()
  {
    loc.y -= speed;
  }

  void render()
  {
    fill (255, 50);
    noStroke();
    ellipse ( loc.x, loc.y, radius, radius);
  }

  void reset()
  {
    loc.x = random(width);
    loc.y = height + 50;
    speed = random(0.5, 4);
    radius = random (2, 10);
  }
}
