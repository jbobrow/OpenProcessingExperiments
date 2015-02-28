
void setup()
{
  size(1000, 1000);
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
  rect(mouseX/2+0,mouseY/2+10,50,50);
  fill(0,200,255);
  ellipse(mouseX/2+42,mouseY/2+20,10,20);
ellipse(mouseX/2+8,mouseY/2+20,10,20);
ellipse(mouseX/2+25,mouseY/2+42,40,25);
}

