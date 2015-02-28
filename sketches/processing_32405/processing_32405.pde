


int a = 50;
int b = 50;
int c = 100;
int d = 100;

int e = 500;
int f = 50;


void setup(){
  size(250,500);
  background(255);

  strokeWeight(1);
  noFill();
  noLoop();
}

void draw(){
 
 while (b < 500){ 
 while(a < e){
  stroke(255,0,209);
  ellipse(a, b, c, d);
  a = a + 50;
   }
  b = b + 6; 
  f = f + 3;
  a = f;
  e = e - 3;
  }
  
  a = 0;
  b = 459;
  d = 100;
  c = 100;
  e = 500;
  f = 50;
  while (b > 0){ 
 while(a < e){
  stroke(random(0,169),random(0,189), random(255,255));
  ellipse(a, b, c, d);
  a = a + 50;
   }
  b = b - 6; 
  f = f + 3;
  a = f;
  e = e - 3;
  }

  a = 50;
  b = 50;
  d = 100;
  c = 100;
  e = 500;
  f = 50;
  while (a < 500){ 
 while(b < e){
  stroke(random(0,169),random(0,189), random(255,255));
  ellipse(a, b, c, d);
  b = b + 50;
   }
  a = a + 6; 
  f = f + 3;
  b = f;
  e = e - 3;
  }
  
  
  
  a = 459;
  b = 50;
  d = 100;
  c = 100;
  e = 500;
  f = 50;
  while (a > 0){ 
 while(b < e){
  stroke(random(0,169),random(0,189), random(255,255));
  ellipse(a, b, c, d);
  b = b + 50;
   }
  a = a - 6; 
  f = f + 3;
  b = f;
  e = e - 3;
  }
   

}

