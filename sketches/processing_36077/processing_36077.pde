

 void setup(){
  size(800,700);
 background(0,0,0);
  
  fill(255);
  smooth();
}

void draw(){
 
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,100,185,185);
 
  fill(5,1,1);
  rect(45,80,50,10);
  fill(5,1,1);
  rect(110,80,50,10);
  fill(5,1,1);
  rect(98,100,10,10);
  
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,100,185,185);
  
  fill(5,1,1);
  rect(245,80,50,10);
  fill(5,1,1);
  rect(310,80,50,10);
  fill(5,1,1);
  rect(296,100,10,10);
  
  fill(255);
  ellipse(500,100,185,185);

  fill(5,1,1);
  rect(440,80,50,10);
  fill(5,1,1);
  rect(505,80,50,10);
  fill(5,1,1);
  rect(493,98,10,10);
  
  fill(255);
  ellipse(700,100,185,185);

  fill(5,1,1);
  rect(440,80,50,10);
  
  fill(mouseX,mouseY,31,15);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,300,185,185);
    
  fill(mouseX,mouseY,31);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,300,165,165);
    
  fill(255);
  ellipse(325,275,20,20);
    
  fill(255);
  ellipse(275,275,20,20);
    
  strokeWeight(10);
  stroke(255);
  line(275,325,325,325);
  }

