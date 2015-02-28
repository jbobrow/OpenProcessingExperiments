
void setup() {
  size(200,200);
}

void draw() {
  // Try moving background() to setup() and see the difference!
  background(mouseX,89,mouseY);

  // draw Body
  stroke(0);
 fill(mouseX,0,mouseY); 
  rectMode(CENTER);
  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  rect(mouseX,mouseY,50,50);  
  
 //draw eyes
  fill(mouseX, 20, mouseY);
  ellipse(mouseX-15,mouseY-30,16,32); 
  ellipse(mouseX+15,mouseY-30,16,32); 

//draw pupils
fill(0);
  ellipse(mouseX-15,mouseY-30,4,6); 
  ellipse(mouseX+15,mouseY-30,4,6); 

//draw legs
stroke(0);
  // The legs are drawn according to the mouse location and the previous mouse location.
  line(mouseX-10,mouseY+25,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+25,pmouseX+10,pmouseY+60);


  
}
 
                
