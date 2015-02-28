
//Adam Oaks

void setup() {
  size(400,400);
  smooth();
  frameRate(250);
  background(0,40,86);
  fill(255);
  quad(0,400,25,300,375,300,400,400);
  fill(142,205,240);
  quad(15,400,40,310,360,310,385,400);
  rectMode(CENTER);
  fill(200);
  rect(200,275,100,50);
  fill(0);
  rect(200,330,60,15);
  fill(232,210,88);
  ellipse(100,100,120,120);
  noStroke();
  fill(0,40,86);
  ellipse(120,80,120,120);
}

int a=1;
int b=50;

void draw() {
  rectMode(CENTER);
  fill(153,0,0);
  stroke(0,0,170);
  rect(100,275,a*2,a);

  fill(153,0,0);
  stroke(0,0,170);
  rect(300,275,b*2,b);

  a++;
  b++;

  if(a>50) {
    a=-50;
  }

  if(b>50) {
    b=-50;
  }
}


