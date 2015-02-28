


int a = 0;
int b = 0;
int c = 500;
int d = 6;


void setup(){
  size(250,500);
  background(255);

  strokeWeight(3);
  noFill();
  noLoop();
}

void draw(){
 
 while (b < 500){ 
 while(a < c){
  stroke(255,0,209);
  point(a, b);
  a = a + 6;
   }
  b = b + 6; 
  d = d + 3;
  a = d;
  c = c - 3;
  }
  
  a = 0;
  b = 500;
  d = 6;
  c = 500;
 while (b > 0){ 
 while(a < c){
  stroke(random(0,169),random(0,189), random(255,255));
  point(a, b);
  a = a + 6;
   }
  b = b - 6; 
  d = d + 3;
  a = d;
  c = c - 3;
  }

  a = 0;
  b = 0;
  d = 6;
  c = 500;
  while (a < 500){ 
 while(b < c){
  stroke(random(0,169),random(0,189), random(255,255));
  point(a, b);
  b = b + 6;
   }
  a = a + 6; 
  d = d + 3;
  b = d;
  c = c - 3;
  } 
  
  
  
  a = 0;
  b = 500;
  d = 6;
  c = 500;
 while (b > 0){ 
 while(a < c){
  stroke(random(0,169),random(0,189), random(255,255));
  point(b, a);
  a = a + 6;
   }
  b = b - 6; 
  d = d + 3;
  a = d;
  c = c - 3;
  }
   

}

