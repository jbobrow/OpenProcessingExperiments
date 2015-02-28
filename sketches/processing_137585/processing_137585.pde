
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

int a = 0;
int b = 0;

if (mousePressed) {
while (a <= 800){
  while (b <= 800) {
  fill(255, 0, 0);
  ellipse (a, b, 20, 20);
  b=b+10;
  }
  a=a+10;
}
   
  }



