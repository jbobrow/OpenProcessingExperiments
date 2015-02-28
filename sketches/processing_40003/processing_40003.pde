
size(800,800); 
background(0); 
smooth(); 
fill(255); 
stroke(102); 
for (int y = 20; y <= height-20; y += 10) {
  for (int x = 20; x <= width-20; x += 10) { 
    point(x, y);
    point(x/2, y/2);
    point((x/2)+(height/2), (y/2)+(width/2));
    point(x*2, y*3);
    point(x*3, y*4);
    rotate(25);
  }
}

