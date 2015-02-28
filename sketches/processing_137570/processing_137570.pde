
int x = 0;
 
size(800, 800);
background(255);

noStroke();
 
 
while (x <= 800) {
  int z = 0;
  while (z <= 800) {
    fill(0, 242, 228);
    ellipse(x, z, 10, 10);
    z= z+10;
  }
  x=x+10;
}



