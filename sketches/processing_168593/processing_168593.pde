
float a = 0;
int b = 0;
float c = 0;

void setup() {
  size(500, 500);
  background(200);
}

void draw(){
  
  noFill();
  ellipse(a,c,b,b);
  line(b,b,a,200);
  c = b+0.1;
  stroke (b,a,190,c);
  
  a++;
  b++;
  c++;
  
  noFill();
  quad(38, a, 86, c, b, 63, a, 76);
  line(b,c,b,a);
  stroke(a,50,b,50);
 
  a++;
  b++;
  c++;
  noFill();
  rect(38, 31, 86, c, b, 63, a, 76);
  line(200,b,a,c);
  c = b+0.1;
  stroke (210,a,0,c);
  
  a++;
  c++;
  
  noFill();
  triangle(30, c, 58, b, a, 75);
  line(b,c,b,a);
  stroke(a,10,b,c);
 
  a++;
  c++;
}


