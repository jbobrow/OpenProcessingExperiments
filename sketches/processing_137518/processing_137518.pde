
int x = 60;
int y = 60;

size(600,600);
background(0);
fill(255);
noStroke();

while ( x <= 540) {
  fill(255,200,200,80);
  ellipse(x, 300, 60, 30);
  x = x + 60;
  
}
  
  while (y <= 540) {
    fill(200,200,225,80);
    ellipse(300, y, 30,60);
    y = y + 60;
}



