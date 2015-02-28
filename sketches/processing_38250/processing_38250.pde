
void setup() {
  size(600, 600);
  smooth();
  background(0);
  colorMode(HSB, width);
}

int x=10; //revolution from center
int y=0;  //rotation of object

void draw() {
  noFill();

  pushMatrix();
  translate(width/2, height/2); //new origin is now center
  rotate(radians(x));
  translate(100, 100);
  rotate(radians(y+25)); //rotation of the objects
  ellipse(0, 0, 200, 100);  //the main shape, creating a flower-like pattern
  stroke(300, 200, 600);   //turqouise
  rect(0, 0, 25, 25);  //small rectangle that follows the ellipse
  popMatrix();

  pushMatrix(); 
  //this series creates the small blue figures in each corner
  //they repeat so as to have the same figure in each corner
  translate(75, 75);
  rotate(radians(x));
  translate(35, 35);
  rotate(radians(y+5));
  stroke(400, 300, 600);
  line(0, 0, 25, 25);
  stroke(100, 100, 600);
  popMatrix();

  pushMatrix();
  translate(525, 75);
  rotate(radians(x));
  translate(35, 35);
  rotate(radians(y+5));
  stroke(400, 300, 600);
  line(0, 0, 25, 25);
  stroke(100, 100, 600);
  popMatrix();

  pushMatrix();
  translate(75, 525);
  rotate(radians(x));
  translate(35, 35);
  rotate(radians(y+5));
  stroke(400, 300, 600);
  line(0, 0, 25, 25);
  stroke(100, 100, 600);
  popMatrix();

  pushMatrix();
  translate(525, 525);
  rotate(radians(x));
  translate(35, 35);
  rotate(radians(y+5));
  stroke(400, 300, 600);
  line(0, 0, 25, 25);
  stroke(100, 100, 600);
  popMatrix();  

  x++;
  y+=5;
}


