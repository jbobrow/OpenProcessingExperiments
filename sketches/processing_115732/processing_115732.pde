

void setup(){
 background(255);
 noFill();
}

int a=1;

void draw(){
  ellipse(50,50,a,a);
  ellipse(a,a,10,10);
  a += 4; 
  
}


