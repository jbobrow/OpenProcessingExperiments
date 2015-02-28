
int myX;
int myY;
int lng;
int cols;
int rows;

void setup()
{
  size ( 640, 480)  ;
  
  lng =30;

  cols = width/lng;
  rows = height/lng;
  println( cols + " "  + rows);
  
  smooth();
  noLoop();
}
 
 
void draw ()
{
 
  //colours
  fill(135, 52,150);
  background (38,160,210);
  stroke (255,255,255);
  strokeWeight(lng*0.1);
   
  myX=10;
 

  for (int  r = 0;  r< rows; r++ )
  {
   myY=10;
  myY += lng * r;
   println( "y " + myY);
  int c;
  for (c = 0;c <cols; c++)
  {
    fill(random(255), random(255),random(255));
    quad ( myX + (lng*c), myY, myX + lng+ (lng*c), myY+lng, myX+ (lng*c), myY+lng, myX+lng+ (lng*c), myY);
    ellipse(myX + (lng*c) ,myY + lng/2,lng/3, lng/3);
     
  }
  println (frameCount);
  //i++;
   
  ellipse(myX + (lng*c) ,myY + lng/2,lng/3, lng/3);
  }
  
   
}


