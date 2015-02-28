
int xx = 100;
int yy = 100;
int nn = 10;
int rr = 300;
int rs = 100;

float ro= PI;
float radius = 90.0;

void setup() {
  size(990, 700);
  background(180);
  smooth();

//  frameRate(10);
  noLoop();
  randomSeed(5);
}

void draw() {

  texture_draw(xx, yy, rr, nn);

  expansion(300, 300, 0, 80, 80, 1, 4, 250, 90, 230, 140);
  // x / y / rotate / ellipse & line w /  ellipse & line h / scale / strokeweight, map(x1,y1,x2,y2) 

  expansion(100, 100, 45, 75, 75, 2, 5, 200, 214, 190, 200);

  expansion(300, 60, 180, 73, 73, 2, 3, 200, 214, 190, 200);
 
  expansion(50, 200, 60, 60, 60, 0.7, 5, 90, 190, 140, 180);

  expansion(-10, -120, 80, 70, 70, 1.2, 4, 120, 200, 160, 100);
  
  expansion(-150, 30, 100, 79, 79, 0.5, 2, 110, 0, 160, 100);

  expansion(200, 100, 10, 99, 99, 1.5, 2, 180, 190, 180, 190);

  expansion(-120, 100, 10, 60, 60, 0.5, 2, 10, 10, 90, 90);

  expansion(-120, 150, 10, 80, 80, 1.4, 2, 10, 10, 90, 90);

  expansion(-300, 200, 40, 70, 70, 0.9, 2, 100, 100, 90, 90);

}


void texture_draw(float xx, float yy, int radius, int num) {
  
  float value = 400 * num / 3.0;
  noStroke();
  fill(value, 100);
  ellipse(xx, yy, radius*2, radius*2);

  if (num > 1) {
    num = num - 1;
    int branches = int(random(3, 5));
    for (int ii = 0; ii < branches; ii++) {
      float a = random(0, TWO_PI);
      float newx = xx + cos(a) * 40.0 * num;
      float newy = yy + sin(a) * 40.0 * num;
      texture_draw(newx, newy, radius/2, num);
      
    }
  }
}


void expansion(int x, int y, int r, int w, int h, float sc, int sw, int mp1, int mp2, int mp3, int mp4) {
  // x / y / ellipse & line w /  ellipse & line h / scale / strokeweight, map(x1,y1,x2,y2) 

  translate(x, y);
  rotate(r);
  scale(sc, sc);

  for (int i=0; i< 500; i +=2) {

    rotate(ro);

    pushMatrix();
    stroke(0, 20);
    strokeWeight(random(sw));
    line(0, 0, w*random(0.8), h*random(0.8));
    ro +=10; //  rotate inc
    popMatrix();

    noStroke();
    fill(0, 20);
    ellipse(w/2.3, h/2.3, 3, 3);
    ellipse(w/1.8, h/1.8, 3, 3);
    ellipse(random(w), random(h), 2, 2);
    // small ellipse inc
  }

  for (int deg = 0; deg < 360; deg += 6) {
    fill(0, 110);
    float angle = radians(deg);

    for (int i=0;  i<300; i +=20) {
      float mp= map(i, mp1, mp2, mp3, mp4);
      float inc_x = 0+ (cos(angle) * mp/6);
      float inc_y = 0+ (sin(angle) * mp/6);
      ellipse(inc_x, inc_y, 5, 2);
      //center ellipse inc
    }
  }
}

void mousePressed ()
{
  saveFrame ("poster.jpg");
  redraw();
}
