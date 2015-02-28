
PImage myImage1, myImage2;
float minX, maxX, minY, maxY;

void setup() {
  size(600, 600);
  myImage1 = loadImage("Motif - 9.png");
  myImage2 = loadImage("Motif - 12.png");
  imageMode(CENTER);
  
  minX = -width/2;
  maxX = width/2;
  minY = -height/2;
  maxY = height/2;
  
  background(50, 50, 0);
}


int counter = 0;

void draw() {
  //pushMatrix();
  
  
  
  
  float w1 = myImage1.width;
  float h1 = myImage1.height;
  
  float x1 = random(0, width);
  float y1 = random(0, height);
  float s1 = random(0.1, 200);
  
  tint(255, 255, 255, 200);
  image(myImage1, x1, y1, w1/s1, h1/s1);
  
  //popMatrix();
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  
  tint(50,50,255,200);
  image(myImage2, mouseX, mouseY, w2/10, h2/10);
  
  counter++;
  println(counter);
}

void keyPressed() {
  save("image" + counter + ".png");
  
  final int k = keyCode;
  if(k=='S')
  if(looping) noLoop();
  else  loop();
 
}

