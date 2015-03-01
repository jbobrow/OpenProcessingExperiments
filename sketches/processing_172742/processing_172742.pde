
void setup()
{
  size(1000,1000);
}
void draw() 
{
assignment1();
iPod(random(90));
}
void assignment1()
{
  if (mousePressed)
  stroke(random(255),random(255),random(255));
  strokeWeight(20);
  fill(random(255),random(255),random(255));
  //background(150);
  rect(mouseX, mouseY, 40, 40);
  
  
  
}
int iPod(float swaggeristomuchtohandleahah)

{
  if (keyPressed)
  ellipse(mouseX + random(swaggeristomuchtohandleahah),mouseY+ random(swaggeristomuchtohandleahah),random(swaggeristomuchtohandleahah),random(swaggeristomuchtohandleahah));
  
for (int i = 40; i < 80; i = i+2) {
  ellipse(50, i,90, i);
  int z = 0;
while (z < 100) {
  line(30, z, 80, z);
  z = z + 1;
} 
}
return int(random(swaggeristomuchtohandleahah));
}
