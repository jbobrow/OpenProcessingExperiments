
void setup() { 
  size(400,400);
}

void draw() { 
//black bg
  background(#CC6600); 
  stroke(255); 
  line(200,0,200,400); 
  line(0,200,400,200);
  
  // Fill a black color 
    noStroke(); 
//fill with white square
  fill(#FF66CC);
  
if (mouseX < 200 && mouseY < 200) { 
  rect(0,0,200,200);
} else if (mouseX > 200 && mouseY < 200) { 
  rect(200,0,200,200); 
} else if (mouseX < 200 && mouseY > 200) { 
  rect(0,200,200,200);
} else if (mouseX > 200 && mouseY > 200) { 
  rect(200,200,200,200);
}
}
                
                
