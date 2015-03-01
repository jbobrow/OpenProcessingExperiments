
//ex4-7 random line colors, size, positions

float r;
float g;
float b;
float a;

float x;
float y;

void setup() {
size (300,300);
background (255);
smooth ();
}

void draw () {
  r =random(255);
  g = random (255);
  b = random (255);
  a = random (255);
x = random(width);
y = random(height);
frameRate(3);
  strokeWeight (random(2,80));
  stroke(r,g,b,50);

  line (0,y,width,y);

 
}


