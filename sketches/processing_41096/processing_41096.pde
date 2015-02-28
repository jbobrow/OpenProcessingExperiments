
void setup(){
  size(400, 400);
  smooth();
}

void draw(){
//background(200);

noStroke();
fill(255,2);
rect(0, 0, width, height);

  stroke(0);
  strokeWeight(1);
  
  if(mousePressed){

    //cerchi
    
    fill(255, 8);
    
    stroke(255, 255, 255);
    strokeWeight(1);
    
  ellipse(mouseX, mouseY, 240, 240);
}
  
  line(0, 0, mouseX, mouseY);
  line(width, height, mouseX, mouseY);
  
    line(width, 0, mouseX, mouseY);
    line(0, height, mouseX, mouseY);
    
        line(200, 0, mouseX, mouseY);
        line(200, 400, mouseX, mouseY);
        
           line(0, 200, mouseX, mouseY);
           line(400, 200, mouseX, mouseY);
    
}

