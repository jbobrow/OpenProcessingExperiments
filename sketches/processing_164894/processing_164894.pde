
PImage alphaImg1;
PImage alphaImg2;
PImage alphaImg3;
PImage alphaImg4;

void setup() { 
  size(700, 500); 
  smooth(); 
 
  alphaImg1 = loadImage("dog-02.png");
  alphaImg2 = loadImage("dog-03.png");
  alphaImg3 = loadImage("dog-04.png");
  alphaImg4 = loadImage("dog-05.png");
}
void draw() {
  background(255);
  int ix = mouseX - alphaImg1.width/2; 
  int iy = mouseY - alphaImg1.height/2; 
  image(alphaImg1, ix, iy);
  // If the 'A' key is pressed draw a line
  if ((keyPressed == true) && (key == 'A')) {
    image(alphaImg2, mouseX+alphaImg2.width/2, mouseY+alphaImg2.width/2);
  } else if ((keyPressed == true) && (key == 'B')) {
    image(alphaImg3, mouseX+alphaImg3.width/2, mouseY);
  } else if ((keyPressed == true) && (key == 'C')) { 
    image(alphaImg4, mouseX+alphaImg4.width/2, mouseY-alphaImg4.width/2);
  }
  fill(237,109,0);
textAlign(CENTER);
text("try 'A','B','C'", width/2, height/4);
}




