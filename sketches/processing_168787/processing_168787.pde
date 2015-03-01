
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  noStroke();
  fill(random(255),100,255,200);
  
  if(mousePressed == true) { //add some interaction
    int shape = random(1, 4);
    
    if( int(shape) == 1)
      rect(mouseX, mouseY, 20, 20);
      
    else if( int(shape) == 2)
      triangle(mouseX, mouseY, mouseX - 12, mouseY + 15, mouseX + 12, mouseY + 15);
      
    if( int(shape) == 3)
      ellipse(mouseX, mouseY, 20, 20);
  }
}
