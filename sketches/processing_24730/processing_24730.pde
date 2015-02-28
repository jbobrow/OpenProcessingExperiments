

int change=0;





void setup(){
  size(400,800);
  
  background(32,167,242);
  smooth();
  
  
}


void draw(){
  
  
  stroke(255,255,255);
  strokeWeight(5);
  line(change,0,change,height);
  change = change+20;
  
  fill(0,0,0);
  stroke(255,255,255);
  strokeWeight(9);
  ellipse(50,100,200,200);
  ellipse(300,600,100,100);
  ellipse(150,730,150,150);
  ellipse(350,380,220,220);
  ellipse(50,340,50,50);
  ellipse(380,50, 70,70);
  
  
  
  fill(49,7,167);
  noStroke();
  triangle(0,400,400,0,0,800);
  
}



