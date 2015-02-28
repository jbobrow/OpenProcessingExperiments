
void setup()
{
  size(730, 805);
  frameRate(10);
}
 
void draw()
  
{
  background(255,100,100);
  noStroke();
  //fill(0,200,255);
  for (int i = 0; i <9; i++)
  {
    for (int j = 0; j <10; j++)
    {
      pushMatrix();
      translate(i*50+40,j*50 +40);
      rotate(random(PI*j/-54,PI*j/54));
      smileyface(i*25, j*25);
      popMatrix();
   
    }
  }
}


void smileyface(int x, int y)
{
  fill(220,210,0);
  rect(mouseX+0,mouseY+10,50,50);
  fill(0,200,255);
  ellipse(mouseX+42,mouseY+20,10,20);
ellipse(mouseX+8,mouseY+20,10,20);
ellipse(mouseX+25,mouseY+42,40,25);
}
