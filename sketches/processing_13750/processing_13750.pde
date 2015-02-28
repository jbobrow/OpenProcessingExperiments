
void setup(){
  size(200,200);
colorMode(RGB);
}
 
void draw(){
   
  for(int x=0; x<200; x=x+20)
  for(int y=0; y<200; y=y+20)
  {
  stroke(random(250),random(250),random(250));
 line(cos(x*30),random(y),800,100);
//rect(random(x),random(y),20,20);
 
  }
  
}

