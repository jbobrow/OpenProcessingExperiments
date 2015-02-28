
PImage img1, img2, img3, img4, img5;
float angle = 0;
float easing = 15;

void setup() {
  size(800, 500); 
  background(0,100,255); 
  img1 = loadImage("14.png");
  img2 = loadImage("2.png");
  img3 = loadImage("4.png");
  img4 = loadImage("9.png");
  img5 = loadImage("18.png");
  
}
void draw() {
 
  pushMatrix();
  rotate(angle);
  image(img4,0,300);
  popMatrix();
  
  image(img1, 150, 5);
  
  pushMatrix();
  rotate(angle);
  image(img4,0,0);
  popMatrix();
  
  image(img2, 450, 5);

  pushMatrix();
  rotate(angle);
  image(img4,0,650);
  popMatrix();  
  
  image(img3, 15, 5);
  
  image(img5, mouseX-100, mouseY-100);

  angle += 90;

}
void keyPressed() {
  save("test.png");
}



