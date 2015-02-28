
void setup(){
  size(500,700);
}

void draw(){
  background(#ffee55);
  
  fill(234,21,146);
  rect(50,50,50,100);
  
  fill(21,193,234);
  rect(150,50,50,100);
  
  fill(76,24,198);
  rect(250,50,50,100);
  
  fill(252,232,0);
  rect(350,50,50,100);
  
  
  int a=mouseX;
  int b=mouseY;
  
  fill(222,47,20);
  rect(50,200,a,b);
  
  fill(112,66,113);
  rect(150,300,a,b);
  
  fill(58,245,7);
  rect(250,400,a,b);
}  

