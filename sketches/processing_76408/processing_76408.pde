
float max_distance;
float s = 10;
float i = 50;
float j = 50;
void setup() {
  size(640, 360); 
  noStroke();
  max_distance = dist(0, 0, width, height);
}

void draw() 
{
  background(155);
  i+=1;
  j+=1;
  s = dist(mouseX, mouseY, i, j);
  if (s<50) {
    i = random(400);
    j = random(200);
  }
  ellipse(i, j, 50, 50);
}


