
PImage[] img1 = new PImage[4];

void setup (){
   
  size (450, 450);
  frameRate(20);
  
  img1[0] = loadImage("shape4.png");
  img1[1] = loadImage("shape3.png");
  img1[2] = loadImage("shape2.png");
  img1[3] = loadImage("shape1.png");
  
}
 
void draw(){
  background(0);
 
drawmyShapes();

pushMatrix();
 translate(150, 150);
 drawmyShapes();
popMatrix();

 
}
 
 
void drawmyShapes (){
  imageMode(CENTER);
  image(img1[int(random(4))], 180, 180);
  noStroke();
  smooth();
  fill(random(255), random(255), random(255));
  ellipse(random(width), random(height), 3, 3);
  ellipse(random(width), random(height), 6, 6); 
  ellipse(random(width), random(height), 7, 7);
   
}


