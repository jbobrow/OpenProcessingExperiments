




float x, y, x2, y2;
float angle = 0;
float r=100;
float d=100;

float angle2 = 0;
float r2=100;
float d2=10;

float p=1;
float s;

void setup() {
  size(800, 800);
  background(0);
}


void draw() {

  x = r*sin(angle);
  y = r*cos(angle);

  angle += 10;
//  /r = r-d;

  if ( r <= 0 || r >= 400) {
    d *= -1;
  }


  x2 = r2*sin(angle2);
  y2 = r2*cos(angle2);

  angle2 +=10;
  r2 = r2-d2;

  if ( r2 <= 0 || r2 >= 1000) {
    d2 *= -1;
  }


  translate(400, 400);
  rotate(angle);

  noStroke();
  ellipse(0, 0, y2, x2);

  r = random(0, 255);
  r2 = random(100, 200);


  if (r>100) {
    s=0;
  }
  if (r<100) {
    s=100;
  }


  stroke(r2-50, r2/4, r, 50);//(r, r2, r/3, 55);r, r2-30, r2+30, 55
  strokeWeight(1);
  fill(0, 1);

  rect(0, 0, x-10, y-10);
  rect(0, 0, -x+100, -y+100);
  noFill();
  stroke(0, r2, r-30, 1);
  strokeWeight(20);
  line(0, 0, x2-20, y2);
  line(0, 0, -x2-40, -y2);
  ellipse(0, 0, x+300, y+300);
}
