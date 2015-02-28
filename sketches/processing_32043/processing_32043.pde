
int a = 0;
int b = 0;
int c = 50;

void setup(){
  size(1000,500);
  background(242,216,167);
  strokeWeight(5);
  stroke(0,54,71,100);
  smooth();
  
}

void draw (){
  fill(212,46,13,50);
  ellipse(a,b,c,c);
  
  a = a + 25;
  
  if(a>1000){
    a = 0;
    b = b + 25;}
  
}

