

PImage img1, img2, img3; 
float angle = 0; 
void setup() {
  size(800, 500); 
  background(#DDFF79); 
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("img3.jpeg");
}
void draw() {
  /*image(img1, 0, 0); */
  


  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img1, 0, 0);
  popMatrix(); 


   image(img2, mouseX, mouseY);
  println(mouseX +":"+ mouseY);
  rotate(angle); 
  image(img2, 0, 0);
  
  
  rotate(angle); 
  image(img2, 500, 500);

  //angle += 0.01;
  angle = angle +3;
 
}
 
void keyPressed() {
  save("test.png");
}



