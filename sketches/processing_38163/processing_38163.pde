


size(400,400);
background(0);
smooth();

rectMode(CENTER);

float xx = random(255);
float yy = random(255);

float zz = random(255);

float spacing = 40;

int rsize= 20;


fill(xx,yy,zz);

for (int x = 10; x < height-10; x +=spacing) {
  for(int y = 10; y < width - 10; y +=spacing) {
        rect(x,y,rsize,rsize);
        fill(y,x,x);
        ellipse(x+y,y+x,rsize*2,rsize*2);

  }}

