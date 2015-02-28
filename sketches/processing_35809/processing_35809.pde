
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
 strokeWeight(2);
background(0);
 stroke(255, 0, 0);
 
ellipse(mouseX, mouseY, b, b);
  
  stroke(255, 0, 0);
 
  ellipse(mouseX, mouseY,c , c);
   
   ellipse(mouseX, mouseY,d , d);
    
   ellipse(mouseX, mouseY,e , e);
    
   ellipse(mouseX, mouseY,f , f);
  
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

