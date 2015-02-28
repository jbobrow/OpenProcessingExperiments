
float x;
float y;
void setup() { 
  size(400, 400);
  background(0);  
  ellipseMode(CENTER);
  strokeWeight(3);
  stroke(10,15,30);
  smooth();
}

void draw() { 
  if(mousePressed == true) { 
     line(mouseX,mouseY,pmouseX,pmouseY);     
  }
  else {
    fill(255,10);
    rect(0,0,width,height); 
  }
}
                
                
