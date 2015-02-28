
 
float max_distance;

void setup() {
  size(600, 600); 
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw() 
{
  background(255);
  fill(0,0,0);

  for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 70;
      ellipse(i, j, size, size);
    }
  }
}
void keyPressed()
{
  if (key == 'x')
  background(random(255),random(255),random(255));
  fill(0);
  frameRate(20);


  if (key == 'z')
  background(195,25,0);
  fill(0);
  frameRate(20);


  if (key == 'm')
  background(73,2,93);
  fill(0);
  frameRate(20);


  if (key == 'n')
  background(60,60,60);
  fill(0);
  frameRate(20);


  if (key == 'b')
  background(0,0,255);
  fill(0);
  frameRate(20);


  if (key == 'v')
  background(0,200,0);
  fill(0);
  frameRate(20);


  if (key == 'c')
  background(255,0,0);
  fill(0);
  frameRate(20);
}
