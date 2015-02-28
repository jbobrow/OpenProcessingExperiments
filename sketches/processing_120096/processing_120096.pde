
PImage myImage1, myImage2;

void setup() {
  size(800, 800);
  myImage1 = loadImage("actual wing motif.png");
  myImage2 = loadImage("large_dragonfly_wing_stock__cut_out___png_by_imthinkingoutloud-d5oy8qs.png");
  imageMode(CENTER);
  
  background(255);
}

int counter = 0;

void draw() {
  pushMatrix();
  
  rotate(random(0, 2*PI));
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 10);
  
  tint(255, 266, 255, 50);
  image(myImage1, x1, y1, w1/s1, h1/s1);
  
  popMatrix();
  
  pushMatrix();
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  float s2 = random(0.5, 10);
  
  translate(mouseX, mouseY);
  rotate(random(0, 2*PI));
  
  tint (random(20, 255));
  image(myImage2, 0, 0, w2/s2, h2/s2);
  
  popMatrix();
  
  counter++;
  println(counter);
}

void keyPressed() {
  save("image" + counter + ".png");
}

//chihaoyo.me/code


