
void setup() {
  size(400, 400);
  background(5);
}


void draw() {

  background(5);
  textAlign(CENTER);


  for (int i = 0; i<width; i+=10) {

    for (int j = 0; j<height; j+=10) {

      float s = 1000/int((1+dist(mouseX, mouseY, i, j)));

      textSize(s);

      if (dist(mouseX, mouseY, i, j)<10) {
        textSize(1);
      }
      //println(s);
      text('a', i, j+(s/4));
    }
  }
}



