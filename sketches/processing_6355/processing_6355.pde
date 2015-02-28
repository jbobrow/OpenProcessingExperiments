
float y,x, Y,X;
int s = 50;

void setup()
{
  size(750,750);
  smooth();
  noStroke();
  frameRate(20);
}

void draw()
{
  background(255);
  fill(0,0,0,200);
  

  
  for( X = s; X < width; X+=s*3)
  {
    for( Y = s ; Y < height; Y+=s*3)
    {
      rect (X , Y , s ,s);
      println(x);
     
    }
  }
 
  x = x + (( mouseX - width/2 )  * 0.009) ;
  y = y + (( mouseY - height/2) * 0.009)  ;
  
  
  //int specialX = mouseX - (mouseX % s);
  //int specialY = mouseY - (mouseY % s);

  rect(x, y, s, s);
  



  rect ( mouseX - s/2, mouseY - s/2, s ,s);
  
  
  if ( x >= width + s)
  {
    x = 0 -s;
  }
  
  if ( x <= 0 - s)
  {
    x = width + s * 1.00001;
  }
  
  if ( y >= height + s)
  {
    y = 0 -s;
  }
  
  if ( y <= 0 - s)
  {
    y = height + s * 1.00001;
  }
  
  
  
} 

