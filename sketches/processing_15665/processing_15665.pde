
//Original code by PARK KYU RYANG

void setup(){
  size(500,500);
colorMode(HSB);
}
  
void draw(){
  noStroke();
  for(int a=0; a<500; a=a+20)
  for(int b=0; b<500; b=b+20)
  {
  fill(random(100),random(100),100);
  
rect(a,b,40,40);
  
  }
   
}

