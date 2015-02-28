
void setup(){
  size(700,700);
  background(0,0,0);
}
 
void draw(){
  float r;
  r= random(10,40);
   
smooth();
noStroke();
   

   
  stroke(0);
strokeWeight(5);

 
fill(mouseX,255,mouseY);
ellipseMode(CENTER);
noStroke();
ellipse(mouseX,mouseY,r,r);
 
}

