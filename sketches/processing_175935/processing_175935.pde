
Zombie[] zombies;

void setup() {
  size(600, 400);
  PImage[] img = new PImage[8];
  int frame = 4;
  for (int i = 0; i < img.length; i++) {
    img[i] = loadImage("zombie_0_4_"+frame+".png");
    frame++;
  } 
  zombies = new Zombie[30]; 
  for (int i = 0; i < zombies.length; i++) {
    zombies[i] = new Zombie(img);
  }
  frameRate(10);
}

void draw() { 
  background(80);
  for (int i = 0; i < zombies.length; i++) {
    zombies[i].move();
  }
  for (int i = 0; i < zombies.length; i++) {
    zombies[i].render();
  }
}

class Zombie{
  PImage[] images;
  int frame;
  float x,y;
  
  Zombie(PImage[] img){
    images = img;

    x = random(width);
    y = random(height);
    frame = int(random(images.length));
  }
  void move(){
    x += 1;
    if(x>width)x=-80;
  }  
  void render(){
    image(images[frame], x,y);
    frame++;
    if (frame >= images.length)frame = 0;
  }

}
  


