
void setup(){
  size(600,500);
  background(80);
  smooth();
  
  rectMode(CENTER);
  translate(width/2,height/2);
  
  strokeWeight(10);
  stroke(40,200,83);
  line(0,-50,0,400);
  
  fill(255,158,0);
  noStroke();
  rect(0,200,580,100);
  
  strokeWeight(10);
  stroke(255);
  fill(255,255,0);
  ellipse(0,-50,50,50);
  translate(0,-50);
  
  pushMatrix();
  int i=0;
  for (i=0; i<=20; i++)
  {
    rotate(radians(360/20));
    fill(215,50,200);
    strokeWeight(4);
    stroke(139,35,134);
    ellipse(0,-60,20,60);
  }
  popMatrix();
  
  translate(0,150);
  rotate((2*PI)/-3.2);
  ellipseMode(CORNER);
  strokeWeight(2);
  stroke(40,160,83);
  fill(40,200,83);
  ellipse(0,0,15,40);     
}



