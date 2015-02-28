
// for(Initialisierung; Test; Aktualisierung)

void setup() {
size(300, 300);
smooth();
}

void draw() {
  background(200);


if(mousePressed){
  for (int i = 0; i <= height; i = i+6) {
    for (int j = 0; j <= height; j = j+6) {
      stroke(1);
      line (mouseY, mouseX, i, j);
    }
  } 
}else{
  for(int i = mouseX; i <= mouseX; i = i + 5){
  for(int j = 0; j < height; j = j + 20){
    fill(i);
    stroke(0,2);
    ellipse(mouseY, mouseX, 15, 15);
  }
}
}
}

