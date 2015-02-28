
float x=0;
float y=0;
float p=0;
float q=0;
float a=0;
float c=0;
float d=0;
float l=0;
float n=0;
float z=0;
float j=0;
float f=0;
float e=0;
int m=3;

void setup()
{
  smooth();
  size(600,600);
  y=height/1;
  q=height/2;
  noStroke();
}
  
  


void draw()
{
 fill(0,10);
 rect(0,0,width,height);

  fill(102,255,102);
  ellipse (x,y,20,20);
  
    if (x<width) {
    x+=1;
  }
 else {
    x=0;
  }
  
  if (x<100) {
    x+=1;
  }
    if (x>100) {
      x+=1;
      y-=1;
   }
   if (x>200) {
     x+=(radians(45));
     y+=(radians(165));
   }
   if (x>400) {
     x+=(radians(0));
     y+=(radians(-300));
   }
   if (x>475) {
     x+=(radians(1));
     y+=(radians(192));
 
  
x++;
   }
  fill(102,255,102);
  ellipse (p,q,20,20);
     
     if (p<width) {
    p+=1;
  }
 else {
    p=0;
  }
    if (p>75) {
      p+=1;
      q-=1;
   }
   if (p>150) {
     p+=(radians(45));
     q+=(radians(165));
   }
   if (p>300) {
     p+=(radians(0));
     q+=(radians(-300));
   }
   if (p>400) {
     p+=(radians(1));
     q+=(radians(192));
   }
 

  
  p++;


  fill(10,235,50);
  ellipse(c,d,20,20);
   
  c+=cos(radians(45))*1;
  d+=sin(radians(a))*0.9;
  a++;


  fill(10,235,50);
  ellipse(l,n,20,20);
   
  l+=cos(radians(45))*2;
  n+=sin(radians(a))*1.8;
  a++;
  
   fill(10,235,50);
  ellipse(z,j,20,20);
   
  z+=cos(radians(45))*4;
  j+=sin(radians(a))*3.6;
  a++;
    fill(10,235,50);
  ellipse(f,e,20,20);
   
  f+=cos(radians(45))*10;
  e+=sin(radians(a))*5;
  a++;
}

