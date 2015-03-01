

int x = 0;
int y = 0;
int a = 0;
int b = 0;
int m = 0;
int n = 0;
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
   if(state > 5)
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
  y = int(random(height/3));
  
  diameter = state * 10;
  
  noStroke();
  fill(R,G,B,transparency);
  ellipse(x,y,diameter,diameter);
  
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  //transparency = int(random(0,255));
  
  x = int(random(width));
  y = int(random(2*height/3,height));
  

  fill(R,G,B,transparency);
  rect(x,y,diameter,diameter);
  
  x = int(random(width));
  y = int(random(height/3,2*height/3));
  a = int(random(width));
  b = int(random(height/3,2*height/3));
  w = int(random(10));
  strokeWeight(abs(state));
  
  R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  
  stroke(R,G,B);
  line(x,y,a,b);
  
 /* R = int(random(0,255));
  G = int(random(0,255));
  B = int(random(0,255));
  x = int(random(width/2));
  y = int(random(height/2,height));
  a = int(random(width/2));
  b = int(random(height/2,height));
  m = int(random(width/2));
  n = int(random(height/2,height));
  
  fill(R,G,B,transparency);
  triangle(x,y,a,b,m,n);*/
  
}


