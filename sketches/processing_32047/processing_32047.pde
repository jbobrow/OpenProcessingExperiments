
int a= 0;
int b= 0;
int c= 50;

void setup(){
  
  size(1000,500);
  background(242,216,167);
  smooth();
  noStroke();
  
  
}

void draw(){
  
  fill(255,55,0,80);
  ellipse(a,b,c,c);
  
  a = a + 55;
  
  if(a>1000){
    a = 0;
    b = b + 55;}
    
  c = c + 10;  
    
  if(c>130){
    c = 50;}
}

