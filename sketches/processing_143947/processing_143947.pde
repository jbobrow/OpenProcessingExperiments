


void setup() {  //setup function called initially, only once
  size(500, 400);
  background(255);  //set background white
 
}
void draw() {  //draw function loops 
  
  
  
  if(mousePressed == true) { //add some interaction
    noFill();
    stroke(random(255), 100,255);
    ellipse(mouseX, mouseY, random(40,80), 30);
    }
    
    if (keyPressed && (key == CODED)){
        if (keyCode == LEFT)  {
        
        rectMode(CENTER);
        rect(mouseX, mouseY, random(40,80), 30);
        }
      
  }
}
