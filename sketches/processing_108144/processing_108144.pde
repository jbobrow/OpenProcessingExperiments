
float xoffset = 10;
float yoffset = 10;

void setup() {
  size(1000, 1000);
  //smooth();
  noFill();
  frameRate(30);

  background(255,255, 255);
}

void draw() {
  background(255,255, 255);

  int i = 1000;
  
  while (i > 0) {
    color e = color((i + mouseX * 2) % 256 ,(i - mouseY * 3) % 256, 90);
    
    fill(e);
    ellipse(500,500 , i + mouseX +10 , i+mouseY +10);
    i = i - 20; 
  }
}
