

color white = color(255);
Poid[] poids = new Poid[1000];
float xoff = 0.0;



void setup() {
  size(600,400);
  noiseSeed(0);
  for(int i=0; i < poids.length; i++) {
    poids[i] = new Poid();
  }
  noStroke();
}

void draw() {
  background(0);
  for(int i=0; i < poids.length; i++) {
    Poid p = poids[i];
    p.draw();
    p.tick();
  }
}



class Poid {
  PVector pos;
  int dir;
  float speed;
  float a;
  
  Poid() {
    pos = new PVector(noise(xoff += 0.1) * width, noise(xoff += 0.1) * height);
    dir = floor(random(4));
    speed = 0.5 + noise(xoff += 0.5) * 5;
    a = noise(xoff += 0.1) * 255;
  }
  
  void tick() {
    switch(dir) {
      case 0:
        if(pos.x > width) pos.x = 0;
        else pos.x += speed;
        break;
      case 1:
        if(pos.y < 0) pos.y = height;
        else pos.y -= speed;
        break;
      case 2:
        if(pos.x < 0) pos.x = width;
        else pos.x -= speed;
        break;
      case 3:
        if(pos.y > height) pos.y = 0;
        else pos.y += speed;
        break;
      default:
        break;
    }

  }
  
  void draw() {
    fill(255, 255, 255, a);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PI * -0.5 * (dir+1));
    rect(1, 0, 0.1, 0.1);
    rect(-1, 0, 0.1, 0.1);
    rect(0, 1,  0.1, 0.1);
    popMatrix();
  }
  
}

