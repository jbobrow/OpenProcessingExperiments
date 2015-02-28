
PImage[] rab=new PImage[2];
float x=0;
float y=0;
int m;

void setup () {
  size(600, 600);
  for (int i=0; i< rab.length; i++)
  {
    rab[i]=loadImage(i+".png");
  }
  background(255);
  smooth();
}

void draw () {
  int s = second();
  if (s%2 ==0)
  {
    m=0;
  }
  else
  {
    m=1;
  }
  
  x+=0.01;
  y+=random(0.009, 0.0001);
  float n = noise(x);
  float t = noise(y);

  pushMatrix();
  translate(310, -100);
  rotate(.79);
  image(rab[m], t*(width)-50, n*height+10, rab[int (random(2))].width*n*2, rab[int (random(2))].height/2*n*2);
  image( rab[m], n*height+10, t*(width)-50, rab[int (random(2))].height/2*n*2, rab[int (random(2))].width*n*2);
  popMatrix();

  pushMatrix();
  translate(300, 700);
  rotate(3.95);
  image(rab[m], t*(width)-50, n*height+10, rab[int (random(2))].width*n*2, rab[int (random(2))].height/2*n*2);
  image( rab[m], n*height+10, t*(width)-50, rab[int (random(2))].height/2*n*2, rab[int (random(2))].width*n*2);
  popMatrix();

  if (mousePressed == true) {
    background(255);
  }
}



