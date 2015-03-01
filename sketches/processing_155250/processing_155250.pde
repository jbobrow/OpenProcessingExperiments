
float startRadius;
float endRadius;

float noiseScale = 300;
int num = 30;

float m = 0;

void setup() {
  size(600, 600);
  smooth();

  startRadius = random (width/2-50);
  endRadius = random (width/2-50);

  frameRate (30);
}




void draw()
{
  fill (#57385c, 80);
  noStroke();
  rect (0, 0, width, height);

  fill (#ffffff);
  noStroke();

  float rad = lerp (startRadius, endRadius, sin (m));
  
  if (mousePressed && mouseButton == LEFT) num = (int) map (mouseX, 0, width, 1, 200);
  else if (mousePressed && mouseButton == RIGHT) noiseScale = map (mouseY, 0, height, 1, 500);

  int i = 0;
  while (i < num)
  {
    float angle = noise (frameCount / noiseScale) * TWO_PI + map (i, 0, num, 0, TWO_PI);
    float x = width/2 + cos (angle) * rad; 
    float y = height/2 + sin (angle) * rad; 

    ellipse (x, y, 10, 10);
    i = i+1;
  }

  m+= 0.02;

  if (m >= PI/2)
  {
    m = 0;
    startRadius = endRadius;
    endRadius = random (width/2-50);
  }
}

