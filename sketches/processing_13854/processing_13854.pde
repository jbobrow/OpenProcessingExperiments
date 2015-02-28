
void setup(){
  size(200,200);
colorMode(HSB);
}
 
void draw(){
  noStroke();
  for(int a=0; a<220; a=a+20)
  for(int b=0; b<220; b=b+20)
  {
  fill(random(200),random(100),200);
 
ellipse(a,b,40,40);
 
  }
  
}
            
