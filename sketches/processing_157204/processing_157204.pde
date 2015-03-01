
//Particle p1, p2, p3, p4;

//Particle[] p = new Particle[1000];
//
//Particle lonelyParticle;

ArrayList particles;



void setup () {
  size(400, 600);
  background(20,20,120);
  particles = new ArrayList();
}

void draw () {
  background(20,20,120);



  for (int i= particles.size ()-1; i >= 0; i--) {
    Particle p = (Particle) particles.get(i);
    p.update();
    p.display();

    if (p.a <0) {
      particles.remove(i);
    } else if (p.y >= height) {
      p.ySpeed = (-p.ySpeed)*random(0.2,0.6);
    }
  }

  //  randomSeed(10);

  for (int i = width/2-50; i<width/2+50; i+=5) {
    particles.add(new Particle(-1, 1, 1, 2, i, 0));
  }
}


void mouseDragged() {
  particles.add(new Particle(-1, 1, -5, 1, width/2, height));
}

class Particle {
  float x;
  float y;
  float size;
  float xSpeed;
  float ySpeed;
  int a;
  float randStart;

  //CREATE CONSTRUCTOR
  Particle(float xMin, float xMax, float yMin, float yMax, float xStart, float yStart) {
    x = xStart;
    y = yStart;
    size = random(2, 10);
    xSpeed = random(xMin, xMax);
    ySpeed = random(yMin, yMax);
    a = 200;
    randStart = random(.1, .5);
  }

  //update function
  void update() {

    //gravity -- CAN BE USED FOR OTHER ACCELERATION!!!
    ySpeed += 0.20;

    x += xSpeed;
    y += ySpeed;
    a--;
  }


  //display function
  void display() {

    float totalSpeed = abs(xSpeed)+abs(ySpeed);
    float r = map(totalSpeed, 0, 5, 0, 100);
    float g = map(totalSpeed, 0, 5, 100, 150);
    float b = map(totalSpeed, 0, 5, 200, 255);
    float aSine = map(sin((frameCount)*randStart), -1, 1, 50, 255);

    noStroke();

    fill(r, g, b, a);
    //noSmooth();
    ellipse(x, y, size, size);

    fill(255, aSine);
    ellipse(x-2, y-2, size-4, size-4);
  }
}



