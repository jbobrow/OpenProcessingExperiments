
void setup(){
  size(400,400);
  background(2,13,82);
}

void draw(){
  
  
  if(mousePressed){

    background(2,13,82);
 noStroke();
  fill(55,65,126,120);
  ellipse(20, height/4, mouseY, mouseX);


  fill(83,98,191,200);
  ellipse(mouseX, height/2, mouseX-150, mouseY);
  
  fill(111,131,255,200);
  ellipse(120, mouseY+100, mouseX/2, mouseY-100);
}
else{
  frameRate(30);
  noFill();
  stroke(55,65,126,120);
  ellipse(20, height/4, mouseY, mouseX);
  
  stroke(83,98,191,200);
   noFill();
   ellipse(mouseX, height/2, mouseX-150, mouseY);
  
  stroke(111,131,255,200);
   noFill();
 ellipse(120, mouseY+100, mouseX/2, mouseY-100);
}
}
