
PImage myImage1, myImage2, myImage3, myImage4;

void setup() {
  size(800, 800);
  myImage1 = loadImage("Dots Motif Blue Bevel.png");
  myImage2 = loadImage("Smaller Blue Shape.png");
  myImage3 = loadImage("Main RedGreen Shape 75% (larger).png");
  myImage4 = loadImage("Smaller Turquoise  Shape.png");
  imageMode(CENTER);
  
  background(255);
}
int counter = 0;

void draw() {
  pushMatrix();
  
println(frameCount);
  noStroke();
  fill(39,11,58,20);
ellipse(frameCount%width,frameCount%height,40,770);
  
  rotate(random(0, 2*PI));
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 10);
  
  tint(255, 255, 255, 50);
  image(myImage1, x1, y1, w1/s1, h1/s1);
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  float x2 = random(0, width);
  float y2 = random(0, height);
  float s2 = random(50, 100);
  
  tint(255);
  image(myImage2, x2, y2, w2/s2, h2/s2);
  
  counter++;
  println(counter);
  
  popMatrix();
}


void mousePressed() {
  pushMatrix();
  
  translate(mouseX, mouseY);
  rotate(random(0, 2*PI));
  image(myImage3, 0, 0, myImage3.width/5, myImage3.height/5);
  
  popMatrix(); 
}

  
  
void keyPressed() {
  if(key =='s') 
  save("image" + counter + ".png");
}

