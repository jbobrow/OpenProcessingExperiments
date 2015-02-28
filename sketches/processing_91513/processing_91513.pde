
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  boolean facingRight;
  
  Animation(String imagePrefix, int count, boolean direction) {
    imageCount = count;
    images = new PImage[imageCount];
    facingRight = direction;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, int _frame) {
    frame = _frame % imageCount;
    if(!facingRight){
      pushMatrix();
      scale(-1.0, 1.0);
      image(images[frame],-images[frame].width-xpos, ypos);
      popMatrix();
    }else{
      image(images[frame], xpos, ypos);
    }
  }
  
  int getWidth() {
    return images[0].width;
  }
}

