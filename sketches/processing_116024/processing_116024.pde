
PImage img1, img2, img3; 
float angle = 0; 
void setup() {
  size(800, 500); 
  background(0); 
  img1 = loadImage("mario.png");
  img2 = loadImage("luigi.png");
  img3 = loadImage("bass.png");
}
void draw() {
  //image(img1, 0, 0);

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img1, 0, 0);
  popMatrix();  
  angle -= 0.01;
  image(img3, mouseX, mouseY);
  println(mouseX +":"+ mouseY);

 
  // angle = angle +0.01;
}
void keyPressed() {
  save("test.png");
}

