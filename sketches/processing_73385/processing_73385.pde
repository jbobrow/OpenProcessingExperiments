
int center = 50;

float i = 0;

float dif = 0.0;

float r = 0.0;
float g = 0.0;
float b = 0.0;

float strValue = 0.0;

float stampSize = 50;

void setup() { 
  size (500, 500);
}

void draw() {

  background (50);
  for (int x = center; x <=width - center; x += center) {
    for (int y = center; y <=height - center; y += center) {

      for (int py = height/10; py < height; py = py + height/10) {
        for (i=stampSize; i>0; i=i-dif) {

          r = random (0, 255);
          g = random (0, 255);
          b = random (0, 255);

          dif = random (1, 30);

          strValue = random (1, 8);

          strokeWeight (strValue);


          stroke (255);
          fill (r, g, b, 100);
          ellipse (x, py, i, i);
        }
      }
    }
  }
}
