
float a = 0;
float b = 0;

void setup() {
  size(500, 500);
  background(255);
}

void draw(){
  
  noFill();
  ellipse(250, 250, a, a);
  a = a+10;
  stroke (a,b,150,100);
  a = a+0.5;
  b = b+0.1;
  
  a++;
  b++;
  
   noFill();
  ellipse(50, 50, a, a);
  a = a+10;
  stroke (a,b+0.1,150,200);
  a = a+0.5;
  b = b+0.1;
  
  a++;
  b++;
}


