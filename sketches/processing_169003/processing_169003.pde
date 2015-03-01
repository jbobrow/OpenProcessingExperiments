
Particle[] Part = new Particle[1000];



void setup() {
  size(400, 400);
  background(200);
  strokeWeight(2);

  for (int i = 0; i < 1000 ; i++) {
    Part[i] = new Particle(random(0, 400), random(0, 400), random(0, 255));
  }
}

void draw() {

  fill(0, 20);//(200,50);
  noStroke();
  rect(0, 0, 400, 400);
  for (int i = 0; i < 1000 ; i++) {
    Part[i].update();
  }
}


class Particle {
  float t = random(0, 10000);
  float x;
  float y;
  float Clr;


  Particle(float xi, float yi, float clr) {
    x = xi;
    y = yi;
    Clr = clr;
  }

  void update() { 
    stroke(Clr, 0, 0);
    x = 400*noise(t);//+ mouseX;
    y = 400*noise(t+10000);// + mouseY;
    t += 0.01;
    point(x, y);
    
  }

   void mousePressed() {
     if (mousePressed == true) {
       
      }
    
    
  }
}


