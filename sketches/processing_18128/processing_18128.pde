
//drawing progam (sparkle motion)
//by Jason Fitzgerald
//Week 1

void setup(){
  background(0);
  size(600,600);
  smooth();
}

void draw(){
  
  fill(235,0,231,15);
  stroke(0,255,253,10);
  ellipse(mouseX,mouseY,25,1);
  println(mouseX);
  println(mouseY);
  stroke(203,255,0,15);
  
  ellipse(mouseX + random(-50,50), mouseY + random(25), 5, -75);
  stroke(255,255,0,15);
  ellipse(mouseX + random(-50,50), mouseY + random(25), 5, -50);
  stroke(200,255,0,15);
  ellipse(mouseX + random(-50,50), mouseY + random(50), 70, 5);
}
                
                
