
//picasso-like distorted alter ego

void setup() 
{
  size(250,300);
  background(#003400);
  println("Elise Butler - Picasso style");
  smooth();
}
//**********************************************************************************************************************
void draw()
{
  
  float x = mouseX;
  float y = mouseY;
  int a,b; 
  a=10;
  b=12;
    profile(a,b); //do a side view of the face instead of a front view? Change name of function if this does not work out.
    face();
    hair(x,y);
    body();
    legs();
    legs();
  }
//**********************************************************************************************************************
void hair(float x, float y)
{
  if(mousePressed)//this makes spray paint-like hair in circles - restrained
  {
    for(int i=0; i<10;i++)
 {
   float radius = random(30); 
   float angle=random(TWO_PI);
   float r=radius*sin(angle);
   float s= radius *cos(angle);
   ellipse(mouseX+x,mouseY+y, 2,2);
 }

  }
 else
   amenities();
}
//**********************************************************************************************************************
void face()  //function includes face, mouth, and a call to the eyes() function
{
//quad(x1, y1, x2, y2, x3, y3, x4, y4);

  quad(38, 31, 86, 20, 69, 63, 30, 76); //face
  //line(37, 43,39, 40);
  //*************************************************
   line(86,50, 75, 25);  // MOUTH 
   //WORK ON THIS IF POSSIBLE
   //**************************************************
  fill(#27282C);

  eyes();
}
//**********************************************************************************************************************
void arms()
{
}
//**********************************************************************************************************************
void profile(int a, int b)
{
   if(b>a)
  {
    triangle(60, 20, 75, 35,75,45); //20 used to be 100
  }
 // else
  //   line(86,50, 75, 25);
   //line(600,30,25,80);
   //line(25,80,75,50);
   
   //mouth - draw across little quad thing with eyes on it.
}
//**********************************************************************************************************************
void body()
{
 // rect(70,32,32,64);
}
//**********************************************************************************************************************
void eyes()
{
  ellipse(42, 42, 5, 5);
  ellipse(56, 42, 5, 5);
}
//**********************************************************************************************************************
void legs()
{
  //rect(10,70,32,50);
 // rect(10,70,32,50);
  if (keyPressed) 
  {
   // rect(45,100,42,70);
    rect(40,32,32,100);
  }
 // if (mousePressed)
 // {
 //   amenities();
 //y }
  
}
//**********************************************************************************************************************
void amenities()
{
 line(pmouseX,42,72,pmouseY); 
}
//**********************************************************************************************************************


