
PImage img;
Animation animation1, animation2, animation3, animation4, animation5;

float xpos = 100;
float ypos = 100;
float bx;
float by;
float speed = 3;

void setup() {
  size(255, 173);
  frameRate(24);
  img = loadImage("levelExample.png");
  animation1 = new Animation("up", 3);
  animation2 = new Animation("left", 3);
  animation3 = new Animation("right", 3);
  animation4 = new Animation("down", 3);
  animation5 = new Animation("restFrame", 2);
}

void draw() {
  background(255);
  image(img, bx, by);
  character();
  println("bx =" + bx);
  println("by =" + by);
}

void character() {
  if(keyPressed){
  if (key == 'w') {
    animation1.display(xpos, ypos);
    if(by <= -3){
    by += speed;
    }
    else{
      by = by;
      ypos -= speed;
    }
  } 
  else if (key == 'a') {
    animation2.display(xpos, ypos);
    if(bx <= -3){
    bx += speed;
    }
    else{
      bx = bx;
      xpos -= speed;
    }
  }
  else if (key == 'd') {
    animation3.display(xpos, ypos);
    if(bx >= -255){
    bx -= speed;
    }
    else{
     bx = bx;
     xpos += speed;
    }
  }
  else if (key == 's') {
    animation4.display(xpos, ypos);
    if(by >= -173){
    by -= speed;
    }
    else{
      by = by;
      ypos += speed;
    }
  }
  }
  else{
    animation5.display(xpos,ypos);
  }
}

// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}


