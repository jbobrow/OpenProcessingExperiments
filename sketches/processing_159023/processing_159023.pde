

int x = 0;
int y = 0;
int a = 0;
int b = 0;
int w = 0;
int R = 0;
int G = 0;
int B = 0;
int transparency = 255;
int diameter = 0;
int count = 0;
int state = 0;

void setup()
{
 size(500,500);
 background(0,255,0);
 smooth(); 
}

void draw()
{
  count++;
  if(count > 30)
  {
   count = 0;
   state++;
   if(state > 10)
     {
       state = state * -1;
       println("WEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!!!");
     }  
  }
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  //transparency = int(random(0,255));
  
  x = int(random(width));
  y = int(random(height));
  
  diameter = state * 10;
  
  noStroke();
  fill(R,G,B,transparency);
  ellipse(x,y,diameter,diameter);
  
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  //transparency = int(random(0,255));
  
  x = int(random(width));
  y = int(random(height));
  

  fill(R,G,B,transparency);
  rect(x,y,diameter,diameter);
  
  x = int(random(width));
  y = int(random(height));
  a = int(random(width));
  b = int(random(height));
  w = int(random(10));
  strokeWeight(abs(state));
  
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  
  stroke(R,G,B);
  line(x,y,a,b);
  
}


