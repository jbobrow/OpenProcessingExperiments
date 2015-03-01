
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
  stroke (255,a,0,c);
  
  a++;
  b++;
  c++;
  
  noFill();
  ellipse(b,c,a,a);
  line(b,c,b,a);
  stroke(a,50,b,c);
 
  a++;
  b++;
  c++;
  noFill();
  ellipse(a,c,200,b);
  line(200,b,a,c);
  c = b+0.1;
  stroke (150,a,0,c);
  
  a++;
  c++;
  
  noFill();
  ellipse(b,c,a,100);
  line(b,c,b,a);
  stroke(a,100,b,c);
 
  a++;
  c++;
}


