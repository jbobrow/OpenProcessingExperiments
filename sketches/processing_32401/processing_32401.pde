


int a = 250;
int b = 0;
int c = 500;
int d = 500;

int e = 450;



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
  ellipse(a, b, c, d);
  b = b + 6;
  c = c - 6;
  
  }
  
  b = 50;
  c = 500;
  while ( e > 0 ){
     stroke(random(0,169),random(0,189), random(255,255));
  ellipse(a, e, c, d); 
  e = e - 6;
  c = c - 6;
  }
  
  e = 450;
  c = 500;
  while (b < 500) {
      stroke(random(0,169),random(0,189), random(255,255));
  ellipse(b,a,d,c); 
  b = b + 6;
  c = c - 6; 
  }
  
  b = 50;
  c = 500;
  while (e > 0){
    stroke(random(0,169),random(0,189), random(255,255));
  ellipse(e, a, d, c);   
  e = e - 6;
  c = c - 6;
}
 
  
}

