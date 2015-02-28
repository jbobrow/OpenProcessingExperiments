
size(800,200);
background(255);
int prevY = height/2;

for(int x = 1; x<=70; x++){
  int y = prevY + int(random(-10, 10));
  ellipse(10*x, y, 8, 8);
  prevY = y;
}
                
                                
