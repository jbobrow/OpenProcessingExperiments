
size(600, 600);
noFill();
smooth();
stroke(255, 105, 180);
strokeWeight(3);
background(64, 224, 208);
int x = 100;
while( x < 600)
{
  ellipse( x, 300, 200, 50);
  x = x + 50; 
}
int y = 200;
stroke(160, 32, 240);
while(y < 500)
{
    ellipse( 300, y, 100, 50);
    y= y + 50;
}
