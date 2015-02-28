
int x = 100;
int y = 200;
int c = 0;
float a = 0;
float b = 0;
float e = 0;
float d = 0;

void setup(){
  size(200,200);
  
}

void draw(){
  
  background(0);
  line(c,x,y,x);
  line(x,c,x,y);
  if((mouseX>c)&&(mouseX<x)&&(mouseY>c)&&(mouseY<x)){
 a=255;
  } 
    
   if((mouseX>c)&&(mouseX<x)&&(mouseY>x)&&(mouseY<200)){
    b=255;
   } 
  if((mouseX>x)&&(mouseX<200)&&(mouseY>c)&&(mouseY<x)){
   e=255;
  } 
    
 
  if((mouseX>x)&&(mouseX<200)&&(mouseY>x)&&(mouseY<200)){
   d=255;
  }
      fill(a);
    rect(c,c,x,x); 
    
    fill(b);
    rect(c,x,x,x);
    
     fill(e);
    rect(x,c,x,x);
    
     fill(d);
    rect(x,x,x,x);
    
    
    
    
 
  a= a - 1;
  b = b - 1;
  e = e - 1;
  d = d - 1;
  
 
  
  
  
  
}

