
float stampSize = 850;

float i = 0.0;
float dif = 0.0;

float r = 0.0;
float g = 0.0;
float b = 0.0;

float strValue = 0.0;

void setup() {
  size (600, 600);
  background (50);
  stroke (255);
}

void draw() {

  if (millis() >= 0) {
    strokeWeight (30);
    noFill();
    ellipse (300, height/2, 500, 500);
  } 
  if (millis() >= 1000) {
    background (50);
    strokeWeight (50);
    ellipse (300, height/2, 400, 400);
  }
  if (millis() >= 2000) {
    background (50);
    strokeWeight(80);
    ellipse (300, height/2, 300, 300);
  }
  if (millis() >= 3000) {
    background (50);
    strokeWeight (100);
    ellipse (300, height/2, 200, 200);
  }
  if (millis() >= 4000) {
    background (50);
    strokeWeight(10);
    fill (255);
    ellipse (300, height/2, 70, 70);
  }
  if (millis() >= 5000) {
    for (int py = height/2; py < height; py = py + height/2) {


      for (i=stampSize; i>0; i=i-dif) {

        r = random (0, 255);
        g = random (0, 255);
        b = random (0, 255);

        dif = random (10, 30);

        strValue = random (1, 10);

        strokeWeight (strValue);

        fill (r, g, b, 100);
        ellipse (300, py, i, i);
      }
    }
  }
}
