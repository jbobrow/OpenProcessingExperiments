

PImage myImage1, myImage2;

void setup() {
  size(800, 800);
  myImage1 = loadImage("Evans Motif 6.png");
  myImage2 = loadImage("Evans Motif 1.png");
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
  image(myImage2, mouseX, mouseY, w2/2, h2/2);
  
  counter++;
  println(counter);
}

void keyPressed() {
  save("image" + counter + ".png");
  final int k = keyCode;
  if (k=='S')
  if(looping) noLoop();
  else  loop();
}

