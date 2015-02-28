
int a= 0;
int b= 0;
int c= 50;
int d= 90;


void setup(){
  
  size(1000,500);
  background(0,54,71);
  smooth();
  noStroke();
  
  
}

void draw(){
  
  //Black circles
  fill(212,106,57,100);
  ellipse(a,b,d,d);
  
  //White Circles
  fill(242,216,167,80);
  ellipse(a,b,c,c);
  
  a = a + 40;
  
  
  if(a>1000){
    a = 0;
    b = b + 90;}
   
  c = c + 20;
  
  if(c>90){
   c = 20 - c;}
  
  if(c<50){
   c = c + 20;}
   
   
     
   
}

