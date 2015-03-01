
float a = 0;
int b = 0;

void setup() {
  size(500, 500);
  background(255);
}

void draw(){
  
  noFill();
  ellipse(a,a,b,b);
  line(b,b,a,200);
  stroke (150,a,0,b);
  
  a++;
  b++;
  
  ellipse(b,b,a,a);
  line(b,a,200,500);
  stroke(a,100,b,0);
 
  a++;
  b++;
}


