
Button[] buttons = new Button[5];

void setup() {
  size(500, 250);
  smooth();
  
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = new Button(i*100+25, height/2-25, random(10, 100), random(10, 100)); 
  }
}

void draw() {
  background(255);

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display(); 
  }
}

void mousePressed() {

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].click(mouseX, mouseY); 
  }
}



