
size(800, 800); 
smooth(); 
background(255);
noFill();
int i = 20;

for (int x = i; x <= width; x += i) {
  for (int y = i; y <= width;y += i) {
    bezier(x+i, y/i, x+i, y*i, x*x, y/y, width, height);
  }
}



