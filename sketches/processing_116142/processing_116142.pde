

PImage img1, img2, img3, img4, img5, img6, img7; 
float angle = 0;

void setup() {
  size(800, 800); 
  background(0); 
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  
  
  
}

void draw() {
  //image(img1, 100, 100);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img7, -600, -600,1200,1200);
  
  popMatrix();  
  
  angle += 0.5;
  angle += 0.01;

 /* pushMatrix();
  translate(width/2,height/2);
  image(img5,-35,-30,70,70);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img4, 0, 0);
  popMatrix();  

  pushMatrix();
  angle += 0.05;
  translate(width/2, height/2);
  rotate(angle);
  image(img2, 0, 0);
  popMatrix();  

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle+7);
  image(img3, 0, 0);
  popMatrix();  

  image(img1, mouseX, mouseY);

 


  angle += 0.03;
  angle = angle +0.01;
  
  */
}

void keyPressed() {
  saveFrame("work_###.png");
}



