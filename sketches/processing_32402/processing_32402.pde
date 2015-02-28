

int a = 0;
int b = -490;
int c = 500;
int d = 500;

int e = 490;



void setup(){
  size(250,500);
  background(255);

  strokeWeight(1);
  noFill();
  noLoop();
}

void draw(){
  
 while(b < 600){
  stroke(255,0,209);
  rect(a, b, c, d);
  a = a + 3;
  b = b + 10;
  c = c - 6;
  
  }
  
  a = 0;
  b = -490;
  c = 500;
  while ( e > -600 ){
     stroke(random(0,169),random(0,189), random(255,255));
  rect(a, e, c, d); 
  a = a + 3;
  e = e - 10;
  c = c - 6;
  }

  a = 0;
  e = 490;
  c = 500;
  while (a < 600) {
      stroke(random(0,169),random(0,189), random(255,255));
  rect(b,a,d,c); 
  a = a + 3;
  b = b + 10;
  c = c - 6; 
  }
  
  a = 0;
  b = -490;
  c = 500;
  while (e > -600){
    stroke(random(0,169),random(0,189), random(255,255));
  rect(e, a, d, c);   
  e = e - 10;
  a = a + 3;
  c = c - 6;
}
   

}

