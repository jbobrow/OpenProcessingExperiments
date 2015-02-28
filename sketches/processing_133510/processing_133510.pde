
float c = 100;
float a = 100/2;
float pythagoras = sqrt(c*c-a*a);
float x=0;
float r=0;
void setup() {
  size(400, 400);
}

void draw() {
  changeColor();
  shapes();

}

void shapes() {
  translate(-a, 0);
  for (int j = 0; j<(width/pythagoras); j++) {
    pushMatrix();
    for (int i = 0; i<=(width/a); i++) {
      stroke(sin((i * PI / 8)+radians(r))*255, sin((i * PI / 8)+radians(60)+radians(r))*255, 220);
      fill(sin((i * PI / 8)+radians(r))*255, sin((i * PI / 8)+radians(60)+radians(r))*255, 220);
      triangle(0, 0, c, 0, a, pythagoras);
      rotate(radians(180));

      if (i%2==0) {
        translate(-c-c/2, -pythagoras);
      }
      else {
        translate(-c/2, -pythagoras);
      }
    }
    popMatrix();
    translate(0, pythagoras);
  }
}


