
int a = 0;
int b = 0;
int c = 30;

void setup(){

 
 size(500,500);
 background(255);
 noStroke();

  
}

void draw(){

  while(a < 600){
  fill(0,30);
  ellipse(a, b, c, c);
  c = c + 30;
  ellipse(a,b,c,c);
  c = c-30;  
  c = c + 1;
  a = a + 50;
  }
  a=0;
  b=b+50;
  
 
 
  
 }
 
  


