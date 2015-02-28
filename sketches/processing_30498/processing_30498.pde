
String url = "http://www.mymansion.com.au/wp-content/gallery/091010/hilfiger-mansion-01.jpg";
PImage bg;
// 1. make the Rain
Rain myRain;
 
void setup() {
size(100,100);
  bg = loadImage(url);
  size(bg.width, bg.height);
  // 2. define the Rain (number of drops & rain intensity/speed)
  myRain = new Rain(5555, 5.5);
}
 
void draw() {
  image(bg, 0, 0);
  // 3. update and display the Rain
  myRain.update();
}


// add this Rain class to the sketch
class Rain {
  PVector [] drops;
 
  Rain(int numDrops, float intensity) {
    drops = new PVector[numDrops];
    for (int i=0; i<numDrops; i++) {
      drops[i] = new PVector(random(width),random(height),random(1, intensity));
    }
  }
 
  void update() {
    stroke(25, 25, 150);
    for (int i=0; i<drops.length; i++) {
      PVector p = drops[i];
      p.y += p.z;
      if (p.y > height) { p.y=0; }
      line(p.x, p.y-p.z, p.x, p.y);
    }
  }
}
                
