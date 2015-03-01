
float a = 0;
int b = 0;
float c = 0;

void setup() {
  size(500, 500);
  background(255);
}

void draw(){
  
  noFill();
  ellipse(a,c,b,b);
  line(b,b,a,200);
  c = b+0.1;
  stroke (150,a,0,c);
  
  a++;
  b++;
  
  noFill();
  ellipse(b,c,a,a);
  line(b,c,b,a);
  stroke(a,100,b,c);
 
  a++;
  b++;
  noFill();
  ellipse(a,c,b,b);
  line(b,b,a,200);
  c = b+0.1;
  stroke (150,a,0,c);
  
  a++;
  c++;
  
  noFill();
  ellipse(b,c,a,a);
  line(b,c,b,a);
  stroke(a,100,b,c);
 
  a++;
  c++;
}


