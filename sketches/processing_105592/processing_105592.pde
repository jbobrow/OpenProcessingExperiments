
PImage bg;
PImage Mask;
color pix;
boolean click = false;

void setup() {
  size(640, 480);
  bg = loadImage("lemon.jpg");
  Mask = loadImage("lemon.jpg");
  bg.mask(Mask);
  imageMode(CENTER);
}

void draw() {
  background(bg);
  tint(255, 100);
  image(Mask, mouseX, mouseY);
}

void mousePressed() {
  if (!click) {
    
    for (int i=0; i<1000; i += 1) { 
      int x = int(random(Mask.width));
      int y = int(random(Mask.height));
      pix = Mask.get(x, y);
      noStroke();
      fill(pix, 120);
      ellipse(x, y, 40, 50);
      println("you got it !");
      
      noLoop();
    }
  }
}




