
void setup() {
  size(500, 500);



  noStroke();
}

void draw() {
  background(255);

  for (int i = 0; i< width; i = i +20) {
    for (int j = 00; j< height; j = j +60) {


      fill(#06FF0C, 5);
      //ellipse(mouseX, mouseY, 10, 10);

      noStroke();


      triangle(i, i+mouseX, j, i, i, j);

      fill(#DCF90B, 7);
      triangle(mouseY, i, i,i, i, j);


      fill(#0BDDF9, 7);
      triangle(mouseX, i, j, i, i, j);
    }
  }
}



