

size(500, 500);
background(255);
 
 int x = 50;
while (x <= 460) {
  int y = 50;
  while (y <= 460) {
    noStroke();
    fill(x, mouseX,mouseY,50);
    ellipse(x, y, 8, 8);
    y= y+15;
  }
  x=x+15;
}
 




