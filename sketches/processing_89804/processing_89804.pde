
//COLLAGE
//week05
//ID3


//media load

PImage geese;
PImage flower;
PImage flamingo;
PImage ding;

//global variables
float x;
float y;
float rgreen = random(160, 240);

float angle1 = 0.0;
float offset1 = 0;
float scalar1 = 100;
float speed1 = 0.01;

float angle2 = -0.0;
float offset2 = 20;
float scalar2 =2;
float speed2 = random(5);


void setup() {
  size(800, 800);
  geese = loadImage("geese.png");
  flower = loadImage("flower.png");
  ding = loadImage("dinghies.png");
  flamingo = loadImage("flamingo.png");
  smooth();
  imageMode(CORNER);
  noCursor();
}

void draw() {
  //background
//  image(flamingo, random(width), 0);

  noStroke();
  colorMode(HSB, 100, 100, 100);

  for (float i=0; i<=width+40; i += width/20) {
    for (float j=0; j<=height; j += height/20) {
      float d = dist(mouseX, mouseY, i, j)/10;
      fill(d, 100, d*2);
      ellipse(i, j, 10, 10);
    }
  }

  //  image(flamingo, x, 0);

  //collage geese
  pushMatrix();
  translate(width/2, height/2);
  x = offset2 + cos(angle2) * scalar2;
  y = offset2 + sin(angle2) * scalar2;
  rotate(angle2);


  image(geese, x, y, 300, 300);

  angle2 -= speed2*0.2;


  popMatrix();

  //collage flower
  pushMatrix();
  translate(width/2, height/2);
  x = offset1 + cos(angle1) * scalar1;
  y = offset1 + sin(angle1) * scalar1;
  rotate(angle1*angle1);

  image(flower, x, y, 400, 400);

  angle1 += speed1;
  popMatrix();
 
  
}



