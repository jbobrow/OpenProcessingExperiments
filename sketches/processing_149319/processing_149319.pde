

class Sphere {

  // color c;
  float x, y, size, z;


  // int alpha;

  Sphere(float nx, float ny, float nz) {
    x=nx;
    y=ny;
    z=nz;
    z = random(10000);
    x = random(3000);
    y= random(1600);
    size = random(100);
    
    //  color c = color(random(255), random(255), random(255));

    //alpha =(int)random(255);
  }
  // void glow() {
  //  alpha++;
  //  if (alpha >= 255) alpha = 0;
  // }


  void display() {
    pushMatrix();
    //translate(width/2, 0, 0);
    stroke(255);
    fill(0, random(255), 0);
     //directionalLight(0, 255, 0, 0, -1, 0);
    translate(x, y, z);
    box(size);
    popMatrix();
  }
  void move() {
    y-=5;
    if ( y < -1600) {
      y=1000;
    }
  }
}

ArrayList<Sphere> balls = new ArrayList <Sphere>();

void setup() {
  background(0);
  size (1500, 800, P3D);

  for (int i = 0; i < 100; i++) {
    balls.add(new Sphere(random(-17500, 17500), random(-1400, 1400), random(1500)));

  //  if(x >= width) {
    //  x = 0;
   // }
  }
}

void draw() {
  background(0);
 println(balls.size());
 translate(width/2, height/2);
   rotateY((float)mouseX/width*TWO_PI);
  rotateX((float)mouseY/height*TWO_PI);
  for (int i = 0; i < balls.size(); i++) {
    Sphere b = balls.get(i);
  // b.glow();
    b.display();
    b.move();
  }
}
 


