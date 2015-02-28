
float r=0;
float s=10;
void setup(){
  size(400,800);
  background(0);
  smooth();
  rectMode(CENTER);
}
void draw(){
 
  
   translate(200, 200);
  rotate(r);
rect(0, 0, 25, 25);
resetMatrix();

  translate(200, 600);
  fill(70,15,random(230));
  rotate(r);
rect(0, 0, 25, 25);
resetMatrix();

  fill(70,15,random(230));
  translate(200,200);
  rotate(r);
  rect(10+r,0,s,s);
  
  resetMatrix();
  fill(70,random(150),70);
  translate(200,600);
  rotate(r);
  rect(10+r,0,s,s);
  r=r+.5;
  
 
}

