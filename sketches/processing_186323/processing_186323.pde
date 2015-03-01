

void setup() {
  size(500, 500);
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
  
}

void draw() {
  float aleatorio = random(0,250);
  background(aleatorio,aleatorio ,255);
  translate(width/2, height/2);

  float inc = 1;
  int s = 3;

  for (float r = 0; r < 4; r += inc) {
    for (float c = 0, t = 0; c < TWO_PI; c += (TWO_PI/32.0),  t += 1.0) {

      float offset = (t % 2 == 0) ? inc/2.0 :  0;      
      float n = (r + offset);

      pushMatrix();
      rotate(c);
      translate(0, n * n * 10.0);

      scale(n * n / 1.2);
      rotate(PI/1);

      fill(abs(sin(frameCount/50.0f)) * 255.0f);
      triangle(-s/2.0, -s/2.0f, -s/2.0, s/2.0, s/2.0, s/2.0);

      fill(abs(cos(frameCount/50.0f)) * 255.0f);
      triangle(-s/2.0, -s/2.0f, s/2.0, s/2.0, s/2.0, -s/2.0);

      fill(100);
      rect(0, 0, s-1, s-1);

      popMatrix();
    }
  }
}

