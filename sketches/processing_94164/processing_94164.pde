
void setup() {
  // size of box, window
  size(500,500);  
  smooth();
  // The frame rate= how fast it moves throughout the screen, how fast it follows mouse
  frameRate(30);
}

void draw() {
  // color of background, looked up yellow colorr in color selector under 'tools'
  background(#E0FF00);  

// dude's body
  stroke(0);
  fill(#B2FFFA);
  ellipse(mouseX, mouseY,70,80);
  

// dude's head
  stroke(0);
  fill(#B2FFFA);
  ellipse(mouseX,mouseY-30,60,60);
 
 //dude's mouth
   stroke(0);
   fill(255);
   ellipse(mouseX,mouseY-20, 10,10);


 // dude's eyes, eye color is changed by mouse location
    fill(mouseX,0,mouseY); 
    ellipse(mouseX-19,mouseY-30,20,32); 
    ellipse(mouseX+19,mouseY-30,20,32); 

 // dude's legs
    stroke(0);
    // The legs are drawn according to the mouse location and the previous mouse location.
    line(mouseX-10,mouseY+40,pmouseX-10,pmouseY+60);
    line(mouseX+10,mouseY+40,pmouseX+10,pmouseY+60);
  
  // dude's arms, the arms are drawn according to the mouse location and the previous mouse location.
  stroke(0);
  line(mouseX-40, mouseY+10, pmouseX-40, pmouseY+30);
  line(mouseX+40, mouseY+10, pmouseX+40, pmouseY+30);
  
  //couldn't figure out how to add multiple raver dudes and music, maybe flocking affect
}

  


