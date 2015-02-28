


int a = 0;
int b = 0;
int c = 500;
int d = 100;

int e = 400;



void setup(){
  size(250,500);
  background(255);

  strokeWeight(1);
  noFill();
  noLoop();
}

void draw(){
  
  while(b < 500){
  stroke(255,0,209);
  rect(a, b, c, d);
  a = a + 3;
  b = b + 6;
  c = c - 6;
  
  }
  
  a = 0;
  b = 0;
  c = 500;
  while ( e > -100 ){
     stroke(random(0,169),random(0,189), random(255,255));
  rect(a, e, c, d); 
  a = a + 3;
  e = e - 6;
  c = c - 6;
  }

  a = 0;
  e = 400;
  c = 500;
  while (a < 500) {
      stroke(random(0,169),random(0,189), random(255,255));
  rect(a,b,d,c); 
  a = a + 6;
  b = b + 3;
  c = c - 6; 
  }
  
  a = 0;
  b = 0;
  c = 500;
  while (e > -100){
    stroke(random(0,169),random(0,189), random(255,255));
  rect(e, a, d, c);   
  e = e - 6;
  a = a + 3;
  c = c - 6;
}
 
  
}

