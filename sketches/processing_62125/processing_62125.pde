
void setup(){
size(500, 500);
smooth();
}

void draw(){
  background(255);
  for(int i = 50; i < width; i = i + 40) { 
    for(int j = 50; j < height; j = j + 40) {
      stroke(0,99);
      noFill ();
      bezier (mouseX , mouseY, i, i, 500, 40, j, 10-100 );
  }
  }
}
