
float x=0;
float y=0;
float a=0;
int m=3;

void setup() {
  size(600, 600);
  x=width/2;
  y=height/2;
  noStroke();
}

void draw() {

  background(0);

  fill(250, 48, 247);
  ellipse(x, y, 200, 200);

  fill(59, 199, 255);
  ellipse(x-35, y-35, 30, 30);

  fill(59, 199, 255);
  ellipse(x+35, y-35, 30, 30);

  fill(0);
  ellipse(x-35, y-35, 10, 10);

  fill(0);
  ellipse(x+35, y-35, 10, 10);

  fill(255);
  arc(x, y+20, 75, 75, 0, radians(180));

  fill(229, 0, 255);
  arc(x, y-5, 20, 20, 0, radians(180));

  fill(178, 0, 198);
  arc(x-95, y-95, 125, 125, 0, radians(90));

  fill(0);
  arc(x-80, y-80, 50, 50, 0, radians(90));

  x+=cos(radians(a))*2;
  y+=sin(radians(a))*2;
  a+=2;
}


