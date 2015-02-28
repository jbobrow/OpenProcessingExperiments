
/* Ceri Watling Playing With Fractal Trees


fade out rate*/

int alpha = 50;
int clickcount;
float green;
float red;
float blue;
float ratio = 1.75;
float greenBackVal = 0;




void setup()
{
  strokeWeight(1);
  size(950, 600);
  background(200, 255, 80);
  ellipseMode(RADIUS);
  clickcount = 0;
}

void draw()
{
  
}

void mouseClicked()
{ 
  clickcount += 1;
  noStroke();
  if (clickcount % 20 >= 10) {
    fill(200, 255, 80, alpha);
    rect(0, 0, width, height);
  }
  else {
    fill(240, 255, 240, alpha);
    rect(0, 0, width, height);
  }

  green = random(50, 175);
  red = random(0, green/3);
  blue = random(0, green/4);
  
  ratio = random(1.3, 2);
  float branchingAngle = radians(random(5, 90));
  float len = random(70, 200);
  float angle1 = random (0, TWO_PI);
  int branches = (int) random (5, 10);
  if (len > 120) {
      strokeWeight(2);
  }
  else { 
    strokeWeight(1); 
  }
  for (int i = 0; i < branches; i++) { 
    recurseTree(angle1 + i * TWO_PI / branches, mouseX, mouseY, (len * cos(angle1 + i * TWO_PI / branches) + mouseX), (len * sin(angle1 + i * TWO_PI / branches) + mouseY), branchingAngle);
  }
}

void recurseTree(float rads, float startX, float startY, float endX, float endY, float branchAng)
{
  stroke(red, green, blue);
  
  line(startX, startY, endX, endY);
  float leng = dist(startX, startY, endX, endY);
  if  (leng > 2)
  {
    recurseTree(rads + branchAng, endX, endY, leng/ratio * cos(rads + branchAng) + endX, leng/2 * sin(rads + branchAng) + endY, branchAng);
    recurseTree(rads - branchAng, endX, endY, leng/ratio * cos(rads - branchAng) + endX, leng/2 * sin(rads - branchAng) + endY, branchAng);
  }
}
    



