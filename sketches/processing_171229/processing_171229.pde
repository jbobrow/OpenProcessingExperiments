
void setup()
{
size(600,600);
background(255); 
frameRate(30);
  
}
  int strokeR = 40;
int strokeG = 40;
int strokeB = 40;
int strokeA = 20;
void draw()
{

  if (frameCount <= 300)
  {
   strokeR += 1;
   stroke(strokeR,0,0);
   noFill();
  }
  if (frameCount >=300 && frameCount <=600)
  {
   strokeB += 1;
   stroke(0,strokeB,0);
   noFill();
  }
  if (frameCount >=600 && frameCount <=900)
  {
   strokeG += 1;
   stroke(0,0,strokeG);
   noFill();
  }
  if (frameCount >=900 && frameCount <=1200)
  {
   strokeA += 1;
   stroke(strokeA);
   noFill();
  }
  rotate(millis()); 
  fill(155,30);
  strokeWeight(random(1,3));
 rect(100,100,150,150); 
 rect(50,100,50,100); 
 rect(200,200,250,250);
 rect(300,200,300,200);
 rect(20,40,20,40);
 rect(10,20,10,20);
 rect(5,10,5,10);
 rect(40,60,40,60);
 rect(400,350,400,350);
}


