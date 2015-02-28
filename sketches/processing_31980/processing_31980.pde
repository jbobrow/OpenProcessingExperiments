
int a = 0;
int b = 0;
int c = 250;
int d = 500;
int e = 500;
int f = 0;
int g = 500;;


void setup(){
  size(500,500);
  background(255);
  strokeWeight(1);
  noFill();
  noLoop();
}

void draw(){
  
  while(d > 10){
    stroke(random(0,169),random(0,189), random(255,255));
  triangle(a, b, c, d, e, f);
  d = d - 10;
  }
  
  d = 500;
  while ( b < 500 ){
    stroke(random(0,169),random(0,189), random(255,255));
  triangle(a, d, c, b, e, g);  
  b = b + 10;
  }
  
  b = 0;  
  while (d > 10) {
    stroke(random(0,169),random(0,189), random(255,255));
  triangle(a, b, d, c, f, e); 
  d = d - 10;  
  }
  
  d = 500;
  while (b < 500){
    stroke(random(0,169),random(0,189), random(255,255));
  triangle(d, a, b, c, e, g);   
  b = b + 10;
}
   b = 0;
  
}
  

