
void setup(){
  size(300,300);
  background(255);
}

int x = 0;

void draw(){
  background(255);
  fill(255);
  ellipse(x,150,50,50);
  x = x + 3;  
  if(x > width + 25){
    x = 0;
  }
  
  println(x);
  
}

