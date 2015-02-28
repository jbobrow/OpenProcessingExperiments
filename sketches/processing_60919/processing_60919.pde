
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
 
  Animation(String imagePrefix, int count) { // 
    imageCount = count;
    images = new PImage[imageCount];
 
    for (int i = 0; i < imageCount; i++) {
      // nf() formats 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }
 
  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    imageMode(CENTER);
    image(images[frame], xpos, ypos);
  }
}

