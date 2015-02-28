
class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  //@ file  :  name IMG file "TEST" for  data/IMG/TESTxxx.gif
  //@ count :  frame of Animation
  Animation(String file, int count) {
    imageCount = count;
    images = new PImage[count];
    for (int i=0;i< count;i++) 
      images[i] = loadImage ("data/IMG/"+file+"/"+file+ nf(i, 2)+".gif");
  }
  //method for show Animation to Display
  void display( float x, float y) {
    imageMode(CENTER);
    if (frame>=imageCount)frame=0;
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    image(images[frame++], 0, 0);
    popMatrix();
  }
  void display( float x, float y, float w, float h) {
    imageMode(CENTER);
    if (frame>=imageCount)frame=0;
    pushMatrix();
    translate(x, y);
    scale(-1, 1);
    image(images[frame++], 0, 0, w, h);
    popMatrix();
  }
}


