

// initialisation
void setup(){
  
 size(400,400); 
  
  
}


void draw(){
  background(255);
  noStroke();
  fill(255,0,0,150);
  rectMode(CENTER);
  rect(mouseX,mouseX,mouseY,mouseY);
  rect(100,mouseY,mouseX,50);
  rect(100,mouseY,70,70);
  fill(0,255,0,150);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  fill(255,255,0,150);
  rect(100,100,50,50);
  fill(0,0,255,150);
  rect(50,100,50,50); 
  println(frameRate);

  
}

