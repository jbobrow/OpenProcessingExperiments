
Drop[] drop = new Drop[20];

PImage img;
PFont font;

float e_w = 0;
float e_h = 150;

void setup() {
  size(160, 160);
  colorMode(HSB, 360, 100, 100);
  //background(#f5f5f5);
  background(360);
  smooth();

  for (int i = 0; i < drop.length;i++) {
    drop[i] = new Drop();
  }

  img = loadImage("http://dl.dropbox.com/u/68719965/twitter_pict.jpg");
  imageMode(CENTER);

  font = createFont("fantasy", 20);
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  //background(#f5f5f5);
  background(360);

  for (int i = 0; i < drop.length;i++) {
    drop[i].move();
    drop[i].display();
  }

  image(img, width/2, height/2);

  fill(0);
  text("Follow me!!", width/2, 30);
  text("@reona396", width/2, height - 10);

  noFill();
  stroke(200);
  strokeWeight(10);
  //rect(0, 0, width, height);
}

void mousePressed() { 
  link("https://twitter.com/reona396", "_new");
}
class Drop {
  float x;
  float y;
  float s;
  float c;
  float speed;

  Drop() {
    x = random(160);
    y = random(160);
    s = random(1, 3);
    c = random(360);
    speed = 4 - s;
  }

  void move() {
    y += speed;

    if (y > height) {
      y =  - 70 * (s / 3);
      c = random(360);
      x = random(width);
    }
  }

  void display() {
    noStroke();
    
    fill(c,30,100);
    for (int i = 10; i > 0;i--) {
      
      ellipse(x, y+i*1.2*s, s*i+3, s*i+3);
    }
  }
}



