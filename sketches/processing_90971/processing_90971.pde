
int [] para = new int [5];
//square
float a = 20;
int speedA = 1;
//ellipse
float b = 360;
int speedB = -1;
//rect
float c = 350;
int speedC = -1;
//triangle
float d1 = random(0,255);
float d2 = random(0,255);
float d3 = random(0,255);
//quad
float e = 380;
int speedE = -1;

void setup ()
{
  size (400,400);
}

void draw ()
{
  background (0,0,255);
  // drawing black region
  fill(0);
  rect (0,0,20,height);
  rect (0,380,width,20);
  rect (380,0,20,height);
  for (int i = 0; i < para.length/2; i ++)
  {
   if((mouseX <= 20 && mouseX > 0) || (mouseX >= 380 && mouseX < 400) || (mouseY >= 380 && mouseY < 400))
   {
    //square 
    fill(255,255,0);
    rect(a,160,40,40);
    a = a + speedA;
    if(a == 340)
    {
      speedA = -1;
    }
    if(a == 20)
    {
      speedA = 1;
    }
    //ellipse
    fill(255,0,255);
    ellipse(b,100,30,30);
    b = b + speedB;
    if(b == 40)
    {
      speedB = 1;
    }
    if(b == 360)
    {
      speedB = -1;
    }
    //quad
    fill(0,255,0);
    quad(e,280,380,280,380,300,350,320);
    e = e + speedE;
    if(e == 20)
    {
     speedE = 1;
    }
    if(e == 380)
    {
      speedE = -1;
    }
    //triangle
    fill(d1,d2,d3);
    triangle(150, 0, 120,40,180,40);   
    
    //rectangle
    fill(255,0,0);
    rect(230, c,20,40 );
    c = c + speedC;
    if(c == 0)
    {
      speedC = 1;
    }
    if(c == 340)
    {
      speedC = -1;
    }
   }
  }
}
