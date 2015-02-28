
// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code

WalkerTortoise t;  //tortoise
WalkerHare h;  //hare

void setup() {
  size(400, 400);
  frameRate(30);

  // Create 2 new walker object
  t = new WalkerTortoise();
  h = new WalkerHare();

}

void draw() {
  background(255);
  
  
  stroke(0);
  line (0, height/2 - 20, width, height/2 - 20);
  line (0, height/2 + 20, width, height/2 + 20);  

  noStroke();
  for (int i= 20; i < 400; i+=40){
    fill(250,225,50);
    rect(i, height/2 - 1, 20, 2);
  }

  // Run the walker object
  checkEdges();
  t.walk();
  h.walk();

  t.render();
  h.render();
}


void checkEdges () {

  if (t.loc.x > width + 20 || h.loc.x > width + 20) {
    t.loc.x = -20;
    h.loc.x = -20;
  }
}


