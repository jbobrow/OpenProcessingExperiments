
// Random Walker
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code

Walker t;  //tortoise
Walker h;  //hare

void setup() {
  size(400, 400);
  frameRate(30);

  t = new Walker (20, 20, 0, 1, -0.5, 0.5, 0, 200, 0);
  h = new Walker (20, 60, 0, 1, -100, 100, 125, 125, 125);
}

void draw() {
  background(255);


  stroke(0);
  line (0, height/2 - 20, width, height/2 - 20);
  line (0, height/2 + 20, width, height/2 + 20);  

  noStroke();
  for (int i= 20; i < 400; i+=40) {
    fill(250, 225, 50);
    rect(i, height/2 - 1, 20, 2);
  }

  // Run the walker object
  t.checkEdges();
  h.checkEdges();
  t.walk();
  h.walk();

  t.render();
  h.render();
}




