
Frames frames_flame;
Frames frames_enemy;

Animation anim_flame;
Animation anim_enemy;

void setup() {
  frames_flame = new Frames("flame_a_", "gif", 3);
  frames_enemy = new Frames("enemy_a_", "gif", 2);
  
  anim_flame = new Animation(frames_flame, 5);
  anim_enemy = new Animation(frames_enemy, 15);
}

void draw() {
  background(0);
  imageMode(CENTER);
  
  anim_flame.animate();
  anim_flame.draw(width/3, height/2);
  
  anim_enemy.animate();
  anim_enemy.draw(width*2/3, height/2);
}
  
  
class Animation {
  // inspired by http://www.processing.org/learning/topics/animatedsprite.html

  Frames frames;
  int currImage = 0;
  int delayTime = 0;
  int delayCount = 0;

  Animation(String filePrefix, String fileSuffix, int numFrames, int delayTime) {
    this.delayTime = delayTime;
    frames = new Frames(filePrefix, fileSuffix, numFrames);
  }

  Animation(Frames frames, int delayTime) {
    this.delayTime = delayTime;
    this.frames = frames;
  } 

  void animate() {
    delayCount++;
    if (delayCount >= delayTime) {
      delayCount = 0;
      currImage++;
      if ( currImage >=  frames.size() )
        currImage = 0;
    }
  }

  void draw(int x, int y) {
    image(frames.images[currImage], x, y);
  }
  
  void draw(int x, int y, int w, int h) {
    image(frames.images[currImage], x, y, w, h);
  }

}

class Frames {
  // inspired by http://www.processing.org/learning/topics/animatedsprite.html

  PImage[] images;

  Frames(String filePrefix, String fileSuffix, int numFrames) {
    images = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++) {
      // Use nf() to number format 'i' into two digits
      String filename = filePrefix + nf(i, 2) + "." + fileSuffix;
      images[i] = loadImage(filename);
    }
  }

  int size() {
    return images.length;
  } 
}


