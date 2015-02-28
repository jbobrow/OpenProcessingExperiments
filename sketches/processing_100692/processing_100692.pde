
PImage img;
Animation animation1, animation2, animation3, animation4, animation5;

float xpos = 150;
float ypos = 150;
float bx;
float by;
float speed = 3;

void setup() {
  size(625, 393);
  frameRate(24);
  img = loadImage("SoccerField.png");
  animation1 = new Animation("up", 5);
  animation2 = new Animation("left", 5);
  animation3 = new Animation("right", 5);
  animation4 = new Animation("down", 5);
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
  if (keyPressed) {
    if (key == 'w') {
      animation1.display(xpos, ypos);
      ypos -= speed;
    } 
    else if (key == 'a') {
      animation2.display(xpos, ypos);
      xpos -= speed;
    }
    else if (key == 'd') {
      animation3.display(xpos, ypos);
      xpos += speed;
    }
    else if (key == 's') {
      animation4.display(xpos, ypos);
      ypos += speed;
    }
  }
  else {
    animation5.display(xpos, ypos);
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
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



