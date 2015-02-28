
Robot tom;
Robot tabby;

void setup() {
  size(360, 320);
  smooth();
  tom = new Robot(80, 124, 0.01);
  tabby = new Robot(240, 124, 0.01);
}

void draw() {
  background(255);
  tom.shiftyEyes();
  tom.flashing();
  tom.display();
  tabby.shiftyEyes();
  tabby.flashing();
  tabby.display();
}
  

