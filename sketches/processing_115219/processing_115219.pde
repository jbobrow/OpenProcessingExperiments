
float x;
float y;
float H;
float S;
float B;
float A;
int c = 360;
int d;
float diameter;



void setup() {
  size(500, 500);
  frameRate(5);

  colorMode(HSB, 360, 100,100,100);
  background(360,20,85);
}

void draw() {

  d = 360-c;
  x = int (random(3, 500));
  y = int (random(3, 500));
  c = 360-d;
  H = random(c-18, c);
  S = random(20, 50);
  B = random(85,100);
  A = random (50, 65);
  diameter = int(random(6, 175));
  fill(H, S, B, A);  
  noStroke();     
  ellipse(x, y, diameter, diameter);
  
}

void mousePressed() {
   if (c> 30); {
    c = c - 30;
    println(c);
    println (H);
   
      if (c <= 30) {
      c = c+d;
      }
          }
   colorMode(HSB, 360,100,100,100);
   background(H, S-10, B-10);
}
