
size(500, 500);
background(0);
smooth();
int shapeDist = 50;
int circleDiameter = 2;

for(int x=50; x<width; x+=shapeDist){
  for(int y =50; y<height; y+=shapeDist){
    fill(0, 255, 255,(255-y/2));
    ellipse(x, y, circleDiameter+x/12, circleDiameter+x/12);
  }
}

