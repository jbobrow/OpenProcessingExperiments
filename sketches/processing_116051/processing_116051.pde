
import netscape.javascript.*;

PImage img1, img2, img3, img4;
float angle = 0; 
void setup() {
  size(800, 500); 
  background(0); 
  img1 = loadImage("3.jpg");
  img2 = loadImage("6.jpg");
  img3 = loadImage("1.jpg");
  img4 = loadImage("7.jpg");
}
void draw() {
 // image(img4, 0, 0);


  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  


  image(img2, mouseX, mouseY);
  println(mouseX +":"+ mouseY);

  angle += 0.08;
  // angle = angle +0.01;
  
  pushMatrix();
  translate(width/3, height/3);
  rotate(angle);
  image(img4, 0, 0);
  popMatrix();  
angle += 0.58;
  // angle = angle +0.01;
}
void keyPressed() {
  save("test.png");
}


