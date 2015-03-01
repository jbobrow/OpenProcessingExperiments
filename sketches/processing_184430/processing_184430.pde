
/*--------------------------------------------------------
Casey Hamilton, Mouse Hover Lab 2/3/2015
--------------------------------------------------------*/

void setup() {
  size(500, 250);
}

void draw() {
  fill(80, 105, 150); //blue
  rect(height/2, width/8, height, width/5); //base rectangle

  if (mouseY > width/8 && mouseY < width/8 + width/5) {  //sets y range inside rectangle
    if (mouseX< height && mouseX > height/2) { //sets x range on left side of rectangle
      fill(250, 10, 20); //red
      rect(height/2, width/8, height/2, width/5); //left side of rectangle
    } else if (mouseX> 250 && mouseX < width - height/2) { //sets x range on right side of rectangle
      fill(10, 200, 30); //green
      rect(height, width/8, height/2, width/5); //right side of rectangle
    }
  }
}





