
//declare class
class Bird {
  float xpos;
  float ypos;
  float xspeed;
  PImage[] images;
  int imageCount;
  int frame;

  //Constructor
  Bird(String imagePrefix, int count, float tempXpos, float tempYpos, float tempXspeed) {
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    
     imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png"; 
      images[i] = loadImage(filename);
    }
  }

  void exist() {
    imageMode(CENTER);
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
    if (xpos>600){
      xpos = 600;
  }
  }

  void drift() {
    xpos = xpos - xspeed;
    if (xpos < 0) {
      xpos = width;
      ypos = random(height);
      xspeed = random(10);
    }
  }
}

