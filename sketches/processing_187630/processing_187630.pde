
int button_x = 30;
int button_y = 30;
int button_size = 50;

void setup() {
  size(800, 500);
}
void draw() { 
  background(180);
  button_x = button_x + 3;
  button_y += 4;
  if (button_x>width) {
    button_x = 0;
  }
  if (button_y>height) {
    button_y = 0;
  }
  if (
      (mouseX > button_x) && (mouseX < button_x + button_size) && 
      (mouseY > button_y) && (mouseY < button_y + button_size)
     ) {
      fill(200, 30, 30);
  } else {
    fill(255);
  }
  rect(button_x, button_y, button_size, button_size);
}
