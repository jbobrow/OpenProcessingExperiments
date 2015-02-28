
PImage myImage1, myImage2, myImage3;

void setup() {
  size(800, 800);
  myImage1 = loadImage("Design1Yellow.png");
  myImage2 = loadImage("design4.png");
  myImage3 = loadImage("Photoshop.png");
  imageMode(CENTER);
  
  background(255);
}

int counter = 0;

void draw() {
  //pushMatrix();
  
  rotate(random(0, 2*PI));
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 10);
  
  tint(255, 255, 255, 50);
  image(myImage1, x1, y1, w1/s1, h1/s1);
  
  //popMatrix();
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  
  tint(255);
  image(myImage2, mouseX, mouseY, w2/10, h2/10);
  
  counter++;
  println(counter);
  
  float w3 = myImage3.width;
  float h3 = myImage3.height;
  
  tint(255,0,0,100);
  image(myImage3, 400, 400, w2/10, h2/10);
}

void keyPressed() {
  save("myImage2" + counter + ".png");
}

