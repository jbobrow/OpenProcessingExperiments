


void setup() {  //setup function called initially, only once
  size(150,150);
} 

void draw() {  //draw function loops 

//rectangle traffic light backing
rectMode(CENTER);
ellipseMode(CENTER);
noStroke();
 
//green
fill(195,195,55);
rect(50,50,50,100);
 
//yellow
fill(6,255,6);
ellipse(50,80,25,25);
 
//red
fill(255,255,6);
ellipse(50,50,25,25);
 
fill(255,6,6);
ellipse(50,20,25,25);
noFill();


}
