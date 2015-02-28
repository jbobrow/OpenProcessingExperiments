
import ddf.minim.*;

AudioPlayer ap;
Minim minim;
PImage bkImage;
PImage boneImage;

void setup() {
  size(726, 300);

  smooth();
  minim = new Minim(this);
  ap = minim.loadFile("oppo.mp3");
  ap.play();
  bkImage = loadImage ("bk.jpg");
  boneImage = loadImage ("bone.png");
}


void draw() {
  
  background (255, 255, 255, 20);

  image (bkImage, 0, 0); 
  
  float level = ap.mix.level();
  float boneX = level * 800;
    
  image (boneImage, boneX+165, 60);
  
}

