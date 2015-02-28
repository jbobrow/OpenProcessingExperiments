
int a = 0;
int b = 0;
int c = 250;

void setup(){
  size(1000,500);
  background(242,216,167);
  smooth();
  noStroke();
  
}

void draw(){

  fill(0,54,71);
  ellipse(a,b,c,c);
  
  a = a + 250;
  
  if(a>1000){
    a = 0;
    b = b + 250;}
    
}

