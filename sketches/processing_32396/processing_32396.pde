


float a = 0;
float b = 10;
float c = 500;
float d = 10;

float e = 490;



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
  line(a, b, c, d);
  a = a + 1.5;
  b = b + 3;
  d = d + 3;
  c = c - 1.5;
  
  }
  
  a = 0;
  b = 10;
  c = 500;
  d = 10;
  e = 495;
  while ( e > -100 ){
    stroke(random(0,169),random(0,189), random(255,255));
  line(a, e, c, e); 
  a = a + 1.5;
  e = e - 3;
  c = c - 1.5;
  }
  
  e = 495;
  a = 0;
  b = 10;
  c = 500;
  d = 10;
  while (b < 500) {
      stroke(random(0,169),random(0,189), random(255,255));
  line(b,a,d,c); 
  b = b + 3;
  a = a + 1.5;
  d = d + 3;
  c = c - 1.5; 
  }
  
  a = 0;
  b = 10;
  c = 500;
  d = 10;
  while (e > -100){
    stroke(random(0,169),random(0,189), random(255,255));
  line(e, a, e, c);   
  e = e - 3;
  a = a + 1.5;
  c = c - 1.5;
  
}
   
  
}

