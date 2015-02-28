
PImage myImage, myImage2, myImage3;
float minX, maxX, minY, maxY;

void setup() {
  background(0);
  size(800,800);
  myImage = loadImage("Sumi-e Grey.png"); //load the image
  myImage2 = loadImage("Diffuse.png");
  myImage3 = loadImage("Watercolour.png");
  imageMode(CENTER);
  frameRate(15);
  
  minX = -width/2;
  maxX = width/2;
  minY = -height/2;
  maxY = height/2;
}

int counter= 0;

void draw() {
  //background(255);
  pushMatrix();
  
  rotate(random(0,2*PI));
  //scale(0.5);
  
  float w1 = myImage.width; 
  float h1 = myImage.height;
  
  float x1 = random(0,width);
  float y1 = random(0,height);
  float s1 = random(0.1,10);
  
  tint(255,0,frameCount%255,frameCount%100);
  image(myImage,x1,y1,w1/s1,h1/s1);
  
  popMatrix();
  
  float w2 = myImage2.width;
  float h2 = myImage2.height;
  
  tint(255);
  image(myImage2,mouseX,mouseY,w2/10,h2/10);
  
  counter++;
  println(counter);
}

boolean loop = true;    //stop when space
void keyPressed() {
  if(key ==' ') {
    loop = !loop;
    if(loop) loop();
    else noLoop();
  }
  
  save("image" + counter + ".png");
}

void mousePressed() {
  if (mousePressed == true) {
    tint(#FFD743);
  } else {
    tint(255);
  }
  float w1 = myImage.width; 
  float h1 = myImage.height;
  
  float x1 = random(0,width);
  float y1 = random(0,height);
  float s1 = random(0.1,10);
  image(myImage,x1,y1,w1/s1,h1/s1);
}

