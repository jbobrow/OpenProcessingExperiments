
int num = 20;
float [] xcoord = new float[num];//set random x starting point
float [] ycoord = new float[num];//set random y starting point
color[] myColors = new color[3];
//trying to set 3 random colors, it's not workiing like I want it to.

void setup() {
  background(45, 48, 50);
  smooth();
  size(300, 300);

  color[] myColors = new color[3];
  myColors[0] = color(251, 169, 34);
  myColors[1] = color(221, 95, 24);
  myColors[2] = color(247, 247, 247);

  for (int a = 0; a < 20; a++) {
    xcoord[a] = random(width/1.25);
    ycoord[a] = random(height/1.25);
  }
}

void draw() {
  smooth();
  strokeWeight(5);
  stroke(pickAColor());
  for (int a = 0; a<20;a++) {
    line(xcoord[a], ycoord[a], width*.75, height*.75);
    //starting point is random, converges on lower right
  }
}

color pickAColor() {
  int c = int(random(3));
  return myColors[c];
}

void mousePressed() {
  background(45, 48, 50);
  loop();
}


