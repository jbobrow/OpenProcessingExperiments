
int a = 0;
int b = 5;
int c = 5;
int d = 5;
int e = 5;
int f = 5;
int trans = 160;
void setup()
{
size(700,400);
background(0);
}

void draw()
{
 noFill();
 stroke(255,0,0);

background(0);
 stroke(255, 0, 0);

ellipse(width/2, height/2, b, b);
 
  stroke(255, 0, 0);

  ellipse(width/2, height/2,c , c);
  
   ellipse(width/2, height/2,d , d);
   
   ellipse(width/2, height/2,e , e);
   
   ellipse(width/2, height/2,f , f);
 
}

void mouseDragged() 

{
  b = b + 10;
  if (b > 800) {
   
 
  }
    c = c + 8;
  if (c > 800) {
   
  }

 d = d + 6;
  if (d > 800) {
   
  } 
 e = e + 4;
  if (e > 800) {
   
  } 
   
   f = f + 4;
   if (f > 800) {
   
  } 
  

 
}



