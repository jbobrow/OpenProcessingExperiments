
int radius;
int floatang;
int ang;
int centX, centY, rad;
float thisRadius;
int x, y, lastx, lasty;

int i =0 ;

void setup() {

  size(800, 800);


  background(255);
}


void draw() {
  if (i<100) {

    strokeWeight(5); 
    smooth();
    float radius = 100; 
    int centX = width/2; 
    int centY = height/2;
    stroke(0, 60); 
    noFill(); 
    ellipse(centX, centY, radius*2, radius*2);
    stroke(20, 50, 70); 
    float x, y; 
    float lastx = -999; 
    float lasty = -999;
    float radiusNoise = random(100);

    for (float ang = 0; ang <= 1440; ang += 5) {
      radiusNoise+=0.005;
      radius+=0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang); 
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        stroke(20+radius, 50-radius, 70+radius); 
        line(x, y, lastx, lasty);
      }
      lastx = x; 
      lasty = y;
    }
  }
  i++;
}

