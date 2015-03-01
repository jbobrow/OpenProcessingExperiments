
void setup()
{
  size(1820, 1000); //window size
  ellipse(50, 50, 100, 100);


  //size(600,600);
  //ellipse(300,300,600,600);
  for (int i=0; i<500; i++) {
    ellipse(random(0, 910), random(0, 500), random(0, 1600), random(0, 900)); //ellipse(center x coord, center y coord, x axis size, y axis size)
    fill(random(0, 255), random(0, 255), random(0, 255),random(0, 255));
  }
}
void draw()
{
  fill(random(255),random(255),random(255),random(255));
  ellipse(random(1820), random(1000),random(500), random(500));
  
  
  fill(random(0, 255), random(0, 255), random(0, 255),random(0, 255));
  ellipse(mouseX, mouseY, 20, 20);
}

