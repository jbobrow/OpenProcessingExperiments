


void setup(){
 size(600,400); 
}

void draw(){
  background(255,0,0); 
  ellipse(mouseX, mouseY, 50, 50);
  fill(255);
  ellipse(300,200, 200, 200);
  fill(155);
  if (mousePressed == true){
    ellipse(300, 200, 200, 200);
    line(250, 200, 350, 200);
    fill(155);
    ellipse(275, 200, 40, 40);
    ellipse(325, 200, 40, 40);
    fill(255);
    arc(300, 225, 100, 100, 0, PIE, CHORD);

  } else{
  background(255,0,0); 
  ellipse(mouseX, mouseY, 50, 50);
  fill(255);
  ellipse(300,200, 200, 200);
  fill(155); 
  }  
}
