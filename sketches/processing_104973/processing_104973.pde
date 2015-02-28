
int xPos; // state the variables
int yPos;
int speed;
float gravity;

void setup() {
  size(500, 500);

  xPos= width/2; // define the variables
  yPos= height/2;
  speed= 10;
  gravity= -1;
}

void draw() { // make it do stuff

  background(255);
  fill(240,235,249);
  
  yPos+=speed;
  if (yPos > height || yPos < 0) {
    speed*=-0.9;
  }

  yPos+=speed;
  speed-=gravity;
