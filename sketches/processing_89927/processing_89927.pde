
PImage fox;
PImage field;

//global variables
float x=200;
float y= 200;
float xpos;
float ypos;


float direction = -90;
float speed = 3;


void setup() {
  size(480, 480);
  fox = loadImage("foxy.png");
  field = loadImage("field.jpg");
  randomSeed(0);
  imageMode(CENTER);
}

void draw() {
  background(0);
  noTint();

  image(fox, 250, 250, 500, 500);

  image(field, xpos/10, ypos/10, 1000, 1000);

  xpos =random(width);
  ypos =random (height);

  tint(255, 100);
  image(field, xpos, ypos, xpos, ypos);

  tint(255, 100);
  image(field, 250, 350, xpos, ypos);

  noTint();
  image(fox, xpos/3, ypos/3, 80, 80);

  noTint();
  image(fox, xpos, ypos, 250, 250);
  
}



