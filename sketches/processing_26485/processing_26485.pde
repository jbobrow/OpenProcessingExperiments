
Snake s0;
Snake s1;

void setup() {
  size(400, 200);
  smooth();

  s0 = new Snake();
  s1 = new Snake();
}

void draw() {
  background(255);
  

  s0.update(mouseX-30, mouseY);
  s0.display();


  s1.update(mouseX+30, mouseY);
  s1.display();  
}


