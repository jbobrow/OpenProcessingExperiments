
int a = 0;
int b = 0;
int c = 0;
int d = 600;

void setup(){
size(600,600);
background(250,143,43);

}

void draw(){
  
  while(a < 600){
    strokeWeight(10);
    
  rect(a,b,c,d);
  a = a+20;
  b = b+20;
  c = c+20;
  
  }
  
  noStroke();
  fill(250,143,43);
  rect(0,0,10,600);
  

}



