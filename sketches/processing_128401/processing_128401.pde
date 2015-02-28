
// criar um array de bolas
Bola [] bola_array = new Bola [1000];
int n=0;
void setup() {
  size(500, 500);
  background(255);
}

void draw() { 
  background(255); 
    for (int i=0; i<n; i++) {
      bola_array[i].move(); 
      bola_array[i].desenha();
    }
 
}

void mousePressed(){
  bola_array[n]=new Bola(random(10, 30), color(random(255), random(255), random(255)), mouseX, mouseY, random(-5, 5), random(-5, 5));
    n++;
}
  
class Bola {
  float w;
  color c;
  PVector location;
  PVector velocity;

  Bola(float w1, color c1, float x, float y, float vx, float vy) {
    w = w1;
    c = c1;
    location = new PVector (x, y);
    velocity = new PVector (vx, vy);
  }

  void move() {
    location.add(velocity);
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x*-1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.x*-1;
    }
  }

  void desenha() {
    smooth();
    fill(c);
    noStroke();
    ellipse(location.x, location.y, w, w);
  }
}



