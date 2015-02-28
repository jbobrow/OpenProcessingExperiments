
int maxNumbers = 200;
boids[] numbers;
int l = 10000;
//float a = random(255);
//float b = random(255);
//float c = random(255);
//float d = random(100);

void setup() {
  size(800, 500);
  numbers = new boids[l];
  //fill(70, 18, 93, 75);

  for (int i = 0; i < l; i = i+1) {
    float tempRadius= random(20);
    PVector tempPosition= new PVector(random(800), random(500));
    PVector tempSpeed= new PVector(random(5), random(5));

    numbers[i] = new boids (tempRadius, tempPosition, tempSpeed);
    numbers[i].showBoid();
  }
}

void draw() {
  background(255);

  for (int i = 0; i < l; i = i+1) {
    numbers [i].moveBoid();
    numbers [i].showBoid();
    numbers [i].colorBoid();

    //fill (mouseX, mouseY, 10, 200);
  }
}

class boids {
  float fill;
  float radius;
  PVector position;
  PVector speed;
  boids ( float _radius, PVector _position, PVector _speed) {
    radius = _radius;
    position = _position;
    speed = _speed;
  }

  void showBoid() {
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  void moveBoid() {
    position.add(speed);
  }

  void colorBoid() {
    fill (random(500));
    //fill (a, b, c, d);
  }
}



