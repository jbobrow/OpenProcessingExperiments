
void setup() {
  size(600, 600);
  smooth();
  background(222);
}

void draw() {
  if (mouseX<mouseY) {
fill(205,20,0,27);


    
  } else if (mouseX==mouseY) {
fill(185,40,0,87);

  }
  else {
    fill(20,55,60,20);
  }
  ellipse(300, 300, mouseX, mouseY);

}

