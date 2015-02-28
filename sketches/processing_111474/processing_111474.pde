
size(600, 600);
smooth();
background(0);


for (int x=0; x<width; x+=20) {
  for (int y=0; y<height; y+=20) {
    float sw=map(x, 0, width, 0, 35);
    strokeWeight(sw);
    point(x, y);
    
    float g= map(x,0,width,0,255);
    float r= random(0,100);
    stroke(0,g,g,r);
  }
}



