
PImage buzz_cropped;

float angle=0;

int[]randX = new int[50];
int[]randY = new int[50];
int[]randZ = new int[50];

void setup()
{
  size(500, 500, P3D);
  smooth();
  buzz_cropped = loadImage("nasa_buzz_cropped.png");
  
  for (int i = 0; i < 50; i++) {
    randX[i] = (int) random(-300, width+300);
    randY[i] = (int) random(-300, height+300);
    randZ[i] = (int) random(-height, -(height+300));
  }
}
void draw()
{
  angle+=0.03;
  background(0);

  pushMatrix();
  translate(mouseX,mouseY,-mouseY);
  imageMode(CENTER);
  rotate(angle);
  image(buzz_cropped, 0, 0);
  popMatrix();
    
  for (int i = 0; i < 50; i++) {
    fill(random(150,255));
    noStroke();
    pushMatrix();
    translate(randX[i],randY[i],randZ[i]);
    ellipse(0,0, 5, 5);
    popMatrix();
  }
}



