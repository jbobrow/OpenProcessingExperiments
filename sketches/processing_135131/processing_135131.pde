
Boxes[] box = new Boxes[20];
float ang;
float angU;

void setup() {
  size(500, 500, P3D);
  for (int i = 0;i<box.length;i++) {
    box[i] = new Boxes();
  }
}

void draw() {
  background(0);
  translate(width/2, 100, -400);
  lights();
  rotateY(ang);
  rotateX(angU);
  
  //LEFT RIGHT
  if (keyPressed && keyCode == LEFT)ang+=.01;
  if (keyPressed && keyCode == RIGHT)ang-=.01;
  //UP DOWN
  if (keyPressed && keyCode == UP)angU-=.01;
    if(keyPressed && keyCode == DOWN)angU+=.01;

  for (int i = 0;i<box.length;i++) {
    box[i].render();
  }
}

class Boxes {
  float x, y, z;
  float s; 
  color c;
  float ang;
  float aSpeed;

  Boxes() {
    x = random(width);
    y = random(height);
    z = random(-100,100);
    s = random(10,45);
    c =  color(random(255), random(255), random(255));
    aSpeed = random(-.01,.01);
  }

  void render() {
    pushMatrix();
    translate(x, y, z);
    rotateY(ang);
    noStroke();
    fill(c);
    sphere(s);
    noFill();
    stroke(255);
    box(s*2);
    popMatrix();
    ang += aSpeed;
  }
}



