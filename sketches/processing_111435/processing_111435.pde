
size(500, 500);
background(0);
smooth();
noFill();


for (int x = 0; x < width; x+=10) {
  for (int y = 0; y < height; y+=10){
    float r=map(x, 0,width,0,255);
    float g=random(0,255);
    stroke (r,255,255,60);
    fill (r,g,255,10);
    ellipse (x, y, 50, 50);
    
  }
}



