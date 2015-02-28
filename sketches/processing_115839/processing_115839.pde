
PImage img1, img2, img3; 
float angle = 0; 
void setup() {
  size(800, 500); 
  background(0); 
  img1 = loadImage("5.png");
  img2 = loadImage("7.png");
  img3 = loadImage("2.png");
}
void draw() {
  image(img1, 100, 100);

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  


  image(img3, mouseX, mouseY);
  println(mouseX +":"+ mouseY);

  angle += 0.01;
  // angle = angle +0.01;
}
void keyPressed() {
  save("test.png");
}
