
/* Reference organic (something with rules) to translate to 
   code
*/

Walker[] walkers;

void setup() {
  size(500,500);
  smooth();
  background(0);
  walkers = new Walker[20];
  
  for (int y = 0; y <=20; y++) {
    walkers[y] = new Walker();
}

}

void draw() {
  for (int i = 0; i <= 10; i++) {
    walkers[i].step();
    walkers[i].display();
  }

}

class Walker {
  int x;
  int y;
  int rx = random(5,50);
  
  Walker() {
    x = 10;
    y = 450;
  }
  
  void display() {
    if (rx <= 10) {
      stroke(255);
      fill(200);
      strokeWeight(2);
      ellipse(x,y,rx,rx);
    }
    else if (rx <= 35) {
      stroke(225, 200);
      fill(80, 140);
      strokeWeight(2);
      ellipse(x,y,rx,rx);
    }
    else {
      stroke(225, 80);
      fill(10, 20);
      strokeWeight(2);
      ellipse(x,y,rx,rx);
  }
  }

void step() {
  if (rx <= 30) {
  float r = random(1);
  if (r < 0.3) {
      x+=random(1,10);
    } else if (r < 0.4) {
      x-=random(1,5);
    } else if (r < 0.6) {
      y+=random(1,10);
    } else {
      y-=random(1,5);
    }
  }
  else {
    float r = random(1);
  if (r < 0.4) {
      x+=random(1,5);
    } else if (r < 0.5) {
      x-=random(1,5);
    } else if (r < 0.6) {
      y+=random(1,5);
    } else {
      y-=random(1,5);
    }
}
}
}


