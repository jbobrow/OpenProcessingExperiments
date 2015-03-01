
size(500, 500);
background(0);

int x = 0;
int y = 250;

while (x < 500) {
  ellipse(x, y, random(40), random(40));
  
  x = x + 1;
}


