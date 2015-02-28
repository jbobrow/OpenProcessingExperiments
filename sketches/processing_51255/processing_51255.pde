
void setup() {
  // Set the size of the window
  size(500, 500);
  smooth();
  background(200);
}
void draw() {
  //set stroke and fill to variable
  stroke(mouseX);
  fill(0,0,0,mouseX/4);
  beginShape(TRIANGLES);
  vertex(mouseX,mouseY);
  vertex(mouseX+10,mouseY-50);
  vertex(mouseX+10,mouseY);
  frameRate(30);
  endShape();
}

void mousePressed() {
  stroke(255);
  //var black lower L. large circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX+25,mouseY+30,80,80);
  
  //white lower L.med. circle
  fill(255);
  ellipse(mouseX+25,mouseY+30,60,60);
  
  //var black lower R med. circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX-25,mouseY+30,70,70);
  
  //white lower R med. circle
  fill(255);
  ellipse(mouseX-25,mouseY+30,50,50);
  
  //var black sm.med. R. circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX-20,mouseY,60,60);
  
  //var black sm.med. L circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX+25,mouseY,60,60);

  //white sm.med. L circle
  fill(255);
  ellipse(mouseX+25,mouseY,40,40);
    
  //white upper med circle
  fill(255);
  ellipse(mouseX-20,mouseY,40,40);
      
  //var black upper sm. center circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX,mouseY,40,40);
    
  //var black lower L. sm.med circle
  fill(0,0,0,mouseX/4);;
  ellipse (mouseX+25,mouseY+30,40,40); 
    
  //var black upper little R circle
  fill(0,0,0,mouseX/4);
  ellipse(mouseX-20,mouseY,25,25);
   
  //white upper little center circle (mouseX: was originally 225, mouseY: was orig. 250)
  fill(255);
  ellipse(mouseX,mouseY,25,25);
      
  //white lower L. sm. circle
  fill(255);
  ellipse(mouseX+25,mouseY+30,25,25);
}

void keyPressed() {
  background(mouseX);
}

