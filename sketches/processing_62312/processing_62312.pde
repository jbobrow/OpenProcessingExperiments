
int g = 10;

void setup()  {
  size (500, 500);
  smooth();
}

void draw()  {
  background(255);
  noStroke();
  fill(125);
  ellipse(width/2, height/2, g, g); 
}

void mousePressed()  {
  g = g + 10;
}

void keyPressed() {
  //saveFrame ("punkt.png");
  g = 10;
  
}

