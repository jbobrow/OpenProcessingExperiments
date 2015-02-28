
/*@pjs preload="apple_white.png";*/
PImage img;
float h;//color
float s;
float x;
float y;
int a;//alpha


void setup() {
  size(450, 450);//windowsize
  background(0);//black
  img = loadImage("apple_white.png");
  noFill();
  imageMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100, 100);
  a = 0;
}


void draw() {
  tint(h, a, 100, 255);
  image(img, width/2, height/2, 100+x, 100+x);
  fade();
}


void mouseDragged() {
  //red
  if (mouseButton == LEFT) {
    h = 120;
    a = 100;
  } 
  //bule
  else if (mouseButton == CENTER) {
    h = 240;
    a = 100;
  } 
  //green
  else if (mouseButton == RIGHT) {
    h = 0;
    a = 100;
  } 
  
  for (int i=0; i<=10; i+=5) {
    x = random(-50, 50);
    y = random(-50, 50);
    s = random(0, 100);
    stroke(h, s, s, 255);
    rect(mouseX+x, mouseY+y, 10+i, 10+i);
  }
  
  //line
  if (mouseX < width/2 && mouseY < height/2) {
    line(0, mouseY, mouseX, mouseY);
  }
  else if (mouseX >= width/2 && mouseY < height/2) {
    line(mouseX, 0, mouseX, mouseY);
  }
  else if (mouseX >= width/2 && mouseY >= height/2) {
    line(width, mouseY, mouseX, mouseY);
  }
  else if (mouseX < width/2 && mouseY >= height/2) {
    line(mouseX, height, mouseX, mouseY);
  }
}


//fadeout
void fade() {
  noStroke();
  fill(0, 0, 0, 5);
  rect(0, 0, width*2, height*2);
}


