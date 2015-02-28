
RandomWalker[] walkerKiste;
float c = 0;
void setup() {
  size(1100, 800);
  background(0);
  strokeWeight(15);
  frameRate(100);
  walkerKiste = new RandomWalker[500];
  for (int i=0; i < walkerKiste.length; i++) {
// blau // walkerKiste[i] = new RandomWalker(0,255,0);
  walkerKiste[i] = new RandomWalker(random(255), random(255), random(255));
    c = c + 10;
    
  }
}

void draw() {
  noStroke();
  fill(0, 20);
  rect(0, 0, 1100, 800);
  for (int i=0; i<walkerKiste.length; i++) {
    walkerKiste[i].step();
  }
}

class RandomWalker {
  float x = 650;
  float y = 400;
  float r = 1;
  float red = random(100, 255);
  float green = random(100, 255);
  float blue = random (100, 255);

  RandomWalker(float rd, float grn, float bl) {
    red = rd;
    green = grn;
    blue = bl;
  }  

  void step() { 
    stroke(red, blue, green,90);
    point(x, y);
    r=random(4);

    if (r<=1) {
      x = x+20;
    }
    else if (r<=2) {
      x = x-20;
    }
    else if (r<=3) {
      y = y+20;
    }

    else {
      y = y-20;
    }

    if (x>width) {
      x=0;
    }

    if (x<0) {
      x=width;
    }
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }
  
  if(dist(mouseX,mouseY,x,y)<80){
    x = x + x - mouseX;
    y = y + y - mouseY;
  }
  
}
}


