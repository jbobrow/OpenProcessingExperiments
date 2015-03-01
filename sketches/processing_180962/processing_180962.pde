
void setup(){
  background(255);
  size(400, 300);
  
  rectMode(CORNER);
  fill(255, 0 , 0, 150);
  stroke(255);
  rect(0, 0, width/2, height/2);
  fill(#5AB759);
  rect(width/2, height/2, width/2, height/2);
  fill(#EAFA44);
  rect(0, height/2, width/2, height/2);
  fill(150);
  rect(width/2, 0, width/2, height/2);
  
//  rectMode(CORNERS);
//  fill(#41DDED, 150);
//  noStroke();
//  rect(width/6, height/6, width - width/6, height - height/6);
  
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  fill(#A434CE, 100);
  rect(width/2, height/2, width/4, height/4);
  fill(#E82C71, 120);
  ellipse(width/2, height/2, width/4, height/4);
  
}


