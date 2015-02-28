
size(500, 500);

fill background(255, 255, 255);

int y = 0;
while(y <= 300)
{ 
  //line(x1, y1, x2, y2)
 stroke(y, 0, 0);
  line(0, y, y, 500);
  line(0, 0, 500, y);
  y = y + 5;
}
