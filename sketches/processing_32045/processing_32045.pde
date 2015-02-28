
int a = 0;
int b = 0;
int c = 35;
int d = 70;

void setup(){
  size(1000,500);
  noStroke();
  background(242,216,167);
  
} 

void draw(){
  
 //bigger circles
 fill(0,54,71,100);
 ellipse(a, b, d, d);
  
 //small circles
 fill(255,20,0,150);
 ellipse(a, b, c, c);
  
 a = a + 40;
 
 if(a>1000){
   
   a = 0;
   b = b + 40;}
 
 
}

