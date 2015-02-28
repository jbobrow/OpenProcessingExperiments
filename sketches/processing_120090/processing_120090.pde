
PImage myImage1, myImage2, myImage3, myImage4, myImage5, myImage6, myImage7, myImage8, myImage9, myImage10, myImage11, myImage12, myImage13, myImage14;
void setup() {
  size(800, 800);
  myImage1 = loadImage("design1.png");
  myImage2 = loadImage("design3.png");
  myImage3 = loadImage("design4.png");
  myImage4 = loadImage("design5.png");
  myImage5 = loadImage("design6.png");
  myImage6 = loadImage("design7.png");
  myImage7 = loadImage("design8.png");
  myImage8 = loadImage("design9.png");
  myImage9 = loadImage("design10.png");
  myImage10 = loadImage("design11.png");
  myImage11 = loadImage("design12.png");
  myImage12 = loadImage("design13.png");
  myImage13 = loadImage("design15.png");
  myImage14 = loadImage("design16.png");
  
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
}

void keyPressed() {
  save("image" + counter + ".png");
}


