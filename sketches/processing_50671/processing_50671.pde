

Walker w;

void setup() {
  size(400,400);
  frameRate(10);
  smooth();

  // Create a walker object
  w = new Walker();

}

void draw() {
  background(255);
  // Run the walker object
  w.walk();
  w.render();
}

