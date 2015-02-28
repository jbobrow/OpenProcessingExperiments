
//Tiffany Dittus
//Depth

float xpos=0;
int speed=10;

float ypos=0;
int yspeed=1;

void setup () {
  background ( 90, 20, 150);
  size(400,400);
}

void draw() {
  background(90, 20, 150);
  xpos=xpos+speed;
  ypos=ypos+speed;
  fill (50, 120,90);
  noStroke();
  ellipse (200,200,15,15);


  fill (40, 200, 40);
  noStroke();
  ellipse (50,50,50,50);


  fill (30,200,80);
  noStroke();
  ellipse (120,120,30,30);


  fill (30,200,80);
  noStroke();
  ellipse (270,270,30,30);

  fill (40, 200, 50);
  noStroke();
  ellipse (350,350,50,50);

  fill ( 50, 80, 90);
  ellipse(xpos,ypos,100,100);


  if (xpos>400) {
    speed= -4 ;
  }
  if (xpos<0) {
    speed=4;
  }

  fill (40, 200, 50);
  noStroke();
  ellipse (xpos, ypos,50,50);
}

