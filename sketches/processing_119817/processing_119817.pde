
PImage rod;
Fish[] fishes = new Fish[16];

void setup() {
  size(700, 700);
  for (int i = 0; i < fishes.length; i++) {
    fishes[i] = new Fish(i*9 +50, i*9 +40);
  }
  rod = loadImage("rod.png");
}

void draw() {
  background(5, 8, 134);
  
  if(mousePressed == true) {
    image(rod, mouseX, mouseY);
      
  }    
  
  for (int i = 0; i < fishes.length; i++) {
  fishes[i].display();
  fishes[i].update();
  fishes[i].checkBoundary();
  } 
 
  
}
class Fish {
  PImage fish2;
  float fish2X; 
  float fish2Y;
  float fish2Xspeed;
  float fish2Yspeed;
  float siizeX;
  float siizeY;


  Fish(float catcher1, float catcher2) {
    fish2X = random(width);
    fish2Y = random(height);
    fish2 = loadImage("fish2.png");
    siizeX = catcher1;
    siizeY = catcher2;
    fish2Xspeed = random(-2, 2);
    fish2Yspeed = random(-3, 3);
  }


  void display() {
    image(fish2, fish2X, fish2Y, siizeX, siizeY);
  }

  void update() {
    float closeness = dist(mouseX- 10, mouseY+129, fish2X, fish2Y);
   
    fish2X = fish2X + fish2Xspeed; 
    fish2Y = fish2Y + fish2Yspeed;
    
     if(closeness<30 && mousePressed) {
        fish2X = mouseX - 10;
        fish2Y = mouseY + 129;
      } 
    
    
  }

  void checkBoundary() {
    if (fish2X >= width - siizeX || fish2X <= 0) {
      fish2Xspeed = fish2Xspeed * -1;
    }   

    if (fish2Y >= height-siizeY || fish2Y <= 0) {
      fish2Yspeed = fish2Yspeed * -1;
    }
  }
}  














