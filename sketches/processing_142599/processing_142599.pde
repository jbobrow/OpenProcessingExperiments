
int num=30;
float scal, sc, theta;

void setup() {
  size(500, 300);
  background(0);
}

void draw() {
  fill(0, 15);
  rect(0, 0, width, height);
  fill(255);
  scal = map(sin(theta), -1, 1, 70, 100);
  sc = map(sin(theta), -1, 1, 3, 10);
  for (int i = 0; i < 20; i++) {
    float s = ((frameCount+(i*50))/100.0) % 10.0;
    for (int j=0; j<num; j++) {
      colorMode(HSB, 360, 100, 100);
      fill((360/num)*j,90,90);
      noStroke();
      float x = width/2 + cos((TWO_PI/num)*j)*s*scal;
      float y = height/2 + sin((TWO_PI/num)*j)*s*scal;
      ellipse(x, y, sc, sc);
      colorMode(RGB);
    }
  }
  theta += (TWO_PI/48);

  //if (frameCount%2==0 && frameCount>50 && frameCount<50+49) saveFrame("image-###.gif");
}

