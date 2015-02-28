
float i = 0;

float dif = 0.0;

float r = 0.0;
float g = 0.0;
float b = 0.0;

float strValue = 0.0;


size (500, 900);
background (50);

float stampSize = 300;

for (int py = height/4; py < height; py = py + height/4) {
  

  for (i=stampSize; i>0; i=i-dif) {

    r = random (0, 255);
    g = random (0, 255);
    b = random (0, 255);

    dif = random (1, 30);

    strValue = random (1, 12);

    strokeWeight (strValue);


    stroke (255);
    fill (r, g, b, 100);
    ellipse (250, py, i, i);
  }
}
