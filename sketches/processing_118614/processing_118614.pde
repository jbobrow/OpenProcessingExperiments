
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + "_" + nf(i, 1) + ".png";
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
class ScrollingImage {
  int offsetA, offsetB, yOffset, speed;
  PImage image;
  
  ScrollingImage(PImage i, int y, int s) {
    image = i;
    offsetA = 0;
    offsetB = image.width;
    yOffset = y;
    speed = s;
  }
  void draw() {
    image(image, offsetA, yOffset);
    image(image, offsetB, yOffset);
    offsetA -= speed;
    offsetB -= speed;
    if(offsetA == -image.width) {
      offsetA = image.width;
    }
    if(offsetB == -image.width) {
      offsetB = image.width;
    }
  }
}
PImage player_standing, path, greens, mountains;
Animation player_running, monster;
ScrollingImage scrolling_path, scrolling_greens, scrolling_mountains;

void setup() {
  size(800,600);
  background(#6D6E71);
  frameRate(24);
  player_running = new Animation("Running", 6);
  monster = new Animation("Monster", 6);

  // Initialize images
  player_standing = loadImage("Standing.png");
  path = loadImage("Path.png");
  greens = loadImage("Greens.png");
  mountains = loadImage("Mountains.png");
  // Create scrolling images
  scrolling_path = new ScrollingImage(path, 311, 0);
  scrolling_greens = new ScrollingImage(greens, 222, 0);
  scrolling_mountains = new ScrollingImage(mountains, 0, 0);
}

void draw() {
  background(#724d27);
  fill(#BDDDE2);
  noStroke();
  rect(0,0,800,321);
  scrolling_mountains.draw();
  scrolling_greens.draw();
  scrolling_path.draw();
  monster.display(100, 328);
  if(keyPressed) {
    player_running.display(370,220);
    scrolling_mountains.speed = 4;
    scrolling_greens.speed = 8;
    scrolling_path.speed = 16;
  } else {
    image(player_standing, 370, 220);
    scrolling_mountains.speed = 0;
    scrolling_greens.speed = 0;
    scrolling_path.speed = 0;
  }
}




