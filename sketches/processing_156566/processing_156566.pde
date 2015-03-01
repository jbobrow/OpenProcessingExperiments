
PImage img1;
PImage img2;
float posX;
float posY;
int scale = 200;
color c;

float posX2;
float posY2;
int ellipseColor = 0;



void setup() {
  size(800, 600);
  img1 = loadImage("img1.png");
  img2 = loadImage("img2.jpg");

  imageMode(CENTER);
  //if you are using alot of images you can put imageMode(CENTER); into the void setup so it will apply to all images
}

void draw() {
 
  rect(0,0, width, height);
  posX2 += (mouseX - posX2)*0.01;
  posY2 +=(mouseY - posY2)*0.01;
 
  fill(ellipseColor);
  ellipse(posX2, posY2, 20, 20);
    
  
  //background(255);
  color posColor =img2.get(mouseX, mouseY);
  fill(posColor);
  ellipse(mouseX, mouseY, 100, 100);
  
   float posB = brightness(posColor); 
  //does same thing as getting color just does brightness
  fill(posB);
  rect(0, 90, posB, 30);
  
  float posRed = red(posColor);
  //float b/c you only want one single number, returning red value at every pixel
  fill(255, 0, 0);
  rect(0, 0, posRed, 100);

  float posGreen = green(posColor);
  fill(0, 255, 0);
  rect(0, 30, posGreen, 30);
  
  float posBlue = blue(posColor);
  fill(0, 0, 255);
  rect(0, 60, posBlue, 30);
  
  
  tint(mouseX/2, mouseY, (mouseX + mouseY)%10);

  //image(fish, sin(frameCount/float(500)), cos(frameCount/float(500)));
  //trigonmetric function
  //if you think   image(fish, sin(frameCount/float(500)), cos(frameCount/float(500))); > is too long to add then you can also add the floats at the top.
  //also add int scale = 200 at top
  //then you'll add

  //draw img1
  pushMatrix();
  posX = sin(frameCount/float(500)) * scale;
  posY = cos(frameCount/float(500)) * scale;
  translate(width/2, height/2);
  rotate(frameCount/float(100));
  //now the fish will rotate at the same time as the cat
  image(img1, posX, posY);
  popMatrix();

  //draw img2
  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/float(500));
  //the rotate is relative to the 0,0 point on the screen. So you might want to move that relative point. There is another function called "translate"
  //translate will help you move the coordinate system of the window so we set it above to the width/2, height/2
  //when you make a new coordinate system with translate you'll have to change the image(cat, width/2, height/2); to (0,0)
  image(img2, 0, 0);
  //we keep the image(cat, 0, 0) instead of posX, posY like above because we just want the fish to move around posX posY (around the circle according to the new coordinate system)
  //image(cat, width/2, height/2);
  popMatrix();
  //pushMatrix and popMatrix constrains the translate only in coordinance with the cat.img
}

void keyPressed() {
  saveFrame();
}


