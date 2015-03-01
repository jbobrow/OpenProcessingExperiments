
void setup(){
size(1000, 1000);
background(12,52,5);
noSmooth();
noStroke();
frameRate(6.3);
}

void draw() {
  //background(random(50, 255),random(50, 255),random(50, 255));
  for (int y=50; y<=height-500; y+=25) {
    for (int x=50; x<=width-500; x+=25) {
      fill(random(0, 255),random(50, 72),random(50, 60));
      ellipse(mouseX-250 + x, mouseY-250 + y, 50, 50);
    }
  }

if (mousePressed == true) {
  if (mouseButton == LEFT) {
    background(12,52,5); {
  
} 
}
}

}
