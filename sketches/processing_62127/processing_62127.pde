
void setup(){
size(500, 500);
smooth();
}

void draw(){
  background(255);
  for(int i = 50; i < width; i = i + 20) { 
    for(int j = 50; j < height; j = j + 100) {
      stroke(0,99);
      noFill ();
        triangle (i,j,40,60,mouseX,mouseY );
        triangle (mouseX,mouseY,40,j,i,300);
      fill(255);
        bezier (mouseY,mouseX,40,j,i,300,j,i);
      noFill ();
        triangle (mouseX,mouseY,40,60,j,i);
        triangle (mouseX,mouseY,j,i,i,j);
  }
  }
}
