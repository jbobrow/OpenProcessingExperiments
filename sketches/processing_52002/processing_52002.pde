
size (800, 800);
noFill();
smooth();
background(255);
int b = 40;
int d = 50;
for (int a=b/2; a<=width; a=a+b)
{
  strokeWeight(20);
  stroke(200,202,50);
  ellipse (a, b, b, b);
  for (int o=b;o<height;o=o+b) {
    ellipse(a, o, b, b);
  }
}

for (int a=d/2; a<=width; a=a+d)
{
  strokeWeight(20);
  stroke(001,02,50);
  ellipse (a, d, b, b);
  for (int o=b;o<height;o=o+b) {
    ellipse(a, o, b, b);
  }
  
}
                
