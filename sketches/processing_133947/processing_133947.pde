
PImage Trees;
PImage Mountains;
PImage Clouds;

void setup() {
  
  size(800,375);

  Trees = loadImage("Trees2.gif");
  Mountains = loadImage("Mountain2.gif");
  Clouds = loadImage("Clouds.gif");
  
  
  float c = map(mouseX, 0,width, 175,10);
  background(c,c,c);
}

void draw() {
  
  float ellipse1x;
ellipse1x = random (-100, 900);
float ellipse1y;
ellipse1y = random(-100, 900);

fill (#1203FF);
stroke(#F7C6FF, 50);
ellipse(ellipse1x, ellipse1y, 1, 6);

float back = map(mouseX, 0,width, 0,-10 );
  image(Clouds, back,0);

  float middle = map(mouseX, 0,width, 0,-20  );
  image(Mountains, middle,50);

  float front = map(mouseX, 0,width, -20,-200);
  image(Trees, front, 250);
  
}


