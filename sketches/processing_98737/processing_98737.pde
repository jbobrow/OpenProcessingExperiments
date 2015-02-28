
PImage[] rab=new PImage[4];
float x=50;
float y=20;
int m;

void setup () {
  size(600, 600);
  for (int i=0; i< rab.length; i++)
  {
    rab[i]=loadImage(i+".png");
  }
  background(227, 248, 255);
  smooth();
  noStroke();
}

void draw () {

  int s = second();
  m= s%(rab.length);

  x+=0.01;
  y+=random(0.009, 0.0001);
  float n = noise(x);
  float t = noise(y);
  tint(240+cos(x)*10, 250+sin(x), 255*t);
  fill(noise(x)*155+200, noise(y)*253+100, 255*n);
  pushMatrix();
  translate(310, -100);
  rotate(.79);

  ellipse(t*(width)-50, n*height+10, 10*n, 10);
  ellipse(t*(width)-100, n*height+10, 10*n, 10);

  ellipse(n*height+10, t*(width)-50, 10*n, 10);
  ellipse(n*height+10, t*(width)-100, 10*n, 10);

  image(rab[m], t*(width)-50, n*height+10, rab[int (random(2))].width*n*2, rab[int (random(2))].height/2*n*2);
  image( rab[m], n*height+10, t*(width)-50, rab[int (random(2))].height/2*n*2, rab[int (random(2))].width*n*2);

  popMatrix();

  pushMatrix();
  translate(300, 700);
  rotate(3.95);

  image(rab[m], t*(width)-50, n*height+10, rab[int (random(2))].width*n*2, rab[int (random(2))].height/2*n*2);
  image( rab[m], n*height+10, t*(width)-50, rab[int (random(2))].height/2*n*2, rab[int (random(2))].width*n*2);

  ellipse(t*(width)-50, n*height+10, 10*n, 10);
  ellipse(t*(width)-100, n*height+10, 10*n, 10);

  ellipse(n*height+10, t*(width)-50, 10*n, 10);
  ellipse(n*height+10, t*(width)-100, 10*n, 10);
  popMatrix();

  if (s%10==0)
  {
  }

  if (mousePressed == true) {
    background(random(255), random(255), random(255));
  }
}



