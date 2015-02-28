
int x;

void setup() {  //setup function called initially, only once
  size(600,200);
  background(255)
  
}

void draw() {  //draw function loops
 background(255)
 rect(30,mouseY,30,80);
 

 ellipse(x+1,50,50,50);
 
 x=x+4
 
}
