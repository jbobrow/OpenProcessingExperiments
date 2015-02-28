


  
float angulo=0.0;
int x;
int y;
void setup(){
  
  frameRate(80);
  size(429,350);
  smooth();
  x=0;
}
void draw(){
 background(2);
  translate(200,x);
  rotate(angulo);

fill(333,666,100);
//noStroke();
  rect(-30,-30,30,30);
  angulo=angulo+330;
  x=x+1;
  
  if (x>345){
    x=345;
    angulo=1;
 
    
    
}
}

