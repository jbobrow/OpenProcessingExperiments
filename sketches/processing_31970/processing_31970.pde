
int a = 250;
int b = 50;
int c = 500;
int d = 100;

int e = 450;



void setup(){
  size(500,500);
  background(255);
  strokeWeight(1);
  noFill();
  noLoop();
}

void draw(){
  
  while(b < 500){
  stroke(random(0,169),random(0,189), random(255,255));
  line(a, b, c, d);
  b = b + 6;
  c = c - 6;
  
  }
  
  b = 50;
  c = 500;
  while ( e > -100 ){
     stroke(random(0,169),random(0,189), random(255,255));
  line(a, e, c, d); 
  e = e - 6;
  c = c - 6;
  }
  
  e = 450;
  c = 500;
  while (b < 500) {
      stroke(random(0,169),random(0,189), random(255,255));
  line(b,a,d,c); 
  b = b + 6;
  c = c - 6; 
  }
  
  b = 50;
  c = 500;
  while (e > -100){
    stroke(random(0,169),random(0,189), random(255,255));
  line(e, a, d, c);   
  e = e - 6;
  c = c - 6;
}
   
  
}

