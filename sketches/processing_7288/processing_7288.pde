
void setup()
{
  size(500, 400);
  background(255);
  //frameRate(10);
  noCursor();
}

float R = random(0, 255);
float G = random(0, 255);
float B = random(0, 255);

float i = 1.0;

void draw()
{
  i = i+0.1;
  
  fill(255, 10);
  rect(-1, -1, width + 1, height + 1);
  
  fill(255, 5);
  stroke(R, G, B);
  //translate((mouseX - 10), (mouseY - 10));
  rect((noise(i)*random(0,10)) + mouseX, 
       (noise(i)*random(0,10)) + mouseY,
       mouseX*random(0, 2), 
       mouseY*random(0, 2));
}

void mousePressed()
{
  R = random(0, 255);
  G = random(0, 255);
  B = random(0, 255);
};

