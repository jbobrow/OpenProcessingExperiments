
//Em F, CP1 mods 4-5, Functions and Animations
int x = 0;
int changex = 1;
int c = A;
void setup()
{
  size(300, 300);
  smooth();
  noFill();
  background(#000000);
}
void draw()
{
  fill(#000000, 15);
  stroke(#000000);
  rect(0, 0, 300, 300);
  //horizontal
  //right
  stroke(#14cA64);
  ellipse(x, 100, 20, 20);
  stroke(#F589c5);
  ellipse(x, 200, 20, 20);
  //left
  stroke(#FFFcFF);
  ellipse(300-x, 150, 20, 20);
  stroke(#265Ac7);
  ellipse(300-x, 50, 20, 20);
  stroke(#37F3c8);
  ellipse(300-x, 250, 20, 20);
  //vertical
  //up
  stroke(#47A0c7);
  ellipse(150, 300-x, 20, 20);
  stroke(#652Ac3);
  ellipse(50, 300-x, 20, 20);
  stroke(#c745cA);
  ellipse(250, 300-x, 20, 20);
  //down
  stroke(#F6c58A);
  ellipse(100, x, 20, 20);
  stroke(#2c583F);
  ellipse(200, x, 20, 20);
  x = x+changex;
  if (x > 290)
  {
    changex = -1;
  }
  if (x < 10)
  {
    changex = 1;
  }
}
