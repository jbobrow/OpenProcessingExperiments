
int x;
int c; 
void setup(){
  size (600,400);
}

void draw(){
  background(255); 
 fill(c); 
 rect (x,0,width/3, height);
 
  if (mouseX< width/3){
   x =0;
  }else if(mouseX< 2*width/3){
  x = width/3;

  }else{
    x = 2*width/3;
  }
}
