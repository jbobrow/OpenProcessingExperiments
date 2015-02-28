
int circu = 80;
int recta = 250;

void setup(){
  size(300,300);
  
}

void draw(){
  background(255);
  
  ellipseMode(CENTER);
  
  fill(255);
  ellipse(width/2,height/2,circu,circu);
  circu = circu+1;
  
  stroke(0);
  fill(150);
  rectMode(CENTER);
  rect(width/2, height/2,recta,recta);
  recta = recta-1;
  
    fill(255);
  ellipse(width/2,height/2,circu,circu);
  circu = circu+1;
}
    

