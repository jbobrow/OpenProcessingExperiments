
import processing.pdf.*;
PImage img1, img2, img3; 
float angle = 0; 
void setup() {
  size(800, 500); 
  background(0); 

  
  img1 = loadImage("5.jpg");
  img2 = loadImage("18.jpg");
  img3 = loadImage("2.jpg");
}
void draw() {
  image(img1, 700, 700);

  pushMatrix();
  translate(width/3, height/3);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  


  image(img3, mouseX, mouseY);
  println(mouseX +":"+ mouseY);

  angle += 10;
  // angle = angle +0.01;
}
void keyPressed() {

}



