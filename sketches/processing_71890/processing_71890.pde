
float randomDiameter = 0;
float mouseX = 0;
float lineColor = 0;

void setup() {
  size(1200, 600);
  smooth();
  colorMode(RGB, 800);
  for (int i = 0; i < 1200; i++) {
    for (int j = 0; j < 600; j++) {
      stroke(i/1.2, j*3, 500);
      point(i, j);
    }
  }
}

void draw() {
  
  noFill();
  for (int i = 0; i<100; i=i+30){
    stroke(0);
    //line(mouseX, mouseY, randomDiameter, i*8);
    //line(randomDiameter, randomDiameter, i*3, mouseX);
    //line(mouseX, mouseY, randomDiameter, 600);
    arc(mouseX, mouseY, randomDiameter, randomDiameter, 0, PI);
  randomDiameter = random (5, 300);
  mouseX = random (300, 600);
  lineColor = random (0, 600);
  }

  if (randomDiameter < 200) {
    randomDiameter++;
  }
else {
  randomDiameter = 0;
}
if (mouseX < 800) {
  cursor(WAIT);

}
frameRate(30);
}

void mouseClicked() {
 if (lineColor == 0) {
    lineColor = 600;
  } else {
    lineColor = 0;
  }
}

void keyPressed(){
  if (key == 's'){
    save("AnaMernik01b.png");
  }
}
