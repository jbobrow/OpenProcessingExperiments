
PShape eye, eyeball, iris, pupil;

void setup() {
  size(200, 200, P2D);
  background(255);
  eye = createShape(GROUP);
  eyeball = createShape(ELLIPSE, 0, 0, 80, 40);
  eyeball.fill(255);
  iris = createShape(ELLIPSE, 15, 10, 30, 30);
  iris.fill(160, 160, 160, 50);
  pupil = createShape(ELLIPSE, 20, 20, 10, 10);
  pupil.fill(0);
  eye.addChild(eyeball);
  eye.addChild(iris);
  eye.addChild(pupil);
}

void draw() {
  for (int x = 0; x < width; x += 10){
    for (int y = 0; y < height; y += 3) {
      translate(x + int(random(0,y)), y + int(random(0,x)));
      shape(eye);
    }
  }
}



