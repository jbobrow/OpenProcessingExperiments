
void setup()
{
  size(400, 600);  
  background(130, 228, 230);
  smooth();
}

void draw()
{
  frameRate(30);
  fill(230,40,120,30);
  rect(0,0,width,height);
  //background(100,40,200);
  fill(120,100,300,90);
  rect(mouseX, mouseY, 50, 70);
}
void keyPressed()
{
  //save("snapshot2.png");
  background(140, 80, 160);
}
void mousePressed()
{
  fill(random(255), random(30), random(255),90);
}


