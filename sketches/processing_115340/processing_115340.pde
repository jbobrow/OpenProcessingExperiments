
PImage img;

Rain[] rains = new Rain[10000];
//Rain myRain;
//Rain myRain01;

void setup() {
  size(400, 300);
  img = loadImage("Oxford.jpg");
  //myRain = new Rain();
  //myRain01 = new Rain();
  for (int i=0; i < rains.length; i++) {
    rains[i] = new Rain();
  }
}

void draw() {
  image(img, 0, 0);
  for (int i=0; i < rains.length; i++) {
    rains[i].display();
    rains[i].descend();
  }
}

class Rain {

  float x;
  float y;
  color c;

  Rain() {
    x=random(width);
    y=-random(10000);
    c = color(57, 172, 229, random(100));
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x, y, 10, 15);
    ellipse(x, y, 10, 15);
    if (keyPressed) {
      if (key =='s' || key =='S') {
        fill(255);
        ellipse(x, y, 10, 15);
        ellipse(x, y, 10, 15);
      }
    }
      
  }

  void descend() {
    y+=+10;
  }
}



