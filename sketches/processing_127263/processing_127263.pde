
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0,0,255);
  
}

void draw() {  //draw function loops 
 
fill(0,0,0);
 rectMode(CENTER);
 rect(120,120,85,150);
 
 fill(0,255,0)
 ellipse (120, 160, 50, 25);//green
 
 fill(255,255,0);
 ellipse(120,120,50,25);
 
fill(255,0,0)
ellipse(120,80,50,25);
 
 
}
