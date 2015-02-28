
void setup() {
  background (0);
  size(400, 400);
}

void draw() {
  for (int a=0; a<width; a+=30) {    //grid setup
    for (float b=0; b<height; b+=30) {
      house(a, b);
    }
  }
}


void house(float x, float y) {
  pushMatrix(); // draws crossing lines
  translate(x, y);
  stroke(255, 0, 230);
  strokeWeight(3);
  line (0, 0, 40, 40);
  
  stroke(20, 255, 0);
  line (15, 0, 0, 40);
  popMatrix(); // reset the matrix
}

void keyPressed(){
  if((key == 's') || (key == 's')){    //saves screanshot image
   save("image.jpg");
   println("Image saved.");
  }
}

