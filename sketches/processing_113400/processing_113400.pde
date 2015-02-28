
float turn = 0;
float ht = 0;
float bc=475;
//float bc=height-25;
boolean bnce = false;
float rd= 0;
float x=0;


void setup()
{
  size(500,500);
}
void rect2()
{
    pushMatrix();
translate(50, 50);
  rotate(turn);
  scale(1);
  rect(0,0,20,20);
    popMatrix();

}

void draw()
{
  stroke(0);
  float wCenter=width/2;
float hCenter=height/2;
  background(190,190,190);
  color a = color(255);
  fill(a);
  turn += 0.1; 

 
  rectMode(CENTER);
  rect2();
  ht++;
  if (ht>hCenter )
  {
    ht=-ht;
  }
  if (bnce== false)
  {
    if (bc <= hCenter)
    {
      bnce= true;
    }
    else
    {
      bc--;
    }
    
  }
  else
  {
    if (bc>=height-25)
    {
      bnce=false;
    }
    else
    {
      bc++;
    }
  }
  
  rect(wCenter,ht,100,50);
  noStroke();
  color bkg=color(190,190,190);
  fill(bkg);
  rect(wCenter,hCenter,500,55);
    fill(a);
      stroke(0);
    pushMatrix();
    scale(1);
    rect(wCenter,bc,50,55);
    
  popMatrix();
   
   //for (float g = 0; g <= 359; g += 5)
   //{
     rd= radians(x * 10);
     x += 1;
     float y = hCenter + cos(rd) * 20;
      ellipse(x,y,30,30);
   


}



