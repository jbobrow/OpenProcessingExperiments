
boolean BGColour;
 
void setup () {
  size(500, 500);
  text("Click and Drag",250,250);
  background(random(0,255),random(0,255),random(0,255));
  BGColour = true;
}
 
void draw () { 
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(abs(mouseX-pmouseX));
  line(pmouseX ,pmouseY ,mouseX ,mouseY );
}
 
void mouseMoved () {
  if (BGColour) {
    background(255);
  }   
  else {
    background(random(0,255),random(0,255),random(0,255));
  text("Click and Drag", mouseX+20,mouseY);
  }
  
  BGColour = !BGColour;
}


