
int LEFT = 0;
int RIGHT = 1;

void setup()
{
  size(400, 400);
}

//draw loop
void draw()
{
  background(185, 12, 6); //background color
  Fro(); //draw character
}

//character function
void Fro()
{
  //draw character here

  //position
  int x = width /2;
  int y = height /2;
  // variables
  int eye_spacing = 30;
  int eye_height = 20;

  smooth();

  //afro
 
  hair(x, y);
 
 
  //neck
  fill(203, 91, 16);
  rect(160, 330, 80, 80);

  //head
  fill(203, 91, 16);
  ellipse(x, y+40, 200, 220);

  //eyes
  eye(x + eye_spacing, y + eye_height, 25);
  eye(x - eye_spacing, y + eye_height, 25);
 
  //eyebrows
  fill(203, 91, 16);
  eyebrow(x, y, RIGHT); 
  eyebrow(x-20, y+8, LEFT); 

  //nose
  fill(203, 91, 16);
  arc(x, y+50, 8, 50, 0, 1);

  //mouth
  arc(x+20, y+110, 80, 30, PI, TWO_PI-PI/2);
 
}

void hair(int x, int y) { 
fill(0);
  float fro_scale_x = mouseY;
  float fro_scale_y = max(min(mouseY, 350), 200 / 3);
  ellipse(x, y-20, fro_scale_x, fro_scale_y);
 

}

void eyebrow(int x, int y, int side) {
  if (side == LEFT) {
    arc(x, y, 55, 7, PI, TWO_PI-PI/2);
  } else if (side == RIGHT) {
    arc(x, y, 70, 40, 0, 1);
  }
}


void eye(int x, int y, float size ) {

  if (mousePressed) {
    fill(0);
    ellipse(x, y, size, 4);
  }
  else {
    fill(255);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x, y, 10, 10);
  }
}

